using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.ServiceModel;
using System.Net;
using System.ServiceModel.Channels;
using DocumentFormat.OpenXml.Math;
using DocumentFormat.OpenXml.Office.Word;
using GIP.App_Code;

namespace GIP
{
    public partial class ComTrDetail : System.Web.UI.Page
    {
        BasicString Basic = new BasicString();
        int reasonCounter;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                try
                {
                    if (Session["trapp"].ToString() != "go")
                    {
                        Response.Redirect("frmErrorPage.aspx");
                        return;
                    }

                    LoadGrid();
                    Loadsubscription();
                }
                catch(Exception ex)
                {
                  Response.Write(ex.Message);
                    return;
                }
            }

            reasonCounter = GridView2.Rows.Count;
            if (!this.IsPostBack)
            {
                if (Session["trstatus"].ToString() == "1")
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
                    txtRejectReason.Visible = false;
                    btnAddBranch.Visible = false;
                    GridView2.Enabled = false;
                }
                else
                {
                    txtRejectReason.Visible = true;
                    btnAddBranch.Visible = true;
                    GridView2.Enabled = true;
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
            MOHEInfo.DataBind();
        }
        public void Loadsubscription()
        {
         

            SSC.SubscriptionPeriod_Result sub = new SSC.SubscriptionPeriod_Result();
            SSC.IndividualServicesClient client = new SSC.IndividualServicesClient();
            client.ClientCredentials.UserName.UserName = Basic.GetGsbUser;
            client.ClientCredentials.UserName.Password = Basic.GetGsbPass;

            using (OperationContextScope scope = new OperationContextScope(client.InnerChannel))
                {
                    HttpRequestMessageProperty requestMessage = new HttpRequestMessageProperty();
                    requestMessage.Headers["X-IBM-Client-Id"] = Basic.GetClientID;
                    requestMessage.Headers["X-IBM-Client-Secret"] = Basic.GetClientSecret;
                    OperationContext.Current.OutgoingMessageProperties[HttpRequestMessageProperty.Name] = requestMessage;
                    // Setting up security protocol
                    ServicePointManager.SecurityProtocol = SecurityProtocolType.Tls | SecurityProtocolType.Tls11 | SecurityProtocolType.Tls12;
                    sub = client.GetSubscriptionPeriod("", txtNatNo.Text,"moict");
                SubGrid.DataSource = sub.SubscriptionPeriodDetail_Array;
                SubGrid.DataBind();
                SubGrid.Visible = true;
                
            }
        }
  
public void LoadGrid()
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["GIPInatiativesConnectionString"].ConnectionString);
            SqlDataReader rd;

            using (con)
            {
                SqlCommand cmdCompany = new SqlCommand("PROC_READ_TRAINER_INFO", con); // Read user-> stored procedure name
                cmdCompany.CommandType = CommandType.StoredProcedure;
                cmdCompany.Parameters.Clear();
                cmdCompany.Parameters.Add(new SqlParameter("@NNO", SqlDbType.BigInt)).Value = Session["trnno"].ToString();

                con.Open();

                rd = cmdCompany.ExecuteReader();
                rd.Read();
                //txtNatNo.Text = rd[0].ToString();
                txtNatNo.Text = rd[1].ToString();
                lblName.Text = rd[2].ToString();
                lblProg.Text = rd[6].ToString();
                lblStatus.Text = rd[8].ToString();
                lstGover.Text = rd[9].ToString();
                lstGender.Text = rd[10].ToString();
                txtPhone.Text = rd[11].ToString();
                txtEmail.Text = rd[12].ToString();
                //lstUniversity.Text = rd[13].ToString();
                //lstDepartment.Text = rd[14].ToString();
                //lblGPA.Text = rd[15].ToString();
                //lblGradYear.Text = rd[16].ToString();
                txtStartDate.Text = String.Format("{0:yyyy-MM-dd}", rd[17]);
                txtEndDate.Text = String.Format("{0:yyyy-MM-dd}", rd[18]);
                lblComp.Text = rd[19].ToString();
                hcomno.Value = rd[4].ToString();
                rd.Close();
            }
            con.Close();
        }

        protected void btnClose_click(object sender, EventArgs e)
        {
            Response.Redirect("AllTrainers.aspx");
        }

        protected void btnsave_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["GIPInatiativesConnectionString"].ConnectionString);
            SqlTransaction transaction = null;

            String sqlCompany = "PROC_UPDATE_TRAINER_INFO";

            SqlCommand cmdCompany;
            cmdCompany = new SqlCommand(sqlCompany, con);
            cmdCompany.Parameters.Clear();
            cmdCompany.CommandType = CommandType.StoredProcedure;

            cmdCompany.Parameters.Add(new SqlParameter("@Trainer_No", SqlDbType.BigInt)).Value = txtNatNo.Text;
            cmdCompany.Parameters.Add(new SqlParameter("@Company_No", SqlDbType.BigInt)).Value = hcomno.Value;//txtCompName.Text;
            cmdCompany.Parameters.Add(new SqlParameter("@Trainer_Status", SqlDbType.Int)).Value = 2;

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
            catch (Exception ex)
            {
                //lblmsg.Text = ex.Message;
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

                String sqlCompany = "PROC_UPDATE_TRAINER_INFO";
                String sqlReason = "PROC_INSERT_TR_REASONS";

                SqlCommand cmdCompany;
                cmdCompany = new SqlCommand(sqlCompany, con);
                cmdCompany.Parameters.Clear();
                cmdCompany.CommandType = CommandType.StoredProcedure;

                cmdCompany.Parameters.Add(new SqlParameter("@Trainer_No", SqlDbType.BigInt)).Value = txtNatNo.Text;
                cmdCompany.Parameters.Add(new SqlParameter("@Company_No", SqlDbType.BigInt)).Value = hcomno.Value; //txtCompName.Text;
                cmdCompany.Parameters.Add(new SqlParameter("@Trainer_Status", SqlDbType.Int)).Value = 4;

                SqlCommand cmdReason;
                cmdReason = new SqlCommand(sqlReason, con);
                cmdReason.CommandType = CommandType.StoredProcedure;

                try
                {
                    con.Open();
                    transaction = con.BeginTransaction();
                    cmdCompany.Transaction = transaction;

                    cmdCompany.ExecuteNonQuery();

                    for (int i = 0; i < GridView2.Rows.Count; i++)
                    {
                        cmdReason.Parameters.Clear();
                        cmdReason.Transaction = transaction;
                        cmdReason.Parameters.Add(new SqlParameter("@ReasonID", SqlDbType.Int)).Value = i + 1;
                        cmdReason.Parameters.Add(new SqlParameter("@Company_No", SqlDbType.BigInt)).Value = hcomno.Value;
                        cmdReason.Parameters.Add(new SqlParameter("@Trainer_No", SqlDbType.BigInt)).Value = txtNatNo.Text;
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

        protected void btnAddBranch_Click(object sender, EventArgs e)
        {
            if (txtRejectReason.Text == "")
            {
                lblmsg.Text = "يجب اضافة سبب الرفض أولا";
            }
            else
            {
                DataTable dt = (DataTable)ViewState["Reasons"];
                dt.Rows.Add(reasonCounter + 1, txtRejectReason.Text.Trim());
                ViewState["Reasons"] = dt;
                this.BindGrid();
                
                txtRejectReason.Text = string.Empty;
                lblmsg.Text = "";
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
    }
}