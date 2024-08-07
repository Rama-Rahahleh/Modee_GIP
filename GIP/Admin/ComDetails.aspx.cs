using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Reflection;

namespace GIP
{
    public partial class ComDetails : System.Web.UI.Page
    {
        int reasonCounter;
        int x;
        protected void Page_Load(object sender, EventArgs e)
        {
          if(Session["appid"]==null)
            {
                Response.Redirect("comapp.aspx");
            }
            else
            {
                LoadGrid();

                if (Session["status"].ToString() == "1" || Session["status"].ToString() == "3")
                {
                    btnsave.Visible = true;
                    btnExit.Visible = true;                   
                }
                else
                {
                    btnsave.Visible = false;
                    btnExit.Visible = false;
                }

                DataTable dt = new DataTable();
                dt.Columns.AddRange(new DataColumn[2] { new DataColumn("reason_id"), new DataColumn("reason_text") });
                ViewState["Reasons"] = dt;
                if (SqlDataSource5.Equals(""))
                {
                    this.BindGrid();
                }
                else
                {
                    txtRejectReason.Visible = false;
                    btnAddBranch.Visible = false;
                    GridView2.Enabled = false;
                }
            }

            Response.Expires = 0;
            Response.Cache.SetNoStore();
            Response.AppendHeader("Pragma", "no-cache");
        }

        protected void BindGrid()
        {            
                GridView2.DataSource = (DataTable)ViewState["Reasons"];
                GridView2.DataBind();          
        }
        protected void Page_LoadComplete(object sender, EventArgs e)
        {
            BindGridview(Server.MapPath("~/CompanyFiles/" + Session["compno"].ToString() + "/"), GridView5);
        }

        public void LoadGrid()
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["GIPInatiativesConnectionString"].ConnectionString);
            SqlDataReader rd;

