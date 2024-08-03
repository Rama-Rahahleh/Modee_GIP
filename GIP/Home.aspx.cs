using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GIP
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CmpID"] != null)
            {
                userSection.Visible = true;
                UserName.InnerText = "أهلاً وسهلاً " + Session["UserName"];
                signin.Visible = false;
            }

        }
    }
}