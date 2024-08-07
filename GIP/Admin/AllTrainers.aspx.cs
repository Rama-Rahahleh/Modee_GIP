using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using ClosedXML.Excel;
using System.Configuration;
using System.Data.SqlClient;
using DocumentFormat.OpenXml.Math;
using GIP.App_Code;

namespace GIP
{
    public partial class AllTrainers : System.Web.UI.Page
    {
        BasicString Basic = new BasicString();
        protected void Page_Init(object sender, EventArgs e)
        {
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.Now.AddSeconds(-1));
            Response.Cache.SetNoStore();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            Basic.Errorpath = "/ErrorLog/Admin.txt";
            if (Session["AdminID"] == null)
            {
                Response.Redirect("/logout.aspx");
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("DetailsRow"))
            { 
             
                GridViewRow gvr = (GridViewRow)((LinkButton)e.CommandSource).NamingContainer;

                // Get the row index
                int rowIndex = gvr.RowIndex;

                // Retrieve the ID from the DataKeys collection using the row index
                Int64 id = Convert.ToInt64(Trainees.DataKeys[rowIndex].Value);

                Session["TranID"]= Trainees.Rows[rowIndex].Cells[2].Text;
                Session["TranCompID"] = Trainees.Rows[rowIndex].Cells[4].Text;

                //Session["CompNo"] = GridView1.Rows[rowIndex].Cells[2].Text; // Adjust the index if necessary
              

              
                Response.Redirect("Trainer_Details.aspx");
            }
            

        }

        protected void btnLoadData_click(object sender, EventArgs e)
        {
            
        }

        protected void ExportExcel(object sender, EventArgs e)
        {
            string constr = ConfigurationManager.ConnectionStrings["GIPInatiativesConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("PROC_READ_ALL_TRAINER_INFO"))
                {                    
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            using (XLWorkbook wb = new XLWorkbook())
                            {
                                wb.Worksheets.Add(dt, "Trainers");

                                Response.Clear();
                                Response.Buffer = true;
                                Response.Charset = "";
                                Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                                Response.AddHeader("content-disposition", "attachment;filename=Trainer.xlsx");
                                using (MemoryStream MyMemoryStream = new MemoryStream())
                                {
                                    wb.SaveAs(MyMemoryStream);
                                    MyMemoryStream.WriteTo(Response.OutputStream);
                                    Response.Flush();
                                    Response.End();
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}