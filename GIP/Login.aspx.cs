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
using Newtonsoft.Json;
using Grants.App_Code;
using System.Threading;
using GIP.App_Code;

namespace GIP
{
    public partial class Login : System.Web.UI.Page
    {

        BasicString Basic = new BasicString();
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UnVerifiedUserEmail"] != null)
            {
                Response.Redirect("VerifyUser.aspx");
            }
          
            if(Session["CmpID"]!=null)
            {
                Response.Redirect("../Company/MyApps.aspx");
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
        protected void submit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string errorMessage = string.Empty;
                bool isValidCaptcha = ValidateReCaptcha(ref errorMessage);
                Page.Validate();

                if (isValidCaptcha)
                {

                    if (Basic.IsNumeric(CompanyNat.Text) == false || CompanyNat.Text == "")
                    {
                        lblMessage1.Text = "***ادخل الرقم الوطني للمنشأة بشكل صحيح***";
                        return;
                    }
                    else
                    {
                        try
                        {

                            using (SqlConnection connection = new SqlConnection(Basic.GetConnectionString))
                            {
                                using (SqlCommand command = new SqlCommand("CmpLogin", connection))
                                {
                                    connection.Open();
                                    command.Parameters.Clear();
                                    command.CommandType = CommandType.StoredProcedure;
                                    command.Parameters.AddWithValue("@Company_No", CompanyNat.Text);
                                    command.Parameters.AddWithValue("@Password", Password.Text);
                                    SqlDataReader reader = command.ExecuteReader();
                                    if (reader.Read())
                                    {
                                        if (Convert.ToBoolean(reader["IsLocked"].ToString()))
                                        {
                                            /// show Locked Acount Msg....
                                            /// then referesh
                                            ScriptManager.RegisterStartupScript(this, this.GetType(), "modal", "openLockedModal();", true);

                                        }
                                        else
                                        {
                                            //Session["compno"] = CompanyNat.Text;

                                            Session["log"] = "yesyoucan";
                                            Session["userOper"] = "1";

                                            Session["UserName"] = reader["Company_Name"].ToString();
                                            string otp = Generate_otp();
                                            Session["OTP"] = otp;
                                            Session["Allowed_OTP_Attempts"] = 3;
                                            Session["UnVerifiedUserEmail"] = reader["Company_Email"].ToString();
                                            Session["UnVerifiedUserID"] = reader["Company_No"].ToString();

                                            SendOTP(otp, reader["Company_Email"].ToString(), Session["UserName"].ToString());
                                            string VerifyLink = "VerifyUser.aspx";
                                            Response.Redirect(VerifyLink, true);
                                        }

                                    }
                                    else
                                    {
                                        Session["userID"] = "false";
                                        lblMessage1.Text = "خطأ في اسم المستخدم او كلمة المرور!!!";
                                        ScriptManager.RegisterStartupScript(this, this.GetType(), "g-recaptcha", "loadGrecaptcha()", true);
                                    }
                                    connection.Close();
                                }
                            }


                        }
                        catch (Exception ex)
                        {
                            lblMessage1.Text = ex.Message;
                        }
                        finally
                        {

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

        public void SendOTP(string otp, string recip_Email,string recipName)
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