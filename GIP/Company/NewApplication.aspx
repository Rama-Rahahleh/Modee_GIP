<%@ Page Title="" Language="C#" MasterPageFile="~/Company/Site.Master" AutoEventWireup="true" CodeBehind="NewApplication.aspx.cs" Inherits="GIP.Company.NewApplication" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/Asset/css/Forms.css" rel="stylesheet" />
    <style>
        .form-signin {
            width: 100%;
        }
    </style>
    <script type="text/javascript">   
        function pageLoad(sender, args) {

            $("#GovernateList").select2({ width: '100%', dir: 'rtl' });
        }


    </script>
    <script type="text/javascript">
        function SetTarget() {
            document.forms[0].target = "_blank";
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:UpdateProgress ID="UpdateProgress1" DynamicLayout="false" runat="server" DisplayAfter="0" AssociatedUpdatePanelID="UpdatePanel1">

        <ProgressTemplate>
            <div style="position: fixed; text-align: center; height: 100%; width: 100%; top: 0; right: 0; left: 0; z-index: 9999999; background-color: #000000; opacity: 0;">
                <asp:Image ID="imgUpdateProgress" runat="server" ImageUrl="assets/images/loader.gif"
                    AlternateText="Loading ..." ToolTip="Loading ..."
                    Style="padding: 10px; position: fixed; top: 45%; left: 50%;" />
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>


    <section id="hero" class="hero section Login">
    

        <img src="/Asset/img/hero-bg-abstract.jpg" alt="" data-aos="fade-in" class="">

        <div class="container login">
            <!-- Section Title -->

            <div class="form-signin rounded-sm shadow">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="tab-content">

                            <!-- Tab1 -->
                            <div id="login" class="container tab-pane active ">


                                <div class="container section-title" data-aos="fade-up">
                                    <h2>إضافة متدرب </h2>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <h6>المعلومات الخاصة بالمتدرب</h6>
                                    </div>
                                    <asp:Label ID="lblmsg" runat="server" Font-Size="Large" ForeColor="Red" />
                                    <div class="col-md-3">
                                        <asp:Label ID="Label17" runat="server" CssClass="form-label mb-2" Text=" الرقم الوطني/الشخصي"
                                            Font-Bold="true" Font-Size="Small"></asp:Label>

                                        <asp:TextBox ID="txtNatNo" runat="server" CssClass="form-control mb-4" placeholder="الرقم الوطني/الشخصي"
                                            Font-Bold="true" Font-Size="Small"></asp:TextBox>

                                        <asp:RequiredFieldValidator SetFocusOnError="true" ForeColor="red"
                                            Font-Size="Small" Font-Bold="true" Display="Dynamic"
                                            ErrorMessage="يرجى ادخال ادخل الرقم الوطني/ الشخصي"
                                            ID="CompanyNatValidator" runat="server" ValidationGroup="CheckNat"
                                            ControlToValidate="txtNatNo"></asp:RequiredFieldValidator>
                                    </div>

                                    <div class="col-md-3">
                                        <asp:Label ID="Label10" runat="server" CssClass="form-label mb-2" Text="رقم القيد"
                                            Font-Bold="true" Font-Size="Small"></asp:Label>

                                        <asp:TextBox ID="txtCivilNo" runat="server" CssClass="form-control mb-4" placeholder="رقم القيد"
                                            Font-Bold="true" Font-Size="Small"></asp:TextBox>

                                        <asp:RequiredFieldValidator SetFocusOnError="true" ForeColor="red"
                                            Font-Size="Small" Font-Bold="true" Display="Dynamic"
                                            ErrorMessage="يرجى ادخال ادخل الرقم الوطني/ الشخصي"
                                            ID="RequiredFieldValidator1" runat="server" ValidationGroup="CheckNat"
                                            ControlToValidate="txtCivilNo"></asp:RequiredFieldValidator>
                                    </div>

                                    <div class="col-md-3">
                                        <asp:Label ID="Label15" runat="server" CssClass="form-label mb-2" Text="تاريخ الميلاد"
                                            Font-Bold="true" Font-Size="Small"></asp:Label>

                                        <asp:TextBox ID="txtDOB" runat="server" CssClass="form-control mb-4" placeholder="تاريخ الميلاد"
                                            Font-Bold="true" Font-Size="Small" TextMode="Date"></asp:TextBox>

                                        <asp:RequiredFieldValidator SetFocusOnError="true" ForeColor="red"
                                            Font-Size="Small" Font-Bold="true" Display="Dynamic"
                                            ErrorMessage="يرجى ادخال ادخل الرقم الوطني/ الشخصي"
                                            ID="RequiredFieldValidator2" runat="server" ValidationGroup="CheckNat"
                                            ControlToValidate="txtDOB"></asp:RequiredFieldValidator>
                                    </div>

                                    <div class="col-md-3">
                                        <asp:Button ID="CheckNat" ValidationGroup="Sanadlogin" runat="server"
                                            OnClick="CheckNat_Click"
                                            CausesValidation="true" CssClass="btn btn-primary mt-2 mb-4  login-btn col-md-12" Text="استعلام "></asp:Button>
                                    </div>


                                    <div class="col-md-6">
                                        <asp:Label ID="Label1" runat="server" CssClass="form-label mb-2" Text=" اسم المتدرب"
                                            Font-Bold="true" Font-Size="Small"></asp:Label>

                                        <asp:TextBox ID="lblName" runat="server" CssClass="form-control mb-4" placeholder="اسم المتدرب"
                                            Font-Bold="true" Font-Size="Small" Enabled="false"></asp:TextBox>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:Label ID="Label2" runat="server" CssClass="form-label mb-2" Text=" الجنس"
                                            Font-Bold="true" Font-Size="Small"></asp:Label>

                                        <asp:TextBox ID="lstGender" runat="server" CssClass="form-control mb-4" placeholder="الجنس"
                                            Font-Bold="true" Font-Size="Small" Enabled="false"></asp:TextBox>
                                    </div>

                                    <div class="col-md-4">

                                        <asp:Label ID="Label14" runat="server" CssClass="form-label mb-2" Text="المحافظة"
                                            Font-Bold="true" Font-Size="Small"></asp:Label>

                                        <asp:DropDownList ID="GovernateList" CssClass="mb-4"
                                            runat="server" AppendDataBoundItems="true"
                                            DataSourceID="SqlDataSource1" ClientIDMode="Static"
                                            DataTextField="GovernateName" DataValueField="GovernateID">
                                            <asp:ListItem Text="اختر المحافظة" Value="0" />
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                            ConnectionString="<%$ ConnectionStrings:GIPInatiativesConnectionString %>"
                                            SelectCommandType="StoredProcedure"
                                            SelectCommand="GovernateLookUp"></asp:SqlDataSource>

                                        <asp:RequiredFieldValidator runat="server"
                                            ID="RequiredFieldValidator5" ControlToValidate="GovernateList"
                                            ErrorMessage="يرجى اختيار المحافظة   !" InitialValue="0"
                                            CssClass="validator"
                                            ForeColor="Red" Font-Size="Small" Font-Bold="true"
                                            ValidationGroup="TranInfo">  
                                        </asp:RequiredFieldValidator>
                                    </div>

                                    <div class="col-md-4">
                                        <asp:Label ID="Label12" runat="server" CssClass="form-label mb-2" Text="البريد الالكتروني للمتدرب"
                                            Font-Bold="true" Font-Size="Small"></asp:Label>

                                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control mb-2" placeholder="البريد الالكتروني للمتدرب"
                                            Font-Bold="true" Font-Size="Small"></asp:TextBox>

                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server"
                                            ControlToValidate="txtEmail"
                                            ErrorMessage="بريد إلكتروني خاطىء !"
                                            Display="Dynamic"
                                            Font-Bold="true" Font-Size="Smaller" ForeColor="Red"
                                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                            ValidationGroup="CompanyInfo"></asp:RegularExpressionValidator>


                                        <asp:RequiredFieldValidator runat="server"
                                            ID="RequiredFieldValidator12" ControlToValidate="txtEmail"
                                            ErrorMessage="يرجى ادخال البريد الالكتروني !"
                                            CssClass="validator"
                                            ForeColor="Red" Font-Size="Small" Font-Bold="true"
                                            ValidationGroup="TranInfo">  
                                        </asp:RequiredFieldValidator>

                                    </div>

                                    <div class="col-md-4">
                                        <asp:Label ID="Label11" runat="server" CssClass="form-label mb-2" Text="رقم هاتف المتدرب"
                                            Font-Bold="true" Font-Size="Small"></asp:Label>

                                        <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control mb-2 phoneInput" placeholder="رقم هاتف المتدرب"
                                            Font-Bold="true" Font-Size="Small"></asp:TextBox>

                                        <asp:RequiredFieldValidator runat="server"
                                            ID="RequiredFieldValidator11" ControlToValidate="txtPhone"
                                            ErrorMessage="يرجى ادخال رقم الهاتف   !" InitialValue="0"
                                            CssClass="validator"
                                            ForeColor="Red" Font-Size="Small" Font-Bold="true"
                                            ValidationGroup="TranInfo">  
                                        </asp:RequiredFieldValidator>
                                    </div>

                                </div>
                                <hr />
                                <div class="row">
                                    <div class="col-md-12">
                                        <h6>المعلومات الخاصة بالمؤهلات العلمية</h6>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:Label ID="Label3" runat="server" CssClass="form-label mb-2" Text=" الجامعة"
                                            Font-Bold="true" Font-Size="Small"></asp:Label>

                                        <asp:TextBox ID="lstUniversity" runat="server" CssClass="form-control mb-4" placeholder="الجامعة"
                                            Font-Bold="true" Font-Size="Small"></asp:TextBox>

                                        <asp:RequiredFieldValidator SetFocusOnError="true" ForeColor="red"
                                            Font-Size="Small" Font-Bold="true" Display="Dynamic"
                                            ErrorMessage="يرجى ادخال ادخل الجامعة"
                                            ID="RequiredFieldValidator3" runat="server" ValidationGroup="TranInfo"
                                            ControlToValidate="lstUniversity"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:Label ID="Label4" runat="server" CssClass="form-label mb-2" Text=" التخصص"
                                            Font-Bold="true" Font-Size="Small"></asp:Label>

                                        <asp:TextBox ID="lstDepartment" runat="server" CssClass="form-control mb-4" placeholder="التخصص"
                                            Font-Bold="true" Font-Size="Small"></asp:TextBox>

                                        <asp:RequiredFieldValidator SetFocusOnError="true" ForeColor="red"
                                            Font-Size="Small" Font-Bold="true" Display="Dynamic"
                                            ErrorMessage="يرجى ادخال ادخل الجامعة"
                                            ID="RequiredFieldValidator4" runat="server" ValidationGroup="TranInfo"
                                            ControlToValidate="lstDepartment"></asp:RequiredFieldValidator>
                                    </div>

                                    <div class="col-md-6">
                                        <asp:Label ID="Label5" runat="server" CssClass="form-label mb-2" Text=" المعدل"
                                            Font-Bold="true" Font-Size="Small"></asp:Label>

                                        <asp:TextBox ID="lblGPA" runat="server" CssClass="form-control mb-4" placeholder="المعدل"
                                            Font-Bold="true" Font-Size="Small"></asp:TextBox>

                                        <asp:RequiredFieldValidator SetFocusOnError="true" ForeColor="red"
                                            Font-Size="Small" Font-Bold="true" Display="Dynamic"
                                            ErrorMessage="يرجى ادخال ادخل المعدل"
                                            ID="RequiredFieldValidator6" runat="server" ValidationGroup="TranInfo"
                                            ControlToValidate="lblGPA"></asp:RequiredFieldValidator>
                                    </div>

                                    <div class="col-md-6">
                                        <asp:Label ID="Label6" runat="server" CssClass="form-label mb-2" Text=" سنة التخرج"
                                            Font-Bold="true" Font-Size="Small"></asp:Label>

                                        <asp:TextBox ID="lblGradYear" runat="server" CssClass="form-control mb-4" placeholder="سنة التخرج"
                                            Font-Bold="true" Font-Size="Small"></asp:TextBox>

                                        <asp:RequiredFieldValidator SetFocusOnError="true" ForeColor="red"
                                            Font-Size="Small" Font-Bold="true" Display="Dynamic"
                                            ErrorMessage="يرجى ادخال ادخل المعدل"
                                            ID="RequiredFieldValidator7" runat="server" ValidationGroup="TranInfo"
                                            ControlToValidate="lblGradYear"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-md-12">
                                        <asp:Label ID="Label20" runat="server" CssClass="form-label mb-2" Text="شهادة المؤهل العلمي"
                                            Font-Bold="true" Font-Size="Small"></asp:Label>

                                        <div class="container">
                                            <asp:FileUpload ID="StudiesCer" CssClass="form-control mb-4" runat="server" />
                                             <asp:LinkButton ID="StudiesCerFilelink" runat="server"  Visible="false" OnClick="StudiesCerFilelink_Click" OnClientClick="SetTarget()"></asp:LinkButton>
                                      
                                        </div>
                                        <asp:RequiredFieldValidator runat="server"
                                            ID="RequiredFieldValidator10" ControlToValidate="StudiesCer"
                                            ErrorMessage="يرجى ادخال شهادة المؤهل العلمي  !"
                                            CssClass="validator" Display="Dynamic"
                                            ForeColor="Red" Font-Size="Small" Font-Bold="true"
                                            ValidationGroup="TranInfo">  
                                        </asp:RequiredFieldValidator>

                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                                            ControlToValidate="StudiesCer" ValidationGroup="TranInfo"
                                            ValidationExpression="^.*\.(pdf|PDF)$" SetFocusOnError="true"
                                            Font-Size="X-Small" Font-Bold="true" ForeColor="Red" Display="Dynamic"
                                            ErrorMessage="يرجى اختيار امتداد صحيح  (.pdf)"></asp:RegularExpressionValidator>

                                        <asp:CustomValidator ID="CustomValidator2" runat="server" ErrorMessage="يرجى مراعاة حجم الملف المرفق "
                                            ControlToValidate="StudiesCer" ValidationGroup="TranInfo"
                                            Font-Size="X-Small" Font-Bold="true" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"
                                            ClientValidationFunction="StudiesCerFileSize"></asp:CustomValidator>
                                    </div>
                                </div>

                                <hr />
                                <div class="row">
                                    <div class="col-md-12">
                                        <h6>المعلومات الخاصة ضمان الاجتماعي </h4>
                                    </div>
                                    <div class="col-md-12">
                                        <asp:GridView ID="GridView1" runat="server" CssClass="table" AutoGenerateColumns="false">
                                            <Columns>
                                                <asp:BoundField DataField="CompanyID" HeaderText="Company ID" />
                                                <asp:BoundField DataField="CompanyName" HeaderText="Company Name" />
                                                <asp:BoundField DataField="strStartDate" HeaderText="Start Date" />
                                                <asp:BoundField DataField="strStopDate" HeaderText="Stop Date" NullDisplayText="-" ItemStyle-HorizontalAlign="Center" />
                                            </Columns>
                                        </asp:GridView>
                                    </div>
                                </div>


                                <hr />
                                <div class="row">
                                    <div class="col-md-12">
                                        <h6>تاريخ بداية التدريب ونهاية</h6>
                                    </div>
                                    <div class="col-md-6">
                                        <asp:Label ID="Label7" runat="server" CssClass="form-label mb-2" Text="تاريخ بداية التدريب"
                                            Font-Bold="true" Font-Size="Small"></asp:Label>

                                        <asp:TextBox ID="txtStartDate" runat="server" CssClass="form-control mb-4" placeholder="تاريخ بداية التدريب"
                                            Font-Bold="true" Font-Size="Small" TextMode="Date"></asp:TextBox>

                                        <asp:RequiredFieldValidator SetFocusOnError="true" ForeColor="red"
                                            Font-Size="Small" Font-Bold="true" Display="Dynamic"
                                            ErrorMessage="يرجى ادخال ادخل تاريخ بداية التدريب"
                                            ID="RequiredFieldValidator8" runat="server" ValidationGroup="CheckNat"
                                            ControlToValidate="txtStartDate"></asp:RequiredFieldValidator>

                                    </div>
                                    <div class="col-md-6">
                                        <asp:Label ID="Label8" runat="server" CssClass="form-label mb-2" Text="تاريخ نهاية التدريب"
                                            Font-Bold="true" Font-Size="Small"></asp:Label>

                                        <asp:TextBox ID="txtEndDate" runat="server" CssClass="form-control mb-4" placeholder="تاريخ نهاية التدريب"
                                            Font-Bold="true" Font-Size="Small" TextMode="Date"></asp:TextBox>

                                        <asp:RequiredFieldValidator SetFocusOnError="true" ForeColor="red"
                                            Font-Size="Small" Font-Bold="true" Display="Dynamic"
                                            ErrorMessage="يرجى ادخال ادخل تاريخ نهاية التدريب"
                                            ID="RequiredFieldValidator9" runat="server" ValidationGroup="CheckNat"
                                            ControlToValidate="txtEndDate"></asp:RequiredFieldValidator>
                                    </div>


                                    <div class="col-md-12">
                                        <asp:Button ID="Save" ValidationGroup="TranInfo" runat="server"
                                            OnClick="Save_Click"
                                            CausesValidation="true" CssClass="btn btn-primary mt-2 mb-4  login-btn col-md-12" Text="حفظ"></asp:Button>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="CheckNat" />
                        <asp:AsyncPostBackTrigger ControlID="Save" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>
    </section>
    <script>



        function StudiesCerFileSize(source, arguments) {
            arguments.IsValid = false;

            var size = document.getElementById("<%=StudiesCer.ClientID%>").files[0].size;
            if (size > 4194304) {
                arguments.IsValid = false;
                return false;
            }
            else {
                arguments.IsValid = true;
                return true;
            }
        }



    </script>
</asp:Content>
