using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GIP
{
    public partial class DashBored : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] != null)
            {
                userSection.Visible = true;
                UserName.InnerText = "أهلاً وسهلاً " + Session["AdminName"];

            }
            else
            {
                Response.Redirect("/logout.aspx");
            }
        }
    }
}