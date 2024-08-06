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
                
              
                ScriptManager.RegisterStartupScript(this, this.GetType(), "modal", "confirmChange();", true);
            }
            else if (e.CommandName.Equals("RejectRow"))
            {
            }

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
                        cmdCompany.Parameters.AddWithValue("@Company_Status", 2);
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

        protected void Decline_Click(object sender, EventArgs e)
        {

        }
    }
}