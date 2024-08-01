using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GIP.App_Code;
using System.Threading;
using System.IO;

namespace GIP
{
    public partial class VerifyUser : System.Web.UI.Page
    {
        BasicString Basic = new BasicString();
        protected void Page_Load(object sender, EventArgs e)
        {
            Basic.Errorpath = "/ErrorLog/Login.txt";
            if (Session["UnVerifiedUserEmail"] == null)
            {
                Response.Redirect("logout.aspx");
            }
            else
            {
                lblMessage1.Visible = true;
                lblMessage1.Text = Session["OTP"].ToString();

                if (Session["OTP"] == null)
                {
                    if (Session["UnVerifiedUserID"] == null)
                    {
                        Response.Redirect("Home.aspx");

                    }
                    else if (Session["compno"] != null)
                    {
                        Response.Redirect("Company/Programmes.aspx");
                    }

                }
                else
                {
                    if (Session["staust"] != null)
                    {
                        if (Session["staust"].ToString() == "RSendOtp")
                        {
                            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), "CallMyFunction", "showContent('success','Otp Is sent Successfully');", true);
                        }
                    }

                }
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
        public void LockUserAccountAfterAllAttempts(string UsrEmail, string UsrPassword, bool Lock_status)
        {
            /////* change Lock status of User account to (1) after all attempts...
            try
            {
                using (SqlConnection connection = new SqlConnection(Basic.GetConnectionString))
                {

                    SqlDataReader odr;
                    using (SqlCommand command = new SqlCommand())
                    {
                        connection.Open();
                        command.CommandType = CommandType.StoredProcedure;
                        command.Connection = connection;
                        command.CommandText = "Lock_Unlock";
                        command.Parameters.AddWithValue("@Comp_Nat", Session["compno"].ToString());                      
                        command.Parameters.AddWithValue("@IsLocked", 1);
                        int result = command.ExecuteNonQuery();
                        Session["IsLocked"] = 1;

                        ScriptManager.RegisterStartupScript(this, this.GetType(), "modal", "openLockedModal();", true);

                    }
                }
            }
            catch (Exception ex)
            {
                if (!(ex is ThreadAbortException))
                {
                    File.AppendAllText(Server.MapPath(Basic.Errorpath), Environment.NewLine + "OTP Matching:  " + Session["UnVerifiedUserEmail"].ToString() + ex.Message + ex.StackTrace + " " + DateTime.Now);

                }

            }
        }




        protected void OTP_Validator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = args.IsValid;
            if (Session["Allowed_OTP_Attempts"] == null)
            {
                Response.Redirect("Home.aspx");
            }
            else
            {
                Session["Allowed_OTP_Attempts"] = Convert.ToInt32(Session["Allowed_OTP_Attempts"].ToString()) - 1;

            }

            string otpstring = (ist.Value.ToString() + sec.Value.ToString() + third.Value.ToString() +
                                fourth.Value.ToString() + fifth.Value.ToString() + sixth.Value.ToString());

            if (otpstring != null && otpstring != String.Empty && otpstring != "" && otpstring != "&nbsp;")
            {
                string x = Session["OTP"].ToString();

                if (otpstring != Session["OTP"].ToString())
                {

                    args.IsValid = false;

                    if (Convert.ToInt32(Session["Allowed_OTP_Attempts"].ToString()) != 0)
                    {
                        string count = Session["Allowed_OTP_Attempts"].ToString();
                        ist.Value = ""; sec.Value = ""; third.Value = ""; fourth.Value = ""; fifth.Value = ""; sixth.Value = "";
                        OTP_Validator.ErrorMessage = "Invalid OTP code..";
                    }
                    else
                    {
                        LockUserAccountAfterAllAttempts(Session["UnVerifiedUserID"].ToString(), true);
                        Session["IsLocked"] = 1;
                        contact2.Visible = true;

                        ScriptManager.RegisterStartupScript(this, this.GetType(), "modal", "openInvalid();", true);
                    }
                }

            }

        }

