using DocumentFormat.OpenXml.Math;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GIP.App_Code;
using System.IO;

namespace GIP.Company
{
    public partial class CompanyProfile : System.Web.UI.Page
    {
        BasicString Basic = new BasicString();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CmpID"] == null)
            {
                Response.Redirect("/Logout.aspx");

            }
            else
            {
                CompanyDeatlis();
                Company_DELEGATOR();
            }
        }


        public void CompanyDeatlis()
        {
            try
            {

                using (SqlConnection connection = new SqlConnection((Basic.GetConnectionString)))
                {
                    using (SqlCommand Command = new SqlCommand("PROC_READ_COMPANY_INFO", connection))
                    {
                        connection.Open();
                        Command.CommandType = CommandType.StoredProcedure;
                        Command.Parameters.AddWithValue("@Company_No",Convert.ToInt32(Session["CmpID"].ToString()));
                        SqlDataReader dr = Command.ExecuteReader();
                        while (dr.Read())
                        {
                            if (dr["Company_No"] != DBNull.Value && !string.IsNullOrEmpty(dr["Company_No"].ToString()))
                            {
                                CompanyNatNumber.Text = dr["Company_No"].ToString();
                            }

                            if (dr["Company_Name"] != DBNull.Value && !string.IsNullOrEmpty(dr["Company_Name"].ToString()))
                            {
                                CompanyName.Text = dr["Company_Name"].ToString();
                            }

                            if (dr["Company_Phone"] != DBNull.Value && !string.IsNullOrEmpty(dr["Company_Phone"].ToString()))
                            {
                                CompanyPhone.Text = dr["Company_Phone"].ToString();
                            }

                            if (dr["Company_Email"] != DBNull.Value && !string.IsNullOrEmpty(dr["Company_Email"].ToString()))
                            {
                                CompanyEmail.Text = dr["Company_Email"].ToString();
                            }

                            if (dr["Insurance_NO"] != DBNull.Value && !string.IsNullOrEmpty(dr["Insurance_NO"].ToString()))
                            {
                                if (dr["Insurance_NO"].ToString() != "-1")
                                {
                                    SSCNumber.Text = dr["Insurance_NO"].ToString();
                                }
                                else
                                {
                                    SSCNumber.Text = "لا يوجد منشأة تحمل الرقم الوطني المدخل";
                                }
                            }

                            // For Establishment_Date with date format handling
                            if (dr["Establishment_Date"] != DBNull.Value && !string.IsNullOrEmpty(dr["Establishment_Date"].ToString()))
                            {
                                DateTime establishmentDate;
                                if (DateTime.TryParse(dr["Establishment_Date"].ToString(), out establishmentDate))
                                {
                                    CompanyRegDate.Text = establishmentDate.ToString("yyyy/MM/dd");
                                }
                                else
                                {
                                    CompanyRegDate.Text = string.Empty;
                                }
                            }
                            else
                            {
                                CompanyRegDate.Text = string.Empty;
                            }

                            if (dr["Main_Activity"] != DBNull.Value && !string.IsNullOrEmpty(dr["Main_Activity"].ToString()))
                            {
                                MainActive.Text = dr["Main_Activity"].ToString();
                            }
                            else
                            {
                                MainActive.Text = string.Empty;
                            }

                            if (dr["SignDelegatorName"] != DBNull.Value && !string.IsNullOrEmpty(dr["SignDelegatorName"].ToString()))
                            {
                                CompSignDel.Text = dr["SignDelegatorName"].ToString();
                            }
                            else
                            {
                                CompSignDel.Text = string.Empty;
                            }

                            if (dr["GovernateName"] != DBNull.Value && !string.IsNullOrEmpty(dr["GovernateName"].ToString()))
                            {
                                GovernateName.Text = dr["GovernateName"].ToString();
                            }
                            else
                            {
                                GovernateName.Text = string.Empty;
                            }

                        }
                        connection.Close();
                        
                    }
                }

            }
            catch (Exception ex)
            {
                if (!(ex is ThreadAbortException))
                {
                    File.AppendAllText(Server.MapPath(Basic.Errorpath), Environment.NewLine + "CompCheck:  " + ex.Message + ex.StackTrace + " " + DateTime.Now);

                }

            }

        }

        public void Company_DELEGATOR()
        {
            try
            {

                using (SqlConnection connection = new SqlConnection((Basic.GetConnectionString)))
                {
                    using (SqlCommand Command = new SqlCommand("PROC_READ_DELEGATOR_INFO", connection))
                    {
                        connection.Open();
                        Command.CommandType = CommandType.StoredProcedure;
                        Command.Parameters.AddWithValue("@Company_No", Convert.ToInt32(Session["CmpID"].ToString()));
                        SqlDataReader dr = Command.ExecuteReader();
                        while (dr.Read())
                        {// Delegation Name
                            if (dr["Delegation_Name"] != DBNull.Value && !string.IsNullOrEmpty(dr["Delegation_Name"].ToString()))
                            {
                                SanadName.Text = dr["Delegation_Name"].ToString();
                            }

                            // Delegation Nation
                            if (dr["Delegation_Nation"] != DBNull.Value && !string.IsNullOrEmpty(dr["Delegation_Nation"].ToString()))
                            {
                                SanadNat.Text = dr["Delegation_Nation"].ToString();
                            }

                            // Delegation Phone
                            if (dr["Delegation_Phone"] != DBNull.Value && !string.IsNullOrEmpty(dr["Delegation_Phone"].ToString()))
                            {
                                SanadPhone.Text = dr["Delegation_Phone"].ToString();
                            }

                            // Delegation Email
                            if (dr["Delegation_Email"] != DBNull.Value && !string.IsNullOrEmpty(dr["Delegation_Email"].ToString()))
                            {
                                SanadEmail.Text = dr["Delegation_Email"].ToString();
                            }

                            // Delegation Position
                            if (dr["Delegation_Position"] != DBNull.Value && !string.IsNullOrEmpty(dr["Delegation_Position"].ToString()))
                            {
                                SanadJob.Text = dr["Delegation_Position"].ToString();
                            }

                            // Delegation Type
                            if (dr["Delegation_Type"] != DBNull.Value && !string.IsNullOrEmpty(dr["Delegation_Type"].ToString()))
                            {
                                DelegetType.Text = dr["Delegation_Type"].ToString();
                            }

                        }
                        connection.Close();
                        
                    }
                }

            }
            catch (Exception ex)
            {
                if (!(ex is ThreadAbortException))
                {
                    File.AppendAllText(Server.MapPath(Basic.Errorpath), Environment.NewLine + "CompCheck:  " + ex.Message + ex.StackTrace + " " + DateTime.Now);

                }

            }

        }


