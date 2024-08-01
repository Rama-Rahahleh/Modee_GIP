using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GIP.App_Code;
using RestSharp;
using System.Net.Http;
using System.Threading.Tasks;
using System.Text;
using System.IO;
using System.Threading;
using System.Net;
using System.ServiceModel.Channels;
using System.ServiceModel;
using System.Globalization;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using static System.Net.Mime.MediaTypeNames;

namespace GIP
{
    public partial class Register : System.Web.UI.Page
    {

        BasicString Basic = new BasicString();
        int branchCounter;
        protected void Page_Load(object sender, EventArgs e)
        {
            Basic.Errorpath = "/ErrorLog/Josn.txt";
            branchCounter = GridView1.Rows.Count;
            if (!this.IsPostBack)
            {
                DataTable dt = new DataTable();
                dt.Columns.AddRange(new DataColumn[2] { new DataColumn("BranchID"), new DataColumn("Placename") });
                ViewState["Branches"] = dt;
                this.BindGrid();

                //if (Session["Step"]!=null)
                //{
                //    if (Convert.ToInt32(Session["Step"].ToString()) == 1) {
                //        SanadDiv.Visible = true;
                //        ContactInfo.Visible = false;
                //        CompanyInfo.Visible = false;
                //        CompanyBranch.Visible = false;
                //        Attachment.Visible = false;
                //    }
                //   else if (Convert.ToInt32(Session["Step"].ToString()) == 2) {
                //        SanadDiv.Visible = false;
                //        ContactInfo.Visible = true;
                //        CompanyInfo.Visible = false;
                //        CompanyBranch.Visible = false;
                //        Attachment.Visible = false;
                //    }
                //    else if (Convert.ToInt32(Session["Step"].ToString()) == 3) {
                //        SanadDiv.Visible = false;
                //        ContactInfo.Visible = false;
                //        CompanyInfo.Visible = true;
                //        CompanyBranch.Visible = false;
                //        Attachment.Visible = false;
                //    }
                //    else if (Convert.ToInt32(Session["Step"].ToString()) == 4) {
                //        SanadDiv.Visible = false;
                //        ContactInfo.Visible = false;
                //        CompanyInfo.Visible = false;
                //        CompanyBranch.Visible = true;
                //        Attachment.Visible = false;
                //    }
                //    else if (Convert.ToInt32(Session["Step"].ToString()) == 5) {
                //        SanadDiv.Visible = false;
                //        ContactInfo.Visible = false;
                //        CompanyInfo.Visible = false;
                //        CompanyBranch.Visible = false;
                //        Attachment.Visible = true;
                //    }
                //}
            }
        }
        private void GetPersonNationality(string id)
        {
            string baseUrl = "https://api-gateway.stg.gsb.gov.jo:9443/porg-g2g/g2g/cspd/web/api/person-info";
            string nationality = string.Empty;

            try
            {
                using (HttpClient client = new HttpClient())
                {
                    client.DefaultRequestHeaders.Accept.Add(new System.Net.Http.Headers.MediaTypeWithQualityHeaderValue("application/json"));
                    // Set the request headers
                    client.DefaultRequestHeaders.Add("X-IBM-Client-Id", Basic.GetClientID);
                    client.DefaultRequestHeaders.Add("X-IBM-Client-Secret", Basic.GetClientSecret);

                    // Set the request headers for Basic Authentication
                    var authToken = Encoding.ASCII.GetBytes($"{Basic.GetGsbUser}:{Basic.GetGsbPass}");
                    client.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Basic", Convert.ToBase64String(authToken));

                    // Construct the URL with the query parameter
                    string requestUrl = $"{baseUrl}?id={id}";

                    // Create an empty content for POST request
                    var requestBody = new StringContent(string.Empty, Encoding.UTF8, "application/json");


                    // Synchronous POST request
                    HttpResponseMessage response = client.PostAsync(requestUrl, requestBody).Result; // .Result is used to block until the task completes
                    response.EnsureSuccessStatusCode(); // Throw if the status code is not successful

                    string responseData = response.Content.ReadAsStringAsync().Result; // .Result is used to block until the task completes
                                                                                       // Log raw responseData for debugging
                    File.AppendAllText(Server.MapPath(Basic.Errorpath), responseData);


                    // Deserialize the JSON response
                    ApiResponse apiResponse = null;
                    try
                    {
                        apiResponse = JsonConvert.DeserializeObject<ApiResponse>(responseData);
                    }
                    catch (JsonException jsonEx)
                    {
                        lblMessage.Text = "JSON deserialization error: " + jsonEx.Message;
                        return;
                    }

                    // Read the NATIONALITY field
                    if (apiResponse != null && apiResponse.ToString() != " ")
                    {
                        nationality = apiResponse.Data.NATIONALITY?.Trim();
                    }
                    else
                    {
                        nationality = "No data available";
                    }
                    SanadNat.Text = nationality;
                }
            }
            catch (HttpRequestException httpEx)
            {
                lblMessage.Text = "Request error: " + httpEx.Message;
            }
            catch (Exception ex)
            {
                lblMessage.Text = "General error: " + ex.Message;
            }
        }