        protected void submitOTP_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {

                string otpstring = ist.Value + sec.Value + third.Value + fourth.Value + fifth.Value + sixth.Value;


                if (otpstring != null && otpstring != String.Empty && otpstring != "" && otpstring != "&nbsp;")
                {
                    if (otpstring == Session["otp"].ToString())
                    {
                        try
                        {
                            using (SqlConnection connection = new SqlConnection(Basic.GetConnectionString))
                                {
                                    connection.Open();
                                    SqlDataReader odr;
                                    SqlCommand command = new SqlCommand();
                                    command.Connection = connection;
                                    command.CommandType = CommandType.StoredProcedure;
                                    command.CommandText = "VerifyUser";
                                command.Parameters.AddWithValue("@Company_No", Session["UnVerifiedUserID"].ToString());

                                odr = command.ExecuteReader();
                                    if (odr.HasRows == true)
                                    {
                                        while (odr.Read())
                                        {
                                            if (Convert.ToBoolean(odr["IsLocked"].ToString()))
                                            {
                                                /// show Locked Acount Msg....
                                                /// then referesh
                                                ScriptManager.RegisterStartupScript(this, this.GetType(), "modal", "openLockedModal();", true);

                                            }
                                            else
                                            {

                                            Session["UserName"] = odr["Company_Name"].ToString();
                                         
                                         
                                            Session["UserEmail"] = odr["Company_Email"].ToString();
                                            Session["CmpID"] = odr["Company_No"].ToString();


                                            Response.Redirect("Company/Programmes.aspx");
                                                
                                            }
                                        }

                                    }
                                    else
                                    {
                                        ErrorLabel.Text = "البريد الالكتروني أو كلمة السر غير صحيحة";
                                        ErrorLabel.Visible = true;
                                    }

                                
                            }
                        }
                        catch (Exception ex)
                        {
                            if (!(ex is ThreadAbortException))
                            {
                                File.AppendAllText(Server.MapPath(Basic.Errorpath), Environment.NewLine + "OTP Matching:  " + Session["UnVerifiedUserEmail"].ToString() + ex.Message + ex.StackTrace + " " + DateTime.Now);

                            }

                        }
                    }

                    else if (Convert.ToInt32(Session["Allowed_OTP_Attempts"].ToString()) == 0)
                    {
                        if (Session["UserType"].ToString() == "5")
                        {
                            contact2.Visible = false; Session["IsLocked"] = 1;
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "modal", "openInvalid();", true);

                        }
                        else
                        {

                            contact2.Visible = true;
                            Session["IsLocked"] = 1;
                            /////********* lock the Account and show lock Msg ***  //////////////
                            ///
                            //LockUserAccountAfterAllAttempts(Server.HtmlEncode(Session["UnVerifiedAdminEmail"].ToString()), Server.HtmlEncode(Session["UnVerifiedAdminPassword"].ToString()), true);

                            LockUserAccountAfterAllAttempts(Session["UnVerifiedUserID"].ToString(), true);
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "modal", "openInvalid();", true);

                        }


                    }
                }
            }
        }

        protected void ResendOTP_Click(object sender, EventArgs e)
        {
            try
            {
                string otp = Generate_otp();
                Session["OTP"] = otp;
                Session["staust"] = "RSendOtp";

                Session["Allowed_OTP_Attempts"] = 3;


                SendOTP(otp, Session["UnVerifiedUserEmail"].ToString(), Session["UserName"].ToString());

                string VerifyLink = "VU.aspx";

                Response.Redirect(VerifyLink, true);

            }
            catch (Exception ex)
            {
                
            }

        }

        protected void BtnLogout_Click(object sender, EventArgs e)
        {
            { Response.Redirect("logout.aspx"); }

        }
        public void LockUserAccountAfterAllAttempts(string UnVerifiedUserID, bool Lock_status)
        {
            /////* change Lock status of User account to (1) after all attempts...
            try
            {
                using (SqlConnection connection = new SqlConnection(Basic.GetConnectionString))
                {

                    SqlDataReader odr;
                    using (SqlCommand command = new SqlCommand())
                    {
                        command.CommandText = "Lock_Unlock_UserAccount";
                        command.Parameters.AddWithValue("@CompanyNa", UnVerifiedUserID);

                        command.Parameters.AddWithValue("@Lock_Status", Lock_status);

                        command.CommandType = CommandType.StoredProcedure;
                        command.Connection = connection;
                        connection.Open();
                        int result = command.ExecuteNonQuery();


                        /// Blocked User .. exceed allowed attempts

                    }
                }
            }
            catch (Exception ex)
            {
                ErrorLabel.Visible = true;
                ErrorLabel.Text = ex.ToString();

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
                if (!(ex is ThreadAbortException))
                {
                    File.AppendAllText(Server.MapPath(Basic.Errorpath), Environment.NewLine + "OTP Matching:  " + Session["UnVerifiedUserEmail"].ToString() + ex.Message + ex.StackTrace + " " + DateTime.Now);

                }

            }

        }
    }
}