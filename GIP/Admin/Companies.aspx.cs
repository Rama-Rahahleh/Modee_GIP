using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.ServiceModel.Security;
using GIP.App_Code;
using System.Threading;
using System.IO;
using DocumentFormat.OpenXml.Wordprocessing;
using System.Security.Cryptography;
using System.Text;

namespace GIP
{
    public partial class Companies : System.Web.UI.Page
    {
        BasicString Basic = new BasicString();
        protected void Page_Load(object sender, EventArgs e)
        {
            Basic.Errorpath = "/ErrorLog/Admin.txt";
            if (Session["AdminID"]==null)
            {
                Response.Redirect("/logout.aspx");
            }


        }
        protected void Page_Init(object sender, EventArgs e)
        {
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.Now.AddSeconds(-1));
            Response.Cache.SetNoStore();
        }


        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("DetailsRow"))
            {

                // Get the GridViewRow from the CommandSource
                GridViewRow gvr = (GridViewRow)((LinkButton)e.CommandSource).NamingContainer;

                // Get the row index
                int rowIndex = gvr.RowIndex;

                // Retrieve the ID from the DataKeys collection using the row index
                Int64 id = Convert.ToInt64(GridView1.DataKeys[rowIndex].Value);

                // Store values in session variables
                Session["CompAppID"] = id;
                //Session["CompNo"] = GridView1.Rows[rowIndex].Cells[2].Text; // Adjust the index if necessary
                Session["status"] = GridView1.Rows[rowIndex].Cells[4].Text; // Adjust the index if necessary


                Response.Redirect("CompanyDetails.aspx");
            }
            else if (e.CommandName.Equals("ApproveRow"))
            {
                // Get the GridViewRow from the CommandSource
                GridViewRow gvr = (GridViewRow)((LinkButton)e.CommandSource).NamingContainer;

                // Get the row index
                int rowIndex = gvr.RowIndex;

                // Retrieve the ID from the DataKeys collection using the row index
                Int64 id = Convert.ToInt64(GridView1.DataKeys[rowIndex].Value);

                // Store values in session variables
                Session["CompAppID"] = id;
                Session["Status"] = 2;
              
                ScriptManager.RegisterStartupScript(this, this.GetType(), "modal", "confirmChange();", true);
            }
            else if (e.CommandName.Equals("RejectRow"))
            {
                // Get the GridViewRow from the CommandSource
                GridViewRow gvr = (GridViewRow)((LinkButton)e.CommandSource).NamingContainer;

                // Get the row index
                int rowIndex = gvr.RowIndex;

                // Retrieve the ID from the DataKeys collection using the row index
                Int64 id = Convert.ToInt64(GridView1.DataKeys[rowIndex].Value);

                // Store values in session variables
                Session["CompAppID"] = id;
                Session["Status"] = 4;

                ScriptManager.RegisterStartupScript(this, this.GetType(), "modal", "confirmChange();", true);


            }
            else if (e.CommandName.Equals("NoteRow"))
            {
                // Get the GridViewRow from the CommandSource
                GridViewRow gvr = (GridViewRow)((LinkButton)e.CommandSource).NamingContainer;

                // Get the row index
                int rowIndex = gvr.RowIndex;

                // Retrieve the ID from the DataKeys collection using the row index
                Int64 id = Convert.ToInt64(GridView1.DataKeys[rowIndex].Value);

                // Store values in session variables
                Session["CompAppID"] = id;
                Session["Status"] = 3;

                ScriptManager.RegisterStartupScript(this, this.GetType(), "modal", "HaveNoteModal();", true);

            }

        }


        private string Encrypt(string clearText)
        {
            string EncryptionKey = "MAKV2SPBNI99212";
            byte[] clearBytes = Encoding.Unicode.GetBytes(clearText);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(clearBytes, 0, clearBytes.Length);
                        cs.Close();
                    }
                    clearText = Convert.ToBase64String(ms.ToArray());
                }
            }
            return clearText;
        }

        protected void Approve_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(Basic.GetConnectionString))
                {
                    using (SqlCommand cmdCompany = new SqlCommand("PROC_UPDATE_COMPANY_INFO", con))
                    {
                        con.Open();
                        cmdCompany.CommandType = CommandType.StoredProcedure;
                        cmdCompany.Parameters.AddWithValue("@Company_No", Session["CompAppID"].ToString());
                        cmdCompany.Parameters.AddWithValue("@Company_Status", Session["Status"].ToString());
                        cmdCompany.ExecuteNonQuery();
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "CallMyFunction1", "toastr.clear();", true);
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "CallMyFunction", "showContent('success',' تم  أضافة الملاحظة على الطلب بنجاح  ');", true);
                        GridView1.DataBind();
                    }
                }
            }
            catch (Exception ex) 
            {
                if (!(ex is ThreadAbortException))
                {
                    File.AppendAllText(Server.MapPath(Basic.Errorpath), Environment.NewLine + "Approve" + ex.Message + ex.StackTrace + " " + DateTime.Now);
                }
            }
        }

  
        protected void HaveNote_Click(object sender, EventArgs e)
        { 
            if(Page.IsValid)
            {
                try
                {
                    using (SqlConnection con = new SqlConnection(Basic.GetConnectionString))
                    {
                        using (SqlCommand cmdCompany = new SqlCommand("PROC_INSERT_REASONS", con))
                        {
                            con.Open();
                            cmdCompany.CommandType = CommandType.StoredProcedure;
                            cmdCompany.Parameters.AddWithValue("@Company_No", Session["CompAppID"].ToString());
                            cmdCompany.Parameters.AddWithValue("@ReasonText", ReasonText.Text);
                            cmdCompany.Parameters.AddWithValue("@Company_Status", 3);
                            cmdCompany.ExecuteNonQuery();
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "CallMyFunction1", "toastr.clear();", true);
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "CallMyFunction", "showContent('success',' تم  الموافقة على الطلب بنجاح  ');", true);
                            GridView1.DataBind();
                        }
                    }
                }
                catch (Exception ex)
                {
                    if (!(ex is ThreadAbortException))
                    {
                        File.AppendAllText(Server.MapPath(Basic.Errorpath), Environment.NewLine + "Approve" + ex.Message + ex.StackTrace + " " + DateTime.Now);
                    }
                }

            }
        }
        public void SendMassageForUser()
        {
            string id = HttpUtility.UrlEncode(Encrypt(Session["progId"].ToString().Trim()));
            string PageMode = HttpUtility.UrlEncode(Encrypt("Create"));


            string msgtext = "<html dir='rtl'><head> \r\n  " +
                "<meta http-equiv='Content-Type' content=\"text/html; charset=utf-8\">\r\n " +
                " <style>\r\n " +
                "body \r\n     " +
                " {direction: rtl;font-size: 17px; font-family: Calibri;direction: rtl;text-align: right;color: rgb(0, 0, 0);\r\n    " +
                " letter-spacing: normal;font-weight: 400;text-indent: 0px;text-transform: none;white-space: normal;word-spacing: 0px;margin: 2%;}\r\n " +
                "    .auto-style16 {color: #286dc5;}.DetailsList {list-style: none;margin: 0px !important;}\r\n " +
                "     a {text-decoration: none; color: #286dc5;}\r\n    </style>\r\n</head>\r\n\r\n    ";

            msgtext += "<body>\r\n    <div class=\"row\">\r\n<div class=\"col-md-8\">"
                    + "<img height=\"130\" src=\"https://gdc.gov.jo/assets/images/logo/logo2.png\" width=\"150\">"
                    + "  <p>السيد/ة <b>" + Session["Name"].ToString() + "</b>المحترمـ/ة<br /> تحية طيب وبعد ،، <br/>"
                    + "يسعدنا إعلامك بأنه تم قبول تسجيل حسابك بنجاح على "
                    + " <b style=\" color: #286dc5;\">\r\n<a href=\\\"http://gdc.gov.jo/\\\">منصة تصنيف  البيانات الحكومية </a>\r\n</b>،<br/>"
                    + "  و من أجل استكمال إجراءات الحساب والبدء في تصنيف البيانات يرجى"
                    + " <b><a href='" + Basic.gdc_link + "/CreatePassword?Mode=" + PageMode + "&Activition=" + id + "'>تفعيل الحساب </a></b>"

                    + " <p>للاستفسارات والمعلومات الإضافية،<br /> "
                    + " لا تتردد في التواصل معنا باستخدام البريد الإلكتروني التالي :<b>"
                    + " <a href='mailto:gdc@modee.gov.jo'>فريق منصة تصنيف البيانات الحكومية</a><br /></b></p>"
                    + "<p>اطيب التحيات <br><b><a href=" + Basic.gdc_link + "' class=\\\"auto-style16\\\">منصة تصنيف البيانات الحكومية</a></b></p>"
                    + "   </p>\r\n</div>\r\n</div></p></body></html>";


            try
            {
                string Link = Basic.gdc_link + "/CreatePassword?Mode=" + PageMode + "&Activition=" + id;
                UpdateActivetion(Convert.ToInt32(Session["progId"].ToString()), Link);



                if (!Basic.gdc_link.Contains("gdc"))
                {
                    Basic.sndMailLocal(Session["ProguserEmail"].ToString(), "gdc@modee.gov.jo", "قبول طلب عضوية قائد", msgtext);

                }
                else
                {
                    Basic.sendMail(Session["ProguserEmail"].ToString(), "gdc@modee.gov.jo", "قبول طلب عضوية قائد", msgtext);
                }

            }
            catch (Exception ex)
            {
                if (!(ex is ThreadAbortException))
                {
                    File.AppendAllText(Server.MapPath(Basic.Errorpath), Environment.NewLine + "MangeProgramLead:" + ex.Message + ex.StackTrace + " " + DateTime.Now);
                }
            }


        }

    }
}