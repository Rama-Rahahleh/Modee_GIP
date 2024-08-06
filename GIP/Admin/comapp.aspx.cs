using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GIP
{
    public partial class comapp : System.Web.UI.Page
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.Now.AddSeconds(-1));
            Response.Cache.SetNoStore();
        }
        protected void Page_Load(object sender, EventArgs e)
        {       
         }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("DetailsRow"))
            {
                Int32 index = Convert.ToInt16(e.CommandArgument);
                Int64 id = Convert.ToInt64(GridView1.DataKeys[index].Value);
                Session["appid"] = id;
                Session["Compno"] = GridView1.Rows[index].Cells[1].Text;
                Session["log"] = "yesyoucan";
                Session["status"] = GridView1.Rows[index].Cells[18].Text;
                Response.Redirect("ComDetails.aspx");
            }
        }
    }
}