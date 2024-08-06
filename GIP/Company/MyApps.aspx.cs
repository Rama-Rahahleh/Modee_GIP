using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GIP.Company
{
    public partial class MyApps : System.Web.UI.Page
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.Now.AddSeconds(-1));
            Response.Cache.SetNoStore();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CmpID"] == null)
            {
                Response.Redirect("/Logout.aspx");

            }
            else
            {

                GridView1.DataBind();
            }
        
    }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}