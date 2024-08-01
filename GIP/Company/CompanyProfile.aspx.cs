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
                          
                            CompanyNatNumber.Text = dr["Company_No"].ToString();
                            CompanyName.Text = dr["Company_Name"].ToString();
                            CompanyPhone.Text = dr["Company_Phone"].ToString();
                            CompanyEmail.Text = dr["Company_Email"].ToString();
                            SSCNumber.Text = dr["Insurance_NO"].ToString();
                            CompanyRegDate.Text = dr["Establishment_Date"].ToString();
                            MainActive.Text = dr["Main_Activity"].ToString();

                            CompSignDel.Text = dr["SignDelegatorName"].ToString();

                            GovernateName.Text = dr["GovernateName"].ToString();
                        }
                        connection.Close();
                        ;
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
                        {

                            SanadName.Text = dr["Delegation_Name"].ToString();     
      
                            SanadNat.Text = dr["Delegation_Nation"].ToString();
                            SanadPhone.Text = dr["Delegation_Phone"].ToString();
                            SanadEmail.Text = dr["Delegation_Email"].ToString();
                            SanadJob.Text = dr["Delegation_Position"].ToString();
                            DelegetType.Text = dr["Delegation_Type"].ToString();
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


    }
}