        public bool GetCompanyName()
        {
            bool Hasname = false;

            CCD.CompanyClient CompanySrv_events = new CCD.CompanyClient();
            CompanySrv_events.ClientCredentials.UserName.UserName = Basic.GetGsbUser;
            CompanySrv_events.ClientCredentials.UserName.Password = Basic.GetGsbPass;

            using (var scope = new OperationContextScope(CompanySrv_events.InnerChannel))
            {
                HttpRequestMessageProperty requestMessage = new HttpRequestMessageProperty();
                requestMessage.Headers["X-IBM-Client-Id"] = Basic.GetClientID;
                OperationContext.Current.OutgoingMessageProperties[HttpRequestMessageProperty.Name] = requestMessage;
                requestMessage.Headers["X-IBM-Client-Secret"] = Basic.GetClientSecret;
                OperationContext.Current.OutgoingMessageProperties[HttpRequestMessageProperty.Name] = requestMessage;

                CCD.Company CompanySrv_PR = CompanySrv_events.getCompanyByNo(long.Parse(CompNat.Text));
                if (CompanySrv_PR != null)
                {
                    if (CompanySrv_PR.COMPID != 0)
                    {
                        if (CompanySrv_PR.COMPSTATUS == 1)
                        {
                            if (CompanySrv_PR.COMID.ToString() != "null" && CompanySrv_PR.COMID.ToString() != "0")
                            {
                                if (CompanySrv_PR.REGDATE.ToString() != " " && CompanySrv_PR.REGDATE.ToString() != "null")
                                {
                                    CompanyNatNumber.Text = CompNat.Text;
                                    CompanyRegDate.Text = Convert.ToDateTime(CompanySrv_PR.REGDATE.ToString()).ToString("yyyy-MM-dd");
                                    CompanyRegDate.Enabled = false;
                                }
                                if (CompanySrv_PR.COMPANAME.ToString() != " " && CompanySrv_PR.COMPANAME.ToString() != "null")
                                {
                                    CompanyName.Text = CompanySrv_PR.COMPANAME.ToString();
                                    CompanyName.Enabled = false;
                                }

                                Hasname = true;
                            }
                            else
                            {
                                Hasname = false;
                            }
                        }
                        else
                        {
                            Hasname = false;
                            ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), "CallMyFunction", "showContent('error','الرقم الوطني لشركة غير قائمة');", true);

                        }
                    }
                }
            }


