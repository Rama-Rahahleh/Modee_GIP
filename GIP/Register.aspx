<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="GIP.Register" Async="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/Asset/css/Forms.css" rel="stylesheet" />
    <link href="/Asset/css/Grids.css" rel="stylesheet" />

    <style>
        .form-header {
            font-weight: bold;
            font-size: 0.8rem;
            margin-bottom: 15px;
        }

        .form-label {
            font-size: 1rem;
            margin-bottom: 5px;
            display: block;
        }

        .login-btn {
            background-color: #007bff;
            border-color: #007bff;
            font-weight: bold;
        }

        .phoneInput {
            direction: ltr;
            text-align: end;
        }.iti--allow-dropdown input, .iti--allow-dropdown input[type=text], .iti--allow-dropdown input[type=tel], .iti--separate-dial-code input, .iti--separate-dial-code input[type=text], .iti--separate-dial-code input[type=tel] {
    padding: 1rem 5.75rem !important;
}
    </style>
    <script type="text/javascript">   
        function pageLoad(sender, args) {
            $("#DelegetTypeList").select2({ width: '100%', dir: 'rtl' });
            $("#GovernateList").select2({ width: '100%', dir: 'rtl' });
        }


    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 
    <section id="hero" class="hero section Login">

        <img src="Asset/img/hero-bg-abstract.jpg" alt="" data-aos="fade-in" class="">

        <div class="container login">
            <!-- Section Title -->

            <div class="form-signin rounded-sm shadow">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="tab-content">

                            <!-- Tab1 -->
                            <div id="login" class="container tab-pane active">


                                <div id="SanadDiv" runat="server" class="form-group" visible="false">
                                    <div class="container section-title" data-aos="fade-up">
                                        <h2>تسجيل حساب</h2>
                                        <span class="form-header mb-4">يرجى استخدام تفاصيل حسابك على تطبيق سند </span>
                                    </div>
                                    <div style="text-align: center;">
                                        <asp:Label ID="lblMessage" runat="server" ForeColor="red" Font-Bold="true"></asp:Label>
                                    </div>
                                    <div>
                                        <asp:Label ID="Label1" runat="server" CssClass="form-label mb-2" Text="الرقم الوطني/الشخصي"
                                            Font-Bold="true" Font-Size="Small"></asp:Label>

                                      <%--  <asp:TextBox ID="txtNatNo" runat="server" CssClass="form-control mb-2" placeholder="الرقم الوطني/الشخصي"
                                            Font-Bold="true" Font-Size="Smaller" onKeypress="return onlyNumbers(event);"></asp:TextBox>

                                        <asp:RequiredFieldValidator SetFocusOnError="true" ForeColor="red"
                                            Font-Size="Small" Font-Bold="true" Display="Dynamic"
                                            ErrorMessage="يرجى ادخال ادخل الرقم الوطني/ الشخصي"
                                            ID="CompanyNatValidator" runat="server" ValidationGroup="Sanadlogin"
                                            ControlToValidate="txtNatNo"></asp:RequiredFieldValidator>--%>
                                    </div>
                                    <div>
                                        <asp:Label ID="Label2" runat="server" CssClass="form-label mb-2" Text="كلمة مرور تطبيق سند"
                                            Font-Bold="true" Font-Size="Small"></asp:Label>

                                        <asp:TextBox ID="txtsandpass" runat="server" CssClass="form-control mb-2" placeholder="كلمة مرور تطبيق سند"
                                            Font-Bold="true" Font-Size="Small" TextMode="Password"></asp:TextBox>

                                        <asp:RequiredFieldValidator SetFocusOnError="true" ForeColor="red"
                                            Font-Size="Small" Font-Bold="true"
                                            ErrorMessage="يرجى ادخال كلمة المرور"
                                            ID="RequiredFieldValidator1" runat="server" ValidationGroup="Sanadlogin"
                                            ControlToValidate="txtsandpass"></asp:RequiredFieldValidator>
                                    </div>
                                    <div id="forgetDiv" runat="server" style="height: auto; float: inline-end">
                                        <asp:LinkButton ID="ForgetLkBtn" runat="server" Font-Bold="true" Font-Size="12px"
                                            PostBackUrl="~/Forgot.aspx">نسيت كلمة السرّ؟</asp:LinkButton>

                                    </div>


                                    <div class="col-md-12 align-content-center " style="text-align: center;">
                                        <asp:Button ID="Next11" ValidationGroup="Sanadlogin" runat="server"
                                            OnClick="Next1_Click"
                                            CausesValidation="true" CssClass="btn btn-primary mt-5 login-btn col-md-12" Text="تسجيل دخول بإستخدام سند "></asp:Button>

                                    </div>
                                </div>





                                <div id="CompanyInfo" runat="server" >
                                    <div class="container section-title" data-aos="fade-up">
                                        <h2>تسجيل حساب</h2>
                                        <span class="form-header mb-4">يرجى إدخال تفاصيل الخاصة في  الشركة/المؤسسة الفردية</span>
                                    </div>
                                    <div id="Nat" runat="server">

                                        <asp:Label ID="Label9" runat="server" CssClass="form-label mb-2 phoneInput" Text="رقم الوطني لشركة/المؤسسة الفردية"
                                            Font-Bold="true" Font-Size="Small"></asp:Label>

                                        <asp:TextBox ID="CompNat" runat="server" CssClass="form-control mb-2" placeholder="رقم الوطني "
                                            Font-Bold="true" Font-Size="Small"></asp:TextBox>

                                        <asp:RequiredFieldValidator SetFocusOnError="true" ForeColor="red"
                                            Font-Size="Small" Font-Bold="true" Display="Dynamic"
                                            ErrorMessage="يرجى ادخال رقم الوطني لشركة/المؤسسة الفردية"
                                            ID="RequiredFieldValidator6" runat="server" ValidationGroup="CheckCmp"
                                            ControlToValidate="CompNat"></asp:RequiredFieldValidator>


                                        <div class="col-md-12 align-content-center " style="text-align: center;">
                                            <asp:Button ID="CheckComp" ValidationGroup="CheckCmp" runat="server"
                                                OnClick="CheckComp_Click"
                                                CausesValidation="true" CssClass="btn btn-primary mt-5 login-btn col-md-12" Text="تحقق من معلومات شركتك"></asp:Button>

                                        </div>

                                    </div>
                                    <div id="CompInfoResult" runat="server" visible="false">

                                        <div>
                                            <asp:Label ID="Label17" runat="server" CssClass="form-label mb-2" Text="رقم الوطني للشركة/ المؤسسة فردية"
                                                Font-Bold="true" Font-Size="Small"></asp:Label>

                                            <asp:TextBox ID="CompanyNatNumber" runat="server" CssClass="form-control mb-4" placeholder="رقم الوطني للشركة/ المؤسسة فردية"
                                                Font-Bold="true" Font-Size="Small" Enabled="false"></asp:TextBox>
                                        </div>

                                        <div>
                                            <asp:Label ID="Label10" runat="server" CssClass="form-label mb-2" Text="اسم الشركة/المؤسسة فردية"
                                                Font-Bold="true" Font-Size="Small"></asp:Label>

                                            <asp:TextBox ID="CompanyName" runat="server" CssClass="form-control mb-4" placeholder="اسم الشركة/المؤسسة فردية"
                                                Font-Bold="true" Font-Size="Small"></asp:TextBox>
                                        </div>

                                        <div>
                                            <asp:Label ID="Label15" runat="server" CssClass="form-label mb-2" Text="تاريخ تأسيس الشركة/مؤسسة فردية"
                                                Font-Bold="true" Font-Size="Small"></asp:Label>

                                            <asp:TextBox ID="CompanyRegDate" runat="server" CssClass="form-control mb-4" placeholder="تاريخ تأسيس الشركة/مؤسسة فردية"
                                                Font-Bold="true" Font-Size="Small"></asp:TextBox>
                                        </div>

                                        <div>
                                            <asp:Label ID="Label16" runat="server" CssClass="form-label mb-2" Text="رقم الضمان الاجتماعي للشركة/ المؤسسة فردية"
                                                Font-Bold="true" Font-Size="Small" Visible="false"></asp:Label>

                                            <asp:TextBox ID="SSCNumber" runat="server" CssClass="form-control mb-4" placeholder="رقم الضمان الاجتماعي للشركة/ المؤسسة فردية"
                                                Font-Bold="true" Font-Size="Small" Visible="false"></asp:TextBox>
                                        </div>

                                        <div>
                                            <asp:Label ID="Label11" runat="server" CssClass="form-label mb-2" Text="رقم الهاتف الشركة/مؤسسة فردية"
                                                Font-Bold="true" Font-Size="Small"></asp:Label>

                                            <asp:TextBox ID="CompanyPhone" runat="server" CssClass="form-control mb-2 phoneInput" placeholder="رقم الهاتف الشركة/مؤسسة فردية"
                                                 type="tel" ClientIDMode="Static"
                                                         Font-Bold="true" Font-Size="Small"                                                      
                                                        onKeypress="return onlyNumbers(event);"
                                                        Width="100%" TextMode="Phone" ></asp:TextBox>

                                                    <span id="valid-msg" class=" d-inline-block" style="color: green" tabindex="0" data-toggle="popover" data-content="" data-placement="right"></span>
                                                    <%--<span id="error-msg" class=" d-inline-block"  style="color:red" tabindex="0" data-toggle="tooltip" data-placement="right"></span>--%>
                                                    <span id="error-msg" class=" d-inline-block" style="color: red" data-toggle="popover" data-placement="right"></span>

                                                    <asp:CustomValidator ID="CustomValidator4" runat="server"
                                                        ClientValidationFunction="phonenumber" ControlToValidate="CompanyPhone"
                                                        ValidationGroup="CompanyInfo"
                                                        CssClass="validator" Display="Dynamic"
                                                        Font-Bold="true" Font-Size="Smaller" ForeColor="Red"></asp:CustomValidator>

                                                    

                                            <asp:RequiredFieldValidator runat="server"
                                                ID="RequiredFieldValidator11" ControlToValidate="CompanyPhone"
                                                ErrorMessage="يرجى ادخال رقم الهاتف   !" 
                                                CssClass="validator"
                                                ForeColor="Red" Font-Size="Small" Font-Bold="true"
                                                ValidationGroup="CompanyInfo">  
                                            </asp:RequiredFieldValidator>
                                        </div>

                                        <div>
                                            <asp:Label ID="Label12" runat="server" CssClass="form-label mb-2" Text="البريد الالكتروني الشركة/مؤسسة فردية"
                                                Font-Bold="true" Font-Size="Small"></asp:Label>

                                            <asp:TextBox ID="CompanyEmail" runat="server" CssClass="form-control mb-2" placeholder="البريد الالكتروني الشركة/مؤسسة فردية"
                                                Font-Bold="true" Font-Size="Small"></asp:TextBox>

                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server"
                                                ControlToValidate="CompanyEmail"
                                                ErrorMessage="بريد إلكتروني خاطىء !"
                                                Display="Dynamic"
                                                Font-Bold="true" Font-Size="Smaller" ForeColor="Red"
                                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                ValidationGroup="CompanyInfo"></asp:RegularExpressionValidator>


                                            <asp:RequiredFieldValidator runat="server"
                                                ID="RequiredFieldValidator12" ControlToValidate="CompanyEmail"
                                                ErrorMessage="يرجى ادخال البريد الالكتروني !"
                                                CssClass="validator"
                                                ForeColor="Red" Font-Size="Small" Font-Bold="true"
                                                ValidationGroup="CompanyInfo">  
                                            </asp:RequiredFieldValidator>
                                        </div>
                                        <div>
                                            <asp:Label ID="Label22" runat="server" CssClass="form-label mb-2" Text="اسم المفوض بالتوقيع "
                                                Font-Bold="true" Font-Size="Small"></asp:Label>

                                            <asp:TextBox ID="CompSignDel" runat="server" CssClass="form-control mb-4" placeholder="اسم المفوض بالتوقيع"
                                                Font-Bold="true" Font-Size="Small"></asp:TextBox>

                                            <asp:RequiredFieldValidator runat="server"
                                                ID="RequiredFieldValidator13" ControlToValidate="CompSignDel"
                                                ErrorMessage="يرجى ادخال اسم المفوض بالتوقيع !"
                                                CssClass="validator"
                                                ForeColor="Red" Font-Size="Small" Font-Bold="true"
                                                ValidationGroup="CompanyInfo">  
                                            </asp:RequiredFieldValidator>
                                        </div>


                                        <div>
                                            <asp:Label ID="Label14" runat="server" CssClass="form-label mb-2" Text="المحافظة"
                                                Font-Bold="true" Font-Size="Small"></asp:Label>

                                            <asp:DropDownList ID="GovernateList" CssClass="mb-4"
                                                runat="server" AppendDataBoundItems="true"                                                
                                                 ClientIDMode="Static"
                                                DataTextField="GovernateID" DataValueField="GovernateID"
                                                >
                                                <asp:ListItem Text="اختر المحافظة" Value="0" />
                                            </asp:DropDownList>
                                           <%-- <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                                ConnectionString="<%$ ConnectionStrings:GIPInatiativesConnectionString %>"
                                                SelectCommandType="StoredProcedure"
                                                SelectCommand="GovernateLookUp"></asp:SqlDataSource>--%>

                                            <asp:RequiredFieldValidator runat="server"
                                                ID="RequiredFieldValidator5" ControlToValidate="GovernateList"
                                                ErrorMessage="يرجى اختيار المحافظة   !" InitialValue="0"
                                                CssClass="validator"
                                                ForeColor="Red" Font-Size="Small" Font-Bold="true"
                                                ValidationGroup="CompanyInfo">  
                                            </asp:RequiredFieldValidator>
                                        </div>


                                        <div>
                                            <asp:Label ID="Label13" runat="server" CssClass="form-label mb-2" Text="النشاط الرئيسي لشركة /المؤسسة الفردية"
                                                Font-Bold="true" Font-Size="Small"></asp:Label>

                                            <asp:TextBox ID="MainActive" runat="server" CssClass="form-control mb-2" placeholder="النشاط الرئيسي لشركة /المؤسسة الفردية"
                                                Font-Bold="true" Font-Size="Small" TextMode="MultiLine"></asp:TextBox>

                                            <asp:RequiredFieldValidator runat="server"
                                                ID="RequiredFieldValidator3" ControlToValidate="MainActive"
                                                ErrorMessage="يرجى ادخال المسمى الوظيفي  !"
                                                CssClass="validator" Display="Dynamic"
                                                ForeColor="Red" Font-Size="Small" Font-Bold="true"
                                                ValidationGroup="CompanyInfo">  
                                            </asp:RequiredFieldValidator>
                                        </div>


                                        <div class="col-md-12 align-content-center " style="text-align: center;">
                                            <asp:Button ID="Next1" ValidationGroup="CompanyInfo" runat="server"
                                                OnClick="Next1_Click"
                                                CausesValidation="true" CssClass="btn btn-primary mt-5 login-btn col-md-12" Text="التالي"></asp:Button>

                                        </div>
                                    </div>
                                </div>

                                <div id="CompanyBranch" runat="server" visible="false" >
                                    <div>
                                        <div>
                                            <asp:Label ID="Label18" runat="server" CssClass="form-label mb-2" Text="أفرع للشركة/ المؤسسة فردية"
                                                Font-Bold="true" Font-Size="Small"></asp:Label>
                                            <asp:TextBox ID="CompBranch" runat="server" CssClass="form-control " placeholder="أفرع للشركة/ المؤسسة فردية"
                                                Font-Bold="true" Font-Size="Small"></asp:TextBox>

                                            <asp:RequiredFieldValidator runat="server"
                                                ID="RequiredFieldValidator7" ControlToValidate="CompBranch"
                                                ErrorMessage="يرجى ادخال أفرع للشركة/ المؤسسة فردية  !"
                                                CssClass="validator" Display="Dynamic"
                                                ForeColor="Red" Font-Size="Small" Font-Bold="true"
                                                ValidationGroup="CompanyBranch">  
                                            </asp:RequiredFieldValidator>

                                        </div>
                                        <asp:Button ID="AddBranch" Text="اضافة الفرع" CssClass="btn btn-primary mt-2 login-btn col-md-12" runat="server"
                                            OnClick="AddBranch_Click" ValidationGroup="CompanyBranch" />

                                        <div class="table-responsive mt-2" dir="rtl">
                                            <asp:GridView ID="GridView1" runat="server" DataKeyNames="BranchID"
                                                Width="100%"
                                                CssClass= "table-bordered table-hover table-striped"
                                                HorizontalAlign="Center"
                                                BackColor="White" BorderStyle="None"
                                                ForeColor="#333333"
                                                AutoGenerateColumns="False"
                                                EmptyDataText="لا يوجد فروع"
                                                OnRowCommand="GridView1_RowCommand">
                                                <Columns>
                                                    <asp:BoundField DataField="BranchID" HeaderText="التسلسل">
                                                        <ItemStyle></ItemStyle>
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="Placename" HeaderText="الفرع">
                                                        <ItemStyle></ItemStyle>
                                                    </asp:BoundField>

                                                    <asp:ButtonField ButtonType="Image" CommandName="DeleteRow" ImageUrl="~/Asset/img/Delete.png" Text="حذف" />
                                                </Columns>



                                                <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                                                <RowStyle BackColor="White" BorderStyle="Solid" BorderWidth="1px" />
                                                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                                <SortedAscendingHeaderStyle BackColor="#808080" />
                                                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                                <SortedDescendingHeaderStyle BackColor="#383838" />

                                                <HeaderStyle ForeColor="#1277a7" Font-Bold="true" CssClass="TableHeader" Font-Size="x-small" />
                                                <RowStyle BackColor="#FFFFFFF" ForeColor="#333333" HorizontalAlign="Center" Font-Size="x-small" Font-Bold="true" BorderColor="White" />
                                            </asp:GridView>

                                            <asp:SqlDataSource ID="SqlDataSource4" runat="server"
                                                ConnectionString="<%$ ConnectionStrings:GIPInatiativesConnectionString %>"
                                                SelectCommand="Read_All_Branch" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:SessionParameter Name="Company_No" SessionField="compno" Type="Int32" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </div>
                                    </div>

                                    <div class="col-md-12 align-content-center " style="text-align: center;">
                                        <asp:Button ID="Next2" ValidationGroup="CompanyInfo" runat="server"
                                            OnClick="Next2_Click"
                                            CausesValidation="true" CssClass="btn btn-primary mt-5 login-btn col-md-12" Text="التالي"></asp:Button>

                                    </div>
                                </div>

                                <div id="ContactInfo" runat="server" visible="false">
                                    <div class="container section-title" data-aos="fade-up">
                                        <h2>تسجيل حساب</h2>
                                        <span class="form-header mb-4">يرجى إدخال تفاصيل الخاصة في مقدم الطلب </span>
                                    </div>
                                    <div>
                                        <asp:Label ID="Label23" runat="server" CssClass="form-label mb-2" Text="الرقم الوطني/الشخصي"
                                            Font-Bold="true" Font-Size="Small"></asp:Label>

                                        <asp:TextBox ID="txtNatNo" runat="server" CssClass="form-control mb-2" placeholder="الرقم الوطني/الشخصي"
                                            Font-Bold="true" Font-Size="Smaller" onKeypress="return onlyNumbers(event);"></asp:TextBox>

                                        <asp:RequiredFieldValidator SetFocusOnError="true" ForeColor="red"
                                            Font-Size="Small" Font-Bold="true" Display="Dynamic"
                                            ErrorMessage="يرجى ادخال ادخل الرقم الوطني/ الشخصي"
                                            ID="CompanyNatValidator" runat="server" ValidationGroup="Sanadlogin"
                                            ControlToValidate="txtNatNo"></asp:RequiredFieldValidator>
                                    </div>
                                 <%--   <div>
                                        <asp:Label ID="Label24" runat="server" CssClass="form-label mb-2" Text="القيد المدني"
                                            Font-Bold="true" Font-Size="Small"></asp:Label>
                                        <asp:TextBox ID="civilRec" runat="server" CssClass="form-control mb-2" placeholder="القيد المدني"
                                            Font-Bold="true" Font-Size="Smaller" onKeypress="return onlyNumbers(event);"></asp:TextBox>

                                        <asp:RequiredFieldValidator SetFocusOnError="true" ForeColor="red"
                                            Font-Size="Small" Font-Bold="true" Display="Dynamic"
                                            ErrorMessage="يرجى ادخال القيد المدني"
                                            ID="RequiredFieldValidator14" runat="server" ValidationGroup="Sanadlogin"
                                            ControlToValidate="civilRec"></asp:RequiredFieldValidator>

                                    </div>
                                    <div>
                                        <asp:Label ID="Label25" runat="server" CssClass="form-label mb-2" Text="القيد المدني"
                                             Font-Bold="true" Font-Size="Small"></asp:Label>
                                        <asp:TextBox ID="BOD" runat="server" CssClass="form-control mb-2" placeholder="تاريخ الميلاد"
                                            Font-Bold="true" Font-Size="Smaller" onKeypress="return onlyNumbers(event);"></asp:TextBox>

                                        <asp:RequiredFieldValidator SetFocusOnError="true" ForeColor="red"
                                            Font-Size="Small" Font-Bold="true" Display="Dynamic"
                                            ErrorMessage="يرجى ادخال تاريخ الميلاد"
                                            ID="RequiredFieldValidator15" runat="server" ValidationGroup="Sanadlogin"
                                            ControlToValidate="civilRec"></asp:RequiredFieldValidator>

                                    </div>--%>

                                    <div class="col-md-12 align-content-center " style="text-align: center;">
                                        <asp:Button ID="CheckCSPD" ValidationGroup="CompanyInfo" runat="server"
                                            OnClick="CheckCSPD_Click"
                                            CausesValidation="true" CssClass="btn btn-primary mt-5 login-btn col-md-12" Text="التالي"></asp:Button>

                                    </div>
                                    <div>
                                        <asp:Label ID="Label3" runat="server" CssClass="form-label mb-2" Text="اسم مقدم الطلب"
                                            Font-Bold="true" Font-Size="Small"></asp:Label>

                                        <asp:TextBox ID="SanadName" runat="server" CssClass="form-control mb-4" placeholder="اسم مقدم الطلب"
                                            Font-Bold="true" Font-Size="Small" Enabled="false"></asp:TextBox>
                                    </div>
                                    <div>
                                        <asp:Label ID="Label4" runat="server" CssClass="form-label mb-2" Text="جنسية مقدم الطلب"
                                            Font-Bold="true" Font-Size="Small"></asp:Label>

                                        <asp:TextBox ID="SanadNat" runat="server" CssClass="form-control mb-4" placeholder="جنسية مقدم الطلب"
                                            Font-Bold="true" Font-Size="Small" Enabled="false"></asp:TextBox>
                                    </div>
                                    <div>
                                        <asp:Label ID="Label5" runat="server" CssClass="form-label mb-2 " Text="رقم الهاتف لمقدم الطلب"
                                            Font-Bold="true" Font-Size="Small"></asp:Label>

                                        <asp:TextBox ID="SanadPhone" runat="server" CssClass="form-control mb-4 phoneInput" placeholder="رقم الهاتف لمقدم الطلب"
                                            Font-Bold="true" Font-Size="Small"></asp:TextBox>
                                    </div>
                                    <div>
                                        <asp:Label ID="Label6" runat="server" CssClass="form-label mb-2" Text="البريد الالكتروني لمقدم الطلب"
                                            Font-Bold="true" Font-Size="Small"></asp:Label>

                                        <asp:TextBox ID="SanadEmail" runat="server" CssClass="form-control mb-4" placeholder="البريد الالكتروني لمقدم الطلب"
                                            Font-Bold="true" Font-Size="Small" ></asp:TextBox>
                                    </div>
                                    <div>
                                        <asp:Label ID="Label7" runat="server" CssClass="form-label mb-2" Text="المسمى الوظيفي لمقدم الطلب"
                                            Font-Bold="true" Font-Size="Small"></asp:Label>

                                        <asp:TextBox ID="SanadJob" runat="server" CssClass="form-control mb-2" placeholder="المسمى الوظيفي لمقدم الطلب"
                                            Font-Bold="true" Font-Size="Small"></asp:TextBox>

                                        <asp:RequiredFieldValidator runat="server"
                                            ID="RequiredFieldValidator4" ControlToValidate="SanadJob"
                                            ErrorMessage="يرجى ادخال المسمى الوظيفي  !"
                                            CssClass="validator" Display="Dynamic"
                                            ForeColor="Red" Font-Size="Small" Font-Bold="true"
                                            ValidationGroup="ApplicantInfo">  
                                        </asp:RequiredFieldValidator>
                                    </div>

                                    <div>
                                        <asp:Label ID="Label8" runat="server" CssClass="form-label mb-2" Text="صفة مقدم الطلب"
                                            Font-Bold="true" Font-Size="Small"></asp:Label>

                                        <asp:DropDownList ID="DelegetTypeList" CssClass="form-control-list"
                                            runat="server" Font-Size="10pt" AppendDataBoundItems="true"
                                            DataSourceID="SqlDataSource3" ClientIDMode="Static"
                                            OnSelectedIndexChanged="DelegetTypeList_SelectedIndexChanged"
                                            DataTextField="Delegation_Type" DataValueField="Delegation_ID">
                                            <asp:ListItem Text="صفة مقدم الطلب" Value="0" />
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                                            ConnectionString="<%$ ConnectionStrings:GIPInatiativesConnectionString %>"
                                            SelectCommand="DelegationLookUp" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

                                        <asp:RequiredFieldValidator runat="server"
                                            ID="RequiredFieldValidator2" ControlToValidate="DelegetTypeList"
                                            ErrorMessage="يرجى اختيار صفة المقدم   !" InitialValue="0"
                                            CssClass="validator" Display="Dynamic"
                                            ForeColor="Red" Font-Size="Small" Font-Bold="true"
                                            ValidationGroup="ApplicantInfo">  
                                        </asp:RequiredFieldValidator>
                                    </div>

                                    <div class="col-md-12 align-content-center " style="text-align: center;">
                                        <asp:Button ID="Next3" ValidationGroup="ApplicantInfo" runat="server"
                                            OnClick="Next3_Click"
                                            CausesValidation="true" CssClass="btn btn-primary mt-5 login-btn col-md-12" Text="التالي"></asp:Button>

                                    </div>
                                </div>

                                <div id="Attachment" runat="server" visible="false" >
                                    <asp:Label ID="lblmsg" runat="server" ></asp:Label>
                                    <div>
                                        <asp:Label ID="Label19" runat="server" CssClass="form-label mb-2" Text="صورة كتاب التفويض بالتوقيع"
                                            Font-Bold="true" Font-Size="Small"></asp:Label>

                                        <div class="container">
                                            <asp:FileUpload ID="CompSignDelFile" CssClass="form-control mb-4" runat="server" />
                                        </div>
                                        <asp:RequiredFieldValidator runat="server"
                                            ID="RequiredFieldValidator8" ControlToValidate="CompSignDelFile"
                                            ErrorMessage="يرجى ادخال كتاب التفويض  !"
                                            CssClass="validator" Display="Dynamic"
                                            ForeColor="Red" Font-Size="Small" Font-Bold="true"
                                            ValidationGroup="CompanyAttch">  
                                        </asp:RequiredFieldValidator>

                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                            ControlToValidate="CompSignDelFile" ValidationGroup="CompanyAttch"
                                            ValidationExpression="^.*\.(pdf|PDF)$" SetFocusOnError="true"
                                            Font-Size="X-Small" Font-Bold="true" ForeColor="Red" Display="Dynamic"
                                            ErrorMessage="يرجى اختيار امتداد صحيح  (.pdf)"></asp:RegularExpressionValidator>

                                        <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="يرجى مراعاة حجم الملف المرفق "
                                            ControlToValidate="CompSignDelFile" ValidationGroup="CompanyAttch"
                                            Font-Size="X-Small" Font-Bold="true" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"
                                            ClientValidationFunction="CompSignDelFileSize"></asp:CustomValidator>
                                    </div>
                                    <div>
                                        <asp:Label ID="Label20" runat="server" CssClass="form-label mb-2" Text="شهادة تسجيل الشركة"
                                            Font-Bold="true" Font-Size="Small"></asp:Label>

                                        <div class="container">
                                            <asp:FileUpload ID="CompRegisterFile" CssClass="form-control mb-4" runat="server" />
                                        </div>
                                        <asp:RequiredFieldValidator runat="server"
                                            ID="RequiredFieldValidator9" ControlToValidate="CompRegisterFile"
                                            ErrorMessage="يرجى ادخال شهادة تسجيل الشركة  !"
                                            CssClass="validator" Display="Dynamic"
                                            ForeColor="Red" Font-Size="Small" Font-Bold="true"
                                            ValidationGroup="CompanyAttch">  
                                        </asp:RequiredFieldValidator>

                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                                            ControlToValidate="CompRegisterFile" ValidationGroup="CompanyAttch"
                                            ValidationExpression="^.*\.(pdf|PDF)$" SetFocusOnError="true"
                                            Font-Size="X-Small" Font-Bold="true" ForeColor="Red" Display="Dynamic"
                                            ErrorMessage="يرجى اختيار امتداد صحيح  (.pdf)"></asp:RegularExpressionValidator>

                                        <asp:CustomValidator ID="CustomValidator2" runat="server" ErrorMessage="يرجى مراعاة حجم الملف المرفق "
                                            ControlToValidate="CompRegisterFile" ValidationGroup="CompanyAttch"
                                            Font-Size="X-Small" Font-Bold="true" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"
                                            ClientValidationFunction="CompRegisterFileSize"></asp:CustomValidator>
                                    </div>
                                    <div>
                                        <asp:Label ID="Label21" runat="server" CssClass="form-label mb-2" Text="رخصة مهن سارية المفعول"
                                            Font-Bold="true" Font-Size="Small"></asp:Label>

                                        <div class="container">
                                            <asp:FileUpload ID="CompCertFile" CssClass="form-control mb-4" runat="server" />
                                        </div>
                                        <asp:RequiredFieldValidator runat="server"
                                            ID="RequiredFieldValidator10" ControlToValidate="CompCertFile"
                                            ErrorMessage="يرجى ادخال رخصة المهن  !"
                                            CssClass="validator" Display="Dynamic"
                                            ForeColor="Red" Font-Size="Small" Font-Bold="true"
                                            ValidationGroup="CompanyAttch">  
                                        </asp:RequiredFieldValidator>

                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                                            ControlToValidate="CompCertFile" ValidationGroup="CompanyAttch"
                                            ValidationExpression="^.*\.(pdf|PDF)$" SetFocusOnError="true"
                                            Font-Size="X-Small" Font-Bold="true" ForeColor="Red" Display="Dynamic"
                                            ErrorMessage="يرجى اختيار امتداد صحيح  (.pdf)"></asp:RegularExpressionValidator>

                                        <asp:CustomValidator ID="CustomValidator3" runat="server" ErrorMessage="يرجى مراعاة حجم الملف المرفق "
                                            ControlToValidate="CompCertFile" ValidationGroup="CompanyAttch"
                                            Font-Size="X-Small" Font-Bold="true" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"
                                            ClientValidationFunction="CompCertFileSize"></asp:CustomValidator>
                                    </div>
                                    <div>
                                        <asp:CheckBox ID="chkApprove" runat="server"
                                            Text=" - اقر انا معبئ الطلب أن جميع المعلومات المعبأة بهذا الطلب صحيحة، واتحمل مسؤولية اي خطأ" Checked="true" />
                                    </div>

                                    <div class="col-md-12 align-content-center " style="text-align: center;">
                                        <asp:Button ID="Next4" ValidationGroup="CompanyInfo" runat="server"
                                            OnClick="Next4_Click"
                                            CausesValidation="true" CssClass="btn btn-primary mt-5 login-btn col-md-12" Text="إرسال"></asp:Button>

                                    </div>
                                </div>

                            </div>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                     
                         <asp:PostBackTrigger ControlID="Next2" />
                               <asp:PostBackTrigger ControlID="CheckComp" />
                               <asp:PostBackTrigger ControlID="Next3" />
                        <asp:PostBackTrigger ControlID="Next4" />
                       
            
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>

    </section>
    <%--phone number--%>
    <script>
        function phonenumber(sender, args) {
            var input = document.getElementById("<%=CompanyPhone.ClientID%>");
            if (window.intlTelInput && input) {
                var errorMap = ["رقم غير صالح", "رمز البلد غير صالح", "الرقم المدخل اقصر من المسموح به", "الرقم المدخل اطول من المسموح به", "رقم غير صالح"];

                // Initialize the plugin
                var iti = window.intlTelInput(input, {
                    utilsScript: "/Asset/css/build/js/utils.js?1638200991544",
                    nationalMode: false,
                    separateDialCode: true,
                    dropdownContainer: 'body',
                    initialCountry: "jo" // Set Jordan as the default country
                });

                if (input.value.trim()) {
                    if (iti.isValidNumber()) {
                        args.IsValid = true;
                    } else {
                        input.classList.add("error");
                        var errorCode = iti.getValidationError();
                        sender.innerHTML = errorMap[errorCode];
                        args.IsValid = false;
                    }
                }
            }
        }

        function initializeIntlTelInput() {
            var input = document.getElementById("<%=CompanyPhone.ClientID%>");
            // Initialize the plugin
            var iti = window.intlTelInput(input, {
                utilsScript: "/Asset/css/build/js/utils.js?1638200991544",      
                nationalMode: false,
                separateDialCode: true,
                dropdownContainer: 'body',
                initialCountry: "jo" // Set Jordan as the default country
            });
        }

        // Call the initialization function on page load
        initializeIntlTelInput();
    </script>

    <script>
        // Function to reinitialize intlTelInput and styles after an async postback
        function reinitializeAfterAsyncPostback() {
            initializeIntlTelInput();
        }

        // Attach the reinitialization function to the EndRequest event
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(reinitializeAfterAsyncPostback);
    </script>

    <script>
        function onlyNumbers(event) {
            var charCode = (event.which) ? event.which : event.keyCode;
            if (charCode < 48 || charCode > 57) {
                event.preventDefault();
                return false;
            }
            return true;
        }



        function CompSignDelFileSize(source, arguments) {
            arguments.IsValid = false;

            var size = document.getElementById("<%=CompSignDelFile.ClientID%>").files[0].size;
            if (size > 4194304) {
                arguments.IsValid = false;
                return false;
            }
            else {
                arguments.IsValid = true;
                return true;
            }
        }



        function CompRegisterFileSize(source, arguments) {
            arguments.IsValid = false;

            var size = document.getElementById("<%=CompRegisterFile.ClientID%>").files[0].size;
     if (size > 4194304) {
         arguments.IsValid = false;
         return false;
     }
     else {
         arguments.IsValid = true;
         return true;
     }
 }


 function CompCertFileSize(source, arguments) {
     arguments.IsValid = false;

     var size = document.getElementById("<%=CompCertFile.ClientID%>").files[0].size;
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
    <script>
        function showContent(status, messgae) {
            toastr.options = {
                'closeButton': true,
                'closeClass': 'toast-close-button',
                'closeDuration': 1000,
                'closeEasing': 'swing',
                'closeHtml': '<button><i class="icon-off"></i></button>',
                'closeMethod': 'fadeOut',
                'closeOnHover': true,
                'containerId': 'toast-container',
                'debug': false,
                'escapeHtml': false,
                'extendedTimeOut': 60000,
                'hideDuration': 1000,
                'hideEasing': 'linear',
                'hideMethod': 'fadeOut',
                'iconClass': 'toast-info',
                'messageClass': 'toast-message',
                'newestOnTop': false,
                'onHidden': null,
                'onShown': null,
                'positionClass': 'toast-bottom-left',
                'preventDuplicates': true,
                'progressBar': true,
                'progressClass': 'toast-progress',
                'rtl': false,
                'showDuration': 600,
                'showEasing': 'swing',
                'showMethod': 'fadeIn',
                'tapToDismiss': true,
                'target': 'body',
                'timeOut': 6000,
                'titleClass': 'toast-title',
                'toastClass': 'toast',

            }

            if (status == 'success') { toastr["success"](messgae); }
            else if (status == 'info') { toastr["info"](messgae); }
            else if (status == 'error') { toastr["error"](messgae); }
            else if (status == 'warning') { toastr["warning"](messgae); }
        }

    </script>
</asp:Content>