            using (con)
            {
                SqlCommand cmdCompany = new SqlCommand("PROC_READ_COMPANY_INFO", con); // Read user-> stored procedure name
                cmdCompany.CommandType = CommandType.StoredProcedure;
                cmdCompany.Parameters.Clear();
                cmdCompany.Parameters.Add(new SqlParameter("@Company_No", SqlDbType.Int)).Value = Session["appid"].ToString();

                con.Open();

                rd = cmdCompany.ExecuteReader();
                rd.Read();
                txtCompNo.Text = rd[1].ToString();
                txtCompName.Text = rd[2].ToString();
                txtCompPhone.Text = rd[3].ToString();
                txtCompEmail.Text = rd[4].ToString();
                txtCompInsurance.Text = rd[5].ToString();
                lstCompType.SelectedValue = rd[6].ToString();
                txtCompEstDate.Text = String.Format("{0:yyyy-MM-dd}", rd[7]);
                txtCompActivity.Text = rd[8].ToString();
                lstCompGover.SelectedValue = rd[9].ToString();
                txtCompSignDel.Text = rd[15].ToString();
                rd.Close();


                SqlCommand cmdDelagator = new SqlCommand("PROC_READ_DELEGATOR_INFO", con);
                cmdDelagator.CommandType = CommandType.StoredProcedure;
                cmdDelagator.Parameters.Clear();
                string s = Session["Compno"].ToString();
                cmdDelagator.Parameters.AddWithValue("@Company_No", (s));

                rd = cmdDelagator.ExecuteReader();
                rd.Read();

                txtNatNo.Text = rd[0].ToString();
                txtName.Text = rd[1].ToString();
                txtNation.Text = rd[2].ToString();
                lstDelegetType.SelectedValue = rd[4].ToString();
                txtPhone.Text = rd[5].ToString();
                txtEmail.Text = rd[6].ToString();
                txtJob.Text = rd[7].ToString();
                //txtCompNo.Text = rd[8].ToString();               
            }
            con.Close();
        }

        protected void BindGridview(string filePath, GridView gvFiles)
        {
            if (Directory.Exists(filePath))
            {
                string[] filesLoc = Directory.GetFiles(filePath);
                List<System.Web.UI.WebControls.ListItem> files = new List<System.Web.UI.WebControls.ListItem>();
                foreach (string file in filesLoc)
                {
                    try { files.Add(new System.Web.UI.WebControls.ListItem(Path.GetFileName(file))); } catch (Exception ex) { lblmsg.Text = ex.Message; }

                }
                gvFiles.DataSource = files;
                gvFiles.DataBind();
            }
        }

        protected void btnAddBranch_Click(object sender, EventArgs e)
        {
            if (txtRejectReason.Text == "")
            {
                lblmsg.Text = "يجب اضافة سبب الرفض أولا";
            }
            else
            {
                DataTable dt = (DataTable)ViewState["Reasons"];
                dt.Rows.Add(reasonCounter  + 1, txtRejectReason.Text.Trim());
                ViewState["Reasons"] = dt;
                this.BindGrid();
                //txtName.Text = string.Empty;
                txtRejectReason.Text = string.Empty;
                lblmsg.Text = "";
            }
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["GIPInatiativesConnectionString"].ConnectionString);
            SqlTransaction transaction = null;

            String sqlCompany = "PROC_UPDATE_COMPANY_INFO";

            SqlCommand cmdCompany;
            cmdCompany = new SqlCommand(sqlCompany, con);
            cmdCompany.Parameters.Clear();
            cmdCompany.CommandType = CommandType.StoredProcedure;

            cmdCompany.Parameters.Add(new SqlParameter("@App_ID", SqlDbType.Int)).Value = Session["appid"].ToString();
            cmdCompany.Parameters.Add(new SqlParameter("@Company_No", SqlDbType.BigInt)).Value = Session["compno"].ToString();//txtCompName.Text;
            cmdCompany.Parameters.Add(new SqlParameter("@Company_Status", SqlDbType.Int)).Value = 2;

            try
            {
                con.Open();
                transaction = con.BeginTransaction();
                cmdCompany.Transaction = transaction;

                cmdCompany.ExecuteNonQuery();

                transaction.Commit();
                lblmsg.Text = "تم قبول الطلب بنجاح ";
                btnsave.Visible = false;
                btnExit.Visible = false;
            }
            catch 
            {
                lblmsg.Text = "حدث خطأ اثناء الحفظ يرجى المحاولة لاحقا ";
            }
        }

        protected void btnExit_Click(object sender, EventArgs e)
        {
            if (GridView2.Rows.Count == 0)
            {
                lblmsg.Text = "يجب اضافة اسباب الرفض أولا";
            }
            else
            {
                SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["GIPInatiativesConnectionString"].ConnectionString);
                SqlTransaction transaction = null;

                String sqlCompany = "PROC_UPDATE_COMPANY_INFO";
                String sqlReason = "PROC_INSERT_REASONS";

                SqlCommand cmdCompany;
                cmdCompany = new SqlCommand(sqlCompany, con);
                cmdCompany.Parameters.Clear();
                cmdCompany.CommandType = CommandType.StoredProcedure;

                cmdCompany.Parameters.Add(new SqlParameter("@App_ID", SqlDbType.Int)).Value = Session["appid"].ToString();
                cmdCompany.Parameters.Add(new SqlParameter("@Company_No", SqlDbType.BigInt)).Value = Session["compno"].ToString();//txtCompName.Text;
                cmdCompany.Parameters.Add(new SqlParameter("@Company_Status", SqlDbType.Int)).Value = 4;

                SqlCommand cmdReason;
                cmdReason = new SqlCommand(sqlReason, con);
                cmdReason.CommandType = CommandType.StoredProcedure;

                try
                {
                    con.Open();
                    transaction = con.BeginTransaction();
                    cmdCompany.Transaction = transaction;

                    cmdCompany.ExecuteNonQuery();

                    for (int i = 0; i < GridView1.Rows.Count; i++)
                    {
                        cmdReason.Parameters.Clear();
                        cmdReason.Transaction = transaction;
                        cmdReason.Parameters.Add(new SqlParameter("@ReasonID", SqlDbType.Int)).Value = i + 1;
                        cmdReason.Parameters.Add(new SqlParameter("@Company_No", SqlDbType.BigInt)).Value = txtCompNo.Text;
                        cmdReason.Parameters.Add(new SqlParameter("@ReasonText", SqlDbType.NVarChar)).Value = GridView2.Rows[i].Cells[1].Text;
                        cmdReason.ExecuteNonQuery();
                    }

                    transaction.Commit();
                    lblmsg.Text = "تم رفض الطلب بنجاح ";
                    btnsave.Visible = false;
                    btnExit.Visible = false;
                }
                catch 
                {
                    lblmsg.Text = "حدث خطأ اثناء الحفظ يرجى المحاولة لاحقا ";
                }
            }
        }

        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            DataTable dt = (DataTable)ViewState["Reasons"];
            DataRow r = dt.Rows[index];
            dt.Rows.Remove(r);
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                dt.Rows[i][0] = i + 1;
            }
            ViewState["Reasons"] = dt;
            this.BindGrid();
        }

        protected void btnClose_click(object sender, EventArgs e)
        {
            Response.Redirect("comapp.aspx");
        }

        protected void GridView5_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("DeleteRow"))
            {
                Int32 index = Convert.ToInt32(e.CommandArgument);

                //File to be downloaded.
                string fileName = GridView5.DataKeys[index].Value.ToString();

                //Path of the File to be downloaded.
                string filePath = Server.MapPath("~/CompanyFiles/" + txtCompNo.Text + "/" + fileName);

                //Content Type and Header.
                Response.ContentType = "application/pdf";
                Response.AppendHeader("Content-Disposition", "attachment; filename=" + fileName);

                //Writing the File to Response Stream.
                Response.WriteFile(filePath);

                //Flushing the Response.
                Response.Flush();
                Response.End();
            }
        }
    }
}