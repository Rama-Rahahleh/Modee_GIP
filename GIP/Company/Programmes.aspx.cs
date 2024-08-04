using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GIP.Company
{
    public partial class Programmes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CmpID"] == null)
            {
                Response.Redirect("/Logout.aspx");

            }
            else
            {

            }

        }

        protected void StartGIP_Click(object sender, EventArgs e)
        {
            Session["TrianType"] = "1";
            Response.Redirect("NewApplication.aspx");

        }

        protected void StartQsaTech_Click(object sender, EventArgs e)
        {
            Session["TrianType"] = "2";
            Response.Redirect("NewApplication.aspx");
        }
    }
}