            if (Hasname != true)
            {
                MIT.MITServiceClient MITSrv_events = new MIT.MITServiceClient();
                MITSrv_events.ClientCredentials.UserName.UserName = Basic.GetGsbUser;
                MITSrv_events.ClientCredentials.UserName.Password = Basic.GetGsbPass;

                using (var scope = new OperationContextScope(MITSrv_events.InnerChannel))
                {
                    HttpRequestMessageProperty requestMessage = new HttpRequestMessageProperty();
                    requestMessage.Headers["X-IBM-Client-Id"] = Basic.GetClientID;
                    OperationContext.Current.OutgoingMessageProperties[HttpRequestMessageProperty.Name] = requestMessage;
                    requestMessage.Headers["X-IBM-Client-Secret"] = Basic.GetClientSecret;
                    OperationContext.Current.OutgoingMessageProperties[HttpRequestMessageProperty.Name] = requestMessage;




                    MIT.CentralRegistration MITSrv_PR = MITSrv_events.getIndividualRegistry(long.Parse(CompNat.Text));
                    if (MITSrv_PR != null)
                    {

                        if (MITSrv_PR.decRegistryNo != null && MITSrv_PR.decRegistryNo.ToString() != "")
                        {
                            CompanyNatNumber.Text = CompNat.Text;


                            if (MITSrv_PR.dtmRegistryDate != null && MITSrv_PR.dtmRegistryDate.ToString() != "")
                            {
                                string originalDateString = MITSrv_PR.dtmRegistryDate.ToString();
                                string originalFormat = "dd/MM/yyyy";
                                DateTime parsedDate = DateTime.ParseExact(originalDateString, originalFormat, CultureInfo.InvariantCulture);


                                CompanyRegDate.Text = Convert.ToDateTime(parsedDate.ToString()).ToString("yyyy-MM-dd");
                                CompanyRegDate.Enabled = false;
                            }
                            if (MITSrv_PR.strRegistryName.ToString() != " " && MITSrv_PR.strRegistryName.ToString() != "null")
                            {
                                CompanyName.Text = MITSrv_PR.strRegistryName.ToString();
                                CompanyName.Enabled = false;
                            }

                            Hasname = true;
                        }
                        else
                        {
                            Hasname = false;

                        }
                    }
                    else
                    {
                        Hasname = false;
                        ScriptManager.RegisterStartupScript(UpdatePanel1, UpdatePanel1.GetType(), "CallMyFunction", "showContent('error','الرقم الوطني لمؤسسة غير صحيح');", true);

                    }
                }
            }
            return Hasname;
        }
        public void GetCompanySSC()
        {
            Corporation.CorporationServicesClient CorporationBasicInfo_events = new Corporation.CorporationServicesClient();

            CorporationBasicInfo_events.ClientCredentials.UserName.UserName = Basic.GetGsbUser;
            CorporationBasicInfo_events.ClientCredentials.UserName.Password = Basic.GetGsbPass;

            using (var scope = new OperationContextScope(CorporationBasicInfo_events.InnerChannel))
            {
                HttpRequestMessageProperty requestMessage = new HttpRequestMessageProperty();
                requestMessage.Headers["X-IBM-Client-Id"] = Basic.GetClientID;
                OperationContext.Current.OutgoingMessageProperties[HttpRequestMessageProperty.Name] = requestMessage;
                requestMessage.Headers["X-IBM-Client-Secret"] = Basic.GetClientSecret;
                OperationContext.Current.OutgoingMessageProperties[HttpRequestMessageProperty.Name] = requestMessage;

                Corporation.CorporationBasicInfo_Result CorporationBasicInfo = CorporationBasicInfo_events.GetCorporationBasicInfo(null, CompNat.Text, null, "moict");

                if (CorporationBasicInfo != null)
                {


                    SSCNumber.Text = CorporationBasicInfo.CorporationBasicInfo_Array[0].CompanyID.ToString();
                    SSCNumber.Enabled = false;
                }
            }

        }
        public void IDM()
        {
            var options = new RestSharp.RestClientOptions("https://portal.jordan.gov.jo");
            var client = new RestSharp.RestClient(options);
            var request = new RestRequest("/mga/sps/oauth/oauth20/token", Method.Post);
            request.AddHeader("Content-Type", "application/x-www-form-urlencoded");
            request.AddHeader("Cookie", "AMWEBJCT!%2Fmga!JSESSIONID=0000n1RSuYSFa0afa2hA3VppwDk:23b678f9-a941-4859-8bac-b7e2ba3341a5; PD_STATEFUL_fca0bacc-3df7-11ea-9b29-005056a841aa=%2Fmga");
            request.AddParameter("grant_type", "password");
            request.AddParameter("client_secret", "k22DtPUNkpFbO3JqCDwn");
            request.AddParameter("client_id", "HrFZUo8o6dg4gUDzkYAi");
            request.AddParameter("username", txtNatNo.Text);
            request.AddParameter("password", txtsandpass.Text);
            request.AddParameter("scope", "openid");
            RestResponse response = client.Execute(request);
            if (response.StatusCode == System.Net.HttpStatusCode.OK)
            {
                IDMClass myDeserializedClass = JsonConvert.DeserializeObject<IDMClass>(response.Content);
                string accessToken = myDeserializedClass.access_token;
                var options2 = new RestSharp.RestClientOptions("https://portal.jordan.gov.jo");
                var client2 = new RestClient(options2);
                var request2 = new RestRequest("/MoICTIdentityManagement/users/" + txtNatNo.Text, Method.Get);
                request2.AddHeader("Authorization", "Bearer " + accessToken);
                request2.AddHeader("Cookie", "PD-S-SESSION-IDP=1_TwGFPDTLK5KdTISxQPU0kV6bVPdMWA8v8BQAMk1ZHct6vlxkPlk=_AAAAAgA=_6uUn5kZgD3Tfzn6U8YszgaLG4y0=; AMWEBJCT!%2Fmga!JSESSIONID=0000QWQ9Xpom1wSV0YRdcCaELOG:278dbff0-dc1f-4a59-9557-dd9a8ca66924; PD_STATEFUL_ebca019e-1814-11ea-9f5d-005056a841aa=portal.jordan.gov.jo; PD_STATEFUL_fb48dee8-3df7-11ea-9b29-005056a841aa=%2Fmga");
                RestResponse response2 = client2.Execute(request2);
                IDMuserInfo.Root IDMuserInfoClass = JsonConvert.DeserializeObject<IDMuserInfo.Root>(response2.Content);
                SanadName.Text = IDMuserInfoClass.result.attributes.userFullName_ar[0].ToString();
                SanadPhone.Text = IDMuserInfoClass.result.attributes.mobile[0].ToString();
                SanadEmail.Text = IDMuserInfoClass.result.attributes.email[0].ToString();
                string NatoinalID = IDMuserInfoClass.result.attributes.nationalNumber[0].ToString();

                GetPersonNationality(NatoinalID);

                Session["SanadName"] = IDMuserInfoClass.result.attributes.userFullName_ar[0].ToString();
                Session["SanadEmail"] = IDMuserInfoClass.result.attributes.email[0].ToString();

            }
        }
        protected void DelegetTypeList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DelegetTypeList.SelectedValue == "2")
            {
                RequiredFieldValidator8.Enabled = true;
            }
            else
            {
                RequiredFieldValidator8.Enabled = false;
            }
        }


        protected void BindGrid()
        {
            GridView1.DataSource = (DataTable)ViewState["Branches"];
            GridView1.DataBind();
        }

        protected void AddBranch_Click(object sender, EventArgs e)
        {

            DataTable dt = (DataTable)ViewState["Branches"];
            dt.Rows.Add(branchCounter + 1, CompBranch.Text.Trim());
            ViewState["Branches"] = dt;
            this.BindGrid();
            //txtName.Text = string.Empty;
            CompBranch.Text = string.Empty;


        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            DataTable dt = (DataTable)ViewState["Branches"];
            DataRow r = dt.Rows[index];
            dt.Rows.Remove(r);
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                dt.Rows[i][0] = i + 1;
            }
            ViewState["Branches"] = dt;
            this.BindGrid();
        }

        protected void CheckComp_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    GetCompanyName();
                    GetCompanySSC();


                    if (GetCompanyName() == true)
                    {
                        Nat.Visible = false;
                        CompInfoResult.Visible = true;
                    }
                    else
                    {
                        Nat.Visible = true;
                        CompInfoResult.Visible = false;

                    }




                }
                catch (Exception ex)
                {
                    if (!(ex is ThreadAbortException))
                    {
                        File.AppendAllText(Server.MapPath(Basic.Errorpath), Environment.NewLine + "CompCheck:  " + Session["UnVerifiedUserEmail"].ToString() + ex.Message + ex.StackTrace + " " + DateTime.Now);

                    }

                }
            }

        }
        protected void Next1_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {


                    using (SqlConnection CompCon = new SqlConnection(Basic.GetConnectionString))
                    {

                        using (SqlCommand cmdCompany = new SqlCommand("PROC_INSERT_COMPANY_INFO", CompCon))
                        {

                            cmdCompany.Parameters.Clear();
                            cmdCompany.CommandType = CommandType.StoredProcedure;
                            CompCon.Open();
                            if (CompanyNatNumber != null && CompanyNatNumber.Text != string.Empty && CompanyNatNumber.Text != "")
                            {
                                cmdCompany.Parameters.Add(new SqlParameter("@Company_No", SqlDbType.BigInt)).Value = CompanyNatNumber.Text;
                            }
                            if (CompanyName.Text != null && CompanyName.Text != string.Empty && CompanyName.Text != "")
                            {
                                cmdCompany.Parameters.Add(new SqlParameter("@Company_Name", SqlDbType.NVarChar)).Value = CompanyName.Text;
                            }
                            if (CompanyPhone.Text != null && CompanyPhone.Text != string.Empty && CompanyPhone.Text != "")
                            {
                                cmdCompany.Parameters.Add(new SqlParameter("@phone_No", SqlDbType.BigInt)).Value = CompanyPhone.Text;
                            }
                            if (CompanyEmail.Text != null && CompanyEmail.Text != string.Empty && CompanyEmail.Text != "")
                            {
                                cmdCompany.Parameters.Add(new SqlParameter("@Company_Email", SqlDbType.NVarChar)).Value = CompanyEmail.Text;
                            }
                            if (SSCNumber.Text != null && SSCNumber.Text != string.Empty && SSCNumber.Text != "")
                            {
                                cmdCompany.Parameters.Add(new SqlParameter("@Insurance_NO", SqlDbType.BigInt)).Value = SSCNumber.Text;
                            }

                            if (CompanyRegDate.Text != null && CompanyRegDate.Text != string.Empty && CompanyRegDate.Text != "")
                            {
                                cmdCompany.Parameters.Add(new SqlParameter("@Establishment_Date", SqlDbType.Date)).Value = CompanyRegDate.Text;
                            }
                            if (MainActive.Text != null && MainActive.Text != string.Empty && MainActive.Text != "")
                            {
                                cmdCompany.Parameters.Add(new SqlParameter("@Main_Activity", SqlDbType.NVarChar)).Value = MainActive.Text;
                            }

                            if (GovernateList != null)
                            {
                                cmdCompany.Parameters.Add(new SqlParameter("@GovernateID", SqlDbType.Int)).Value = GovernateList;
                            }
                            if (CompSignDel.Text != null && CompSignDel.Text != string.Empty && CompSignDel.Text != "")
                            {
                                cmdCompany.Parameters.Add(new SqlParameter("@SignDelegatorName", SqlDbType.NVarChar)).Value = CompSignDel.Text;
                            }
                            cmdCompany.Parameters.Add(new SqlParameter("@@RegistertiontStep", SqlDbType.Int)).Value = 2;
                            cmdCompany.ExecuteNonQuery();


                        }
                        CompanyInfo.Visible = false;
                        CompanyBranch.Visible = true;
                        ContactInfo.Visible = false;
                        Attachment.Visible = false;
                    }



                }
                catch (Exception ex)
                {
                    if (!(ex is ThreadAbortException))
                    {
                        File.AppendAllText(Server.MapPath(Basic.Errorpath), Environment.NewLine + "Register:  " + Session["UnVerifiedUserEmail"].ToString() + ex.Message + ex.StackTrace + " " + DateTime.Now);

                    }
                }
            }
        }


        protected void Next2_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {

                    using (SqlConnection BranchCon = new SqlConnection(Basic.GetConnectionString))
                    {
                        using (SqlCommand cmdBranch = new SqlCommand("PROC_INSERT_BRANCH_INFO", BranchCon))
                        {
                            cmdBranch.CommandType = CommandType.StoredProcedure;

                            BranchCon.Open();
                            for (int i = 0; i < GridView1.Rows.Count; i++)
                            {
                                cmdBranch.Parameters.Clear();
                                cmdBranch.Parameters.Add(new SqlParameter("@BranchID", SqlDbType.Int)).Value = i + 1;
                                cmdBranch.Parameters.Add(new SqlParameter("@Company_No", SqlDbType.BigInt)).Value = CompNat.Text;
                                cmdBranch.Parameters.Add(new SqlParameter("@BranchName", SqlDbType.NVarChar)).Value = GridView1.Rows[i].Cells[1].Text;
                                cmdBranch.Parameters.Add(new SqlParameter("@@RegistertiontStep", SqlDbType.Int)).Value =3;
                                cmdBranch.ExecuteNonQuery();
                            }

                            CompanyInfo.Visible = false;
                            CompanyBranch.Visible = false;
                            ContactInfo.Visible = true;
                            Attachment.Visible = false;
                        }
                    }
                }
                catch (Exception ex)
                {
                    if (!(ex is ThreadAbortException))
                    {
                        File.AppendAllText(Server.MapPath(Basic.Errorpath), Environment.NewLine + "Register:  " + Session["UnVerifiedUserEmail"].ToString() + ex.Message + ex.StackTrace + " " + DateTime.Now);

                    }
                }
            }

         
        }

        protected void Next3_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {

                    using (SqlConnection DelagatorCon = new SqlConnection(Basic.GetConnectionString))
                    {
                        using (SqlCommand cmdDelagator = new SqlCommand("PROC_INSERT_DELEGATOR_INFO", DelagatorCon))
                        {
                            DelagatorCon.Open();


                            cmdDelagator.Parameters.Clear();
                            cmdDelagator.CommandType = CommandType.StoredProcedure;

                            //cmdDelagator.Parameters.Add(new SqlParameter("@Delegation_NO", SqlDbType.BigInt)).Value = txtNatNo.Text;
                            //cmdDelagator.Parameters.Add(new SqlParameter("@Delegation_Name", SqlDbType.NVarChar)).Value = "ايهاب راتب المحادين"; //txtName.Text;
                            //cmdDelagator.Parameters.Add(new SqlParameter("@Delegation_Nation", SqlDbType.NVarChar)).Value = "اردنية"; //txtNation.Text;
                            //cmdDelagator.Parameters.Add(new SqlParameter("@Status_ID", SqlDbType.Int)).Value = 2;
                            //cmdDelagator.Parameters.Add(new SqlParameter("@Type_ID", SqlDbType.Int)).Value = lstDelegetType.SelectedValue;
                            //cmdDelagator.Parameters.Add(new SqlParameter("@Phone_No", SqlDbType.NVarChar)).Value = txtPhone.Text;
                            //cmdDelagator.Parameters.Add(new SqlParameter("@Email", SqlDbType.NVarChar)).Value = txtEmail.Text;
                            //cmdDelagator.Parameters.Add(new SqlParameter("@Delegation_Position", SqlDbType.NVarChar)).Value = txtJob.Text;
                            //cmdDelagator.Parameters.Add(new SqlParameter("@Company_NO", SqlDbType.BigInt)).Value = txtCompNo.Text;
                            //cmdDelagator.Parameters.Add(new SqlParameter("@Filename", SqlDbType.NVarChar)).Value = "كتاب التفويض.pdf";


                            DelagatorCon.Close();
                            CompanyInfo.Visible = false;
                            CompanyBranch.Visible = false;
                            ContactInfo.Visible = true;
                            Attachment.Visible = false;
                        }
                    }
                }
                catch (Exception ex)
                {
                    if (!(ex is ThreadAbortException))
                    {
                        File.AppendAllText(Server.MapPath(Basic.Errorpath), Environment.NewLine + "Register:  " + Session["UnVerifiedUserEmail"].ToString() + ex.Message + ex.StackTrace + " " + DateTime.Now);

                    }
                }
            }


        }

        protected void Next4_Click(object sender, EventArgs e)
        {


            SanadDiv.Visible = false;
            ContactInfo.Visible = false;
            CompanyInfo.Visible = false;
            CompanyBranch.Visible = false;
            Attachment.Visible = true;
        }


    }
    public class ApiResponse
    {
        public int Status { get; set; }
        public string Message { get; set; }
        public PersonInfo Data { get; set; }
    }

    public class PersonInfo
    {
        public string NATIONALITY { get; set; }

    }
}
