using GIP.App_Code;
using GIP.SSC;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.ServiceModel.Channels;
using System.ServiceModel;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static GIP.IDMuserInfo;
using System.Data.SqlClient;
using System.Data;

namespace GIP.Company
{
    public partial class NewApplication : System.Web.UI.Page
    {
        BasicString Basic = new BasicString();
        string SocialSNumber = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            Basic.Errorpath = "/ErrorLog/Josn.txt";
            if (Session["CmpID"] == null)
            {
                Response.Redirect("/Logout.aspx");

            }
            else
            {

            }
        }
        private void GetPersonNationality(string natNo,string birthDate,string civNo)
        {
            string baseUrl = "https://api-gateway.stg.gsb.gov.jo:9443/porg-g2g/g2g/cspd/web/api-v2/person-info";
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
                    string requestUrl = $"{baseUrl}?NAT_NO={natNo}&BIRTHDT={birthDate}&CIV_NO={civNo}";


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
                        //lblMessage.Text = "JSON deserialization error: " + jsonEx.Message;
                        return;
                    }

                    // Read the NATIONALITY field
                    if (apiResponse != null && apiResponse.ToString() != " ")
                    {
                        lblName.Text = apiResponse.Data.ANAME1 + " " + apiResponse.Data.ANAME2 + " " + apiResponse.Data.ANAME3 + " " + apiResponse.Data.ANAME4;
                        string genderCode = apiResponse.Data.Sex;

                        if (genderCode == "1")
                        {
                            lstGender.Text = "ذكر";

                        }
                        else if (genderCode == "2")
                        {
                            lstGender.Text = "أنثى";

                        }

                    }
                    else
                    {
                        nationality = "No data available";
                    }
                    //SanadNat.Text = nationality;
                }
            }
            catch (HttpRequestException httpEx)
            {
                //lblMessage.Text = "Request error: " + httpEx.Message;
            }
            catch (Exception ex)
            {
                //lblMessage.Text = "General error: " + ex.Message;
            }
        }

        public void GetSSCSubscription()
        {
           
            SSC.IndividualServicesClient client = new SSC.IndividualServicesClient();
            client.ClientCredentials.UserName.UserName = Basic.GetGsbUser;
            client.ClientCredentials.UserName.Password = Basic.GetGsbPass;


                  using (var SubscriptionPeriodScope = new OperationContextScope(client.InnerChannel))
                    {
                        HttpRequestMessageProperty SubscriptionPeriodRequestMessage = new HttpRequestMessageProperty();
                        SubscriptionPeriodRequestMessage.Headers["X-IBM-Client-Id"] = Basic.GetClientID;
                        OperationContext.Current.OutgoingMessageProperties[HttpRequestMessageProperty.Name] = SubscriptionPeriodRequestMessage;
                        SubscriptionPeriodRequestMessage.Headers["X-IBM-Client-Secret"] = Basic.GetClientSecret;
                        OperationContext.Current.OutgoingMessageProperties[HttpRequestMessageProperty.Name] = SubscriptionPeriodRequestMessage;
                        SSC.SubscriptionPeriod_Result sub = new SSC.SubscriptionPeriod_Result();

                        sub = client.GetSubscriptionPeriod("", txtNatNo.Text, "moict");
                         SocialSNumber =sub.SubscriptionPeriodInfo_Item.InsuranceID;
                        GridView1.DataSource = sub.SubscriptionPeriodDetail_Array;
                        GridView1.DataBind();
                        GridView1.Visible = true;
                    }
        }
        protected void CheckNat_Click(object sender, EventArgs e)
        {
            GetPersonNationality(txtNatNo.Text,Convert.ToDateTime(txtDOB.Text).ToString("M/dd/yyyy"), txtCivilNo.Text);
            
            GetSSCSubscription();
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            if(Page.IsValid)
            {
                SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["GIPInatiativesConnectionString"].ConnectionString);
                SqlTransaction transaction = null;

                String sqlTrainer = "PROC_INSERT_TRAINER_INFO";

                SqlCommand cmdTrainer;
                cmdTrainer = new SqlCommand(sqlTrainer, con);
                cmdTrainer.Parameters.Clear();
                cmdTrainer.CommandType = CommandType.StoredProcedure;

                cmdTrainer.Parameters.Add(new SqlParameter("@NNO", SqlDbType.BigInt)).Value = txtNatNo.Text;
                cmdTrainer.Parameters.Add(new SqlParameter("@Name", SqlDbType.NVarChar)).Value = lblName.Text;//txtCompName.Text;
                cmdTrainer.Parameters.Add(new SqlParameter("@SSNO", SqlDbType.BigInt)).Value = SocialSNumber;
                cmdTrainer.Parameters.Add(new SqlParameter("@CompanyID", SqlDbType.BigInt)).Value =Convert.ToInt32(Session["CmpID"].ToString());
                cmdTrainer.Parameters.Add(new SqlParameter("@ProgramID", SqlDbType.Int)).Value = Session["TrianType"];
                cmdTrainer.Parameters.Add(new SqlParameter("@StatusID", SqlDbType.Int)).Value = 1;
                cmdTrainer.Parameters.Add(new SqlParameter("@GovernateID", SqlDbType.NVarChar)).Value = GovernateList.Text;//Governement
                cmdTrainer.Parameters.Add(new SqlParameter("@GenderID", SqlDbType.NVarChar)).Value = lstGender.Text;
                cmdTrainer.Parameters.Add(new SqlParameter("@PhoneNo", SqlDbType.BigInt)).Value = txtPhone.Text;
                cmdTrainer.Parameters.Add(new SqlParameter("@Email", SqlDbType.NVarChar)).Value = txtEmail.Text;
                cmdTrainer.Parameters.Add(new SqlParameter("@UniversityID", SqlDbType.NVarChar)).Value = lstUniversity.Text;
                cmdTrainer.Parameters.Add(new SqlParameter("@SpecialityID", SqlDbType.NVarChar)).Value = lstDepartment.Text;
                cmdTrainer.Parameters.Add(new SqlParameter("@GPA", SqlDbType.Float)).Value = 91.5;//lblGPA.Text;
                cmdTrainer.Parameters.Add(new SqlParameter("@GraduateDate", SqlDbType.Int)).Value = 2005;//lblGradYear;
                cmdTrainer.Parameters.Add(new SqlParameter("@StartDate", SqlDbType.Date)).Value = txtStartDate.Text;
                cmdTrainer.Parameters.Add(new SqlParameter("@EndDate", SqlDbType.Date)).Value = txtEndDate.Text; ;

                try
                {
                    con.Open();
                    transaction = con.BeginTransaction();
                    cmdTrainer.Transaction = transaction;

                    try
                    {
                        cmdTrainer.ExecuteNonQuery();

                        transaction.Commit();
                        
                        lblmsg.Text = "تم ارسال طلب التدريب بنجاح سيتم اعلامك عند الموافقة او الرفض";
                    }
                    catch (Exception exc)
                    {
                        lblmsg.Text = exc.Message;
                    }
                }
                catch (Exception ex)
                {
                    lblmsg.Text = ex.Message;
                }
                finally
                {
                    con.Close();
                }



            }
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
        public string ANAME1 { get; set; }
        public string ANAME2 { get; set; }
        public string ANAME3 { get; set; }
        public string ANAME4 { get; set; }
        public string Sex { get; set; }
        public string NATIONALITY { get; set; }

    }
}