        protected void SignFileDownload_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection((Basic.GetConnectionString)))
                {
                    using (SqlCommand Command = new SqlCommand("PROC_READ_COMPANY_INFO", connection))
                    {
                        connection.Open();
                        Command.CommandType = CommandType.StoredProcedure;
                        Command.Parameters.AddWithValue("@Company_No", Convert.ToInt32(Session["CompAppID"].ToString()));

                        SqlDataReader dr = Command.ExecuteReader();
                        while (dr.Read())
                        {
                            String filepath = Server.MapPath("~/CompanyFiles/" + Session["CompAppID"].ToString() + dr["SignFilename"].ToString());

                            Response.Clear();
                            Response.ClearHeaders();
                            Response.ClearContent();
                            Response.AddHeader("Content-Disposition", "attachment; filename=" + "كتاب التفويض بالتوقيع #" + Session["CompAppID"].ToString() + ".pdf");
                            Response.Flush();
                            Response.TransmitFile(filepath);
                            //Response.End();
                            HttpContext.Current.Response.Flush(); // Sends all currently buffered output to the client.
                            HttpContext.Current.Response.SuppressContent = true;  // Gets or sets a value indicating whether to send HTTP content to the client.
                            HttpContext.Current.ApplicationInstance.CompleteRequest();

                        }
                        connection.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                if (!(ex is ThreadAbortException))
                {
                    File.AppendAllText(Server.MapPath(Basic.Errorpath), Environment.NewLine + "View For Application #" + Session["Market_View_AppID"].ToString() + ex.Message + ex.StackTrace + " " + DateTime.Now);
                }
            }
        }

        protected void RegFileDownload_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection((Basic.GetConnectionString)))
                {
                    using (SqlCommand Command = new SqlCommand("PROC_READ_COMPANY_INFO", connection))
                    {
                        connection.Open();
                        Command.CommandType = CommandType.StoredProcedure;
                        Command.Parameters.AddWithValue("@Company_No", Convert.ToInt32(Session["CompAppID"].ToString()));

                        SqlDataReader dr = Command.ExecuteReader();
                        while (dr.Read())
                        {
                            String filepath = Server.MapPath("~/CompanyFiles/" + Session["CompAppID"].ToString() + dr["RegFilename"].ToString());

                            Response.Clear();
                            Response.ClearHeaders();
                            Response.ClearContent();
                            Response.AddHeader("Content-Disposition", "attachment; filename=" + "شهادة تسجيل #" + Session["CompAppID"].ToString() + ".pdf");
                            Response.Flush();
                            Response.TransmitFile(filepath);
                            //Response.End();
                            HttpContext.Current.Response.Flush(); // Sends all currently buffered output to the client.
                            HttpContext.Current.Response.SuppressContent = true;  // Gets or sets a value indicating whether to send HTTP content to the client.
                            HttpContext.Current.ApplicationInstance.CompleteRequest();

                        }
                        connection.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                if (!(ex is ThreadAbortException))
                {
                    File.AppendAllText(Server.MapPath(Basic.Errorpath), Environment.NewLine + "View For Application #" + Session["Market_View_AppID"].ToString() + ex.Message + ex.StackTrace + " " + DateTime.Now);
                }
            }
        }

        protected void CertFileDownload_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection((Basic.GetConnectionString)))
                {
                    using (SqlCommand Command = new SqlCommand("PROC_READ_COMPANY_INFO", connection))
                    {
                        connection.Open();
                        Command.CommandType = CommandType.StoredProcedure;
                        Command.Parameters.AddWithValue("@Company_No", Convert.ToInt32(Session["CompAppID"].ToString()));

                        SqlDataReader dr = Command.ExecuteReader();
                        while (dr.Read())
                        {
                            String filepath = Server.MapPath("~/CompanyFiles/" + Session["CompAppID"].ToString() + dr["CertFilename"].ToString());

                            Response.Clear();
                            Response.ClearHeaders();
                            Response.ClearContent();
                            Response.AddHeader("Content-Disposition", "attachment; filename=" + "رخصة مهن #" + Session["CompAppID"].ToString() + ".pdf");
                            Response.Flush();
                            Response.TransmitFile(filepath);
                            //Response.End();
                            HttpContext.Current.Response.Flush(); // Sends all currently buffered output to the client.
                            HttpContext.Current.Response.SuppressContent = true;  // Gets or sets a value indicating whether to send HTTP content to the client.
                            HttpContext.Current.ApplicationInstance.CompleteRequest();

                        }
                        connection.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                if (!(ex is ThreadAbortException))
                {
                    File.AppendAllText(Server.MapPath(Basic.Errorpath), Environment.NewLine + "View For Application #" + Session["Market_View_AppID"].ToString() + ex.Message + ex.StackTrace + " " + DateTime.Now);
                }
            }
        }

    }
}