using GIP.App_Code;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Grants.App_Code;
using Newtonsoft.Json;
using RestSharp;
using System.Threading;

namespace GIP.Admin
{
    public partial class Login : System.Web.UI.Page
    {

        BasicString Basic = new BasicString();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminUnVerifiedUserEmail"] != null)
            {
                Response.Redirect("VerifyUser.aspx");
            }

        }
        protected string Generate_otp()
        {
            char[] charArr = "0123456789".ToCharArray();
            string strrandom = string.Empty;
            Random objran = new Random();
            for (int i = 0; i < 6; i++)
            {
                //It will not allow Repetation of Characters
                int pos = objran.Next(1, charArr.Length);
                if (!strrandom.Contains(charArr.GetValue(pos).ToString())) strrandom += charArr.GetValue(pos);
                else i--;
            }

            return strrandom;
        }
        public bool IsReCaptchValid()
        {
            var result = false;
            var captchaResponse = Request.Form["g-recaptcha-response"];
            var secretKey = "6Lf9_goqAAAAABeNyttoiOwMLsCNfdAo_c4dmMma";
            var apiUrl = "https://www.google.com/recaptcha/api/siteverify?secret={0}&response={1}";
            var requestUri = string.Format(apiUrl, secretKey, captchaResponse);
            var request = (HttpWebRequest)WebRequest.Create(requestUri);

            using (WebResponse response = request.GetResponse())
            {
                using (StreamReader stream = new StreamReader(response.GetResponseStream()))
                {
                    JObject jResponse = JObject.Parse(stream.ReadToEnd());
                    var isSuccess = jResponse.Value<bool>("success");
                    result = (isSuccess) ? true : false;
                }
            }
            return result;
        }
        public bool ValidateReCaptcha(ref string errorMessage)
        {
            var gresponse = Request["g-recaptcha-response"];
            var secretKey = "6Lf9_goqAAAAABeNyttoiOwMLsCNfdAo_c4dmMma";
            string ipAddress = GetIpAddress();

            var client = new WebClient();

            string url = string.Format("https://www.google.com/recaptcha/api/siteverify?secret={0}&response={1}&remoteip={2}", secretKey, gresponse, ipAddress);

            var response = client.DownloadString(url);
            //HttpClientHandler handler = new HttpClientHandler()
            //{
            //    Proxy = new WebProxy("http://10.0.52.250:8080"),
            //    UseProxy = true,

            //};

            var captchaResponse = JsonConvert.DeserializeObject<ReCaptchaResponse>(response);

            if (captchaResponse.Success)
            {
                return true;
            }
            else
            {
                var error = captchaResponse.ErrorCodes[0].ToLower();

                switch (error)
                {
                    case ("missing-input-secret"):
                        errorMessage = "الرمز السري مفقود.";
                        break;
                    case ("invalid-input-secret"):
                        errorMessage = "الرمز السري غير صحيح.";
                        break;
                    case ("missing-input-response"):
                        errorMessage = "عنصر مفقود.";
                        break;
                    case ("invalid-input-response"):
                        errorMessage = "عنصر غير صحيح.";
                        break;
                    default:
                        errorMessage = "خطأ في reCAPTCHA. يرجى المحاولة مرة أخرى!";
                        break;
                }



                return false;
            }
        }
        string GetIpAddress()
        {
            var ipAddress = string.Empty;

            if (Request.ServerVariables["HTTP_X_FORWARDED_FOR"] != null)
            {
                ipAddress = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            }
            else if (!string.IsNullOrEmpty(Request.UserHostAddress))
            {
                ipAddress = Request.UserHostAddress;
            }

            return ipAddress;
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string errorMessage = string.Empty;
                bool isValidCaptcha = ValidateReCaptcha(ref errorMessage);
                Page.Validate();

                if (isValidCaptcha)
                {

                    try
                    {
                        var options = new RestClientOptions("https://10.0.216.29");
                        var client = new RestClient(options);
                        var request = new RestRequest("/Ldap_API/Contract/isAuthunticated", Method.Post);
                        request.AddHeader("X-api-key", "393b97c4-c179-4c94-baf8-93b0c78751d8");
                        request.AddHeader("Content-Type", "application/json");
                        request.AddHeader("Cookie", "MY-Session=!rHNq8IzuBPm5CQNLYEwypfteGMo3yt63Na6tI2Y1zCnn9Dypap5oPJG2HEzfjjkjUxIHLO3rcdO5M8Yg9U5+G4yF5g7be9VDEcqA4ua+; TS01c5763c=0117b75b7d45e985a238000e2a79e114f4962f8f0fda789d6aed720bf20b97e6b43936a3f5af154ef4f6e9b180ec99d98a1d56d7c94dc5616600dfbfbe0d33162e399af6a0");
                        var body = @"{
                        " + Environment.NewLine + "  \"username\": \"" + username.Text + @""",
                        " + Environment.NewLine + "  \"password\": \"" + Password.Text + @""",
                        " + Environment.NewLine + "  \"domain\": \"" + "moictgov" + @"""
                        " + Environment.NewLine + "}";
                        request.AddStringBody(body, DataFormat.Json);
                        System.Net.ServicePointManager.ServerCertificateValidationCallback = (senderX, certificate, chain, sslPolicyErrors) => true;
                        System.Net.ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls | SecurityProtocolType.Tls11 | SecurityProtocolType.Tls12 | SecurityProtocolType.Ssl3;
                        RestResponse response = client.Execute(request);
                        if (Convert.ToBoolean(response.Content) == true)
                        {

                            var options2 = new RestClientOptions("https://10.0.216.29");
                            var client2 = new RestClient(options2);
                            var request2 = new RestRequest("/Ldap_API/Contract/EmailAddress", Method.Post);
                            request2.AddHeader("x-api-key", "393b97c4-c179-4c94-baf8-93b0c78751d8");
                            request2.AddHeader("Content-Type", "application/json");
                            request2.AddHeader("Cookie", "MY-Session=!rHNq8IzuBPm5CQNLYEwypfteGMo3yt63Na6tI2Y1zCnn9Dypap5oPJG2HEzfjjkjUxIHLO3rcdO5M8Yg9U5+G4yF5g7be9VDEcqA4ua+; TS01c5763c=0117b75b7d45e985a238000e2a79e114f4962f8f0fda789d6aed720bf20b97e6b43936a3f5af154ef4f6e9b180ec99d98a1d56d7c94dc5616600dfbfbe0d33162e399af6a0");
                            var body2 = @"{
                        " + Environment.NewLine + "  \"username\": \"" + username.Text + @""",
                        " + Environment.NewLine + "  \"password\": \"" + Password.Text + @""",
                        " + Environment.NewLine + "  \"domain\": \"" + "moictgov" + @"""
                        " + Environment.NewLine + "}";
                            request2.AddStringBody(body2, DataFormat.Json);
                            System.Net.ServicePointManager.ServerCertificateValidationCallback = (senderX, certificate, chain, sslPolicyErrors) => true;
                            System.Net.ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls | SecurityProtocolType.Tls11 | SecurityProtocolType.Tls12 | SecurityProtocolType.Ssl3; ;

                            RestResponse response2 = client2.Execute(request2);
                            JArray jsonarr = JArray.Parse(response2.Content);
                            for (var arrcount = 0; arrcount <= jsonarr.Count - 1; arrcount++)
                            {
                                SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["GIPInatiativesConnectionString"].ConnectionString);
                                SqlDataReader rd;

                                using (con)
                                {

                                    SqlCommand cmdCompany = new SqlCommand("isAdmin", con); // Read user-> stored procedure name
                                    cmdCompany.CommandType = CommandType.StoredProcedure;
                                    cmdCompany.Parameters.Clear();
                                    cmdCompany.Parameters.AddWithValue("@email", jsonarr[arrcount].ToString());
                                    cmdCompany.Parameters.Add("message", SqlDbType.NVarChar, 300);
                                    cmdCompany.Parameters["message"].Direction = ParameterDirection.Output;
                                    con.Open();
                                    cmdCompany.ExecuteNonQuery();
                                    Session["message"] = Convert.ToString(cmdCompany.Parameters["message"].Value);
                                    rd = cmdCompany.ExecuteReader();
                                    rd.Read();
                                    if (rd.HasRows == true)
                                    {
                                        Session["AdminName"] = rd["Company_Name"].ToString();
                                        string otp = Generate_otp();
                                        Session["OTP"] = otp;
                                        Session["Allowed_OTP_Attempts"] = 3;
                                        Session["AdminUnVerifiedUserEmail"] = rd["Company_Email"].ToString();
                                        Session["AdminUnVerifiedUserID"] = rd["Company_No"].ToString();



                                        SendOTP(otp, rd["AdminUnVerifiedUserEmail"].ToString(), Session["UserName"].ToString());
                                        string VerifyLink = "VerifyUser.aspx";
                                        Response.Redirect(VerifyLink, true);
                                    }

                                }
                            }
                            //if not found return UNAUTHORIZED
                        }
                        else
                        {
                            lblMessage1.Text = "unauthorized";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "g-recaptcha", "loadGrecaptcha()", true);
                        }
                    }
                    catch (Exception ex)
                    {

                        if (!(ex is ThreadAbortException))
                        {
                            File.AppendAllText(Server.MapPath(Basic.Errorpath), Environment.NewLine + "AdmibLogin:  " + ex.Message + ex.StackTrace + " " + DateTime.Now);

                        }
                    }
                   
                }
                else
                {
                    recaptchaMsg.Text = errorMessage;
                    recaptchaMsg.Visible = true;
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "g-recaptcha", "loadGrecaptcha()", true);
                }
            }
        }
        public void SendOTP(string otp, string recip_Email, string recipName)
        {

            int length = otp.Length;


            for (int i = 2; i < length; i += (2 + 1))
            {
                otp = otp.Insert(i, "-");
            }
            string msgtext = "<!DOCTYPE html><html><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"><style type=\"text/css\">"
               + " body {font-size: 17px;font-family: Calibri;direction: rtl;text-align: right;color: rgb(0,0,0);letter-spacing: normal;"
               + " font-weight: 400;text-indent: 0px;text-transform: none;white-space: normal;word-spacing: 0px;margin: 2%;}"
               + " .auto-style16 {color: #286dc5;} .DetailsList {list-style: none;margin: 0px !important;}a {text-decoration: none;"
               + "color: #286dc5;} </style></head>";


            msgtext += "<body><div class=\"row\"><div class=\"col-md-8\"><img alt='' height='100' src='http://gdc.gov.jo/assets/images/logo/logo2.png' width='100' /><br />"
                  + " <p>السيد/ة <b>" + recipName + "</b></p> "
                  + " <p> لتسجيل الدخول إلى حسابك ، يرجى استخدام رمز التحقق التالي لمرة واحدة (OTP): <b class=\'auto-style16' style='direction:ltr'>" + otp + "</b>"
                  + " <br /><br />للاستفسارات والمعلومات الإضافية،<br />"
                  + " <p>أطيب التحيات <br><b><a href='https://eforms.modee.gov.jo/' class=\"auto-style16\">وزارة الإقتصاد الرقمي والريادة</a></b></p></div></div>"
                  + "</body></html>";


            try
            {
                Basic.sndMailLocal(recip_Email, "GIP@modee.gov.jo", "رمز التحقق", msgtext);
            }
            catch (Exception ex)
            {


            }

        }

    }
}