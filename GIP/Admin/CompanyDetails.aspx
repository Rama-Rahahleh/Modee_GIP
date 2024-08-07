<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/DashBored.Master" AutoEventWireup="true" CodeBehind="CompanyDetails.aspx.cs" Inherits="GIP.CompanyDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/Asset/css/Forms.css" rel="stylesheet" />
    <link href="/Asset/css/Tabs.css" rel="stylesheet" />
    <link href="/Asset/css/Grids.css" rel="stylesheet" />
    <link href="/Asset/css/ModalPopup.css" rel="stylesheet" />
    <style>
        .form-signin {
            width: 100%;
        }
    </style>

    <script type="text/javascript">
        //$(window).on('load', function () {
        //    $('#my_modal').modal('show');
        //});

        $(document).ready(function () {

            // Variable to be set on click on the modal... Then used when the modal hidden event fires
            var modalClosingMethod = "Programmatically";

            // On modal click, determine where the click occurs and set the variable accordingly
            $('#my_modal').on('click', function (e) {

                if ($(e.target).parent().attr("data-dismiss")) {
                    modalClosingMethod = "by Corner X";
                }
                else if ($(e.target).hasClass("btn-secondary")) {
                    modalClosingMethod = "by Close Button";
                }
                else {
                    modalClosingMethod = "by Background Overlay";
                }

                // Restore the variable "default" value
                //setTimeout(function () {
                //    modalClosingMethod = "Programmatically";
                //}, 500);
            });

            // Modal hidden event fired
            $('#my_modal').on('hidden.bs.modal', function () {
                //console.log("Modal closed " + modalClosingMethod);
                window.location.href = "Companies.aspx";
            });

            // Closing programmatically example
            //$('#my_modal').modal("show");
            //setTimeout(function () {
            //    $('#my_modal').modal("hide");
            //}, 1000);
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="hero" class="hero section Login">

        <img src="/Asset/img/hero-bg-abstract.jpg" alt="" data-aos="fade-in" class="">

        <div class="container login">
            <!-- Section Title -->

            <div class="form-signin rounded-sm shadow">
                <div class="tab-content">

                    <!-- Tab1 -->
                    <div id="login" class="container tab-pane active ">


                        <div class="container section-title" data-aos="fade-up">
                            <h2>تفاصيل طلب الشركة </h2>
                        </div>
                        <section id="tabs" class="project-tab">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-12 center-block">
                                        <nav class="navv">
                                            <div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
                                                <a class="nav-item nav-link active" id="nav_info_tab" runat="server" clientidmode="Static" data-toggle="tab" href="#InsertSection1" role="tab" aria-controls="nav-home" aria-selected="true">تفاصيل الشركة</a>
                                                <a class="nav-item nav-link" id="nav_Class_tab" runat="server" clientidmode="Static" data-toggle="tab" href="#InsertSection2" role="tab" aria-controls="nav-profile" aria-selected="false">تفاصيل الأفرع</a>
                                                <a class="nav-item nav-link" id="nav_tech_tab" runat="server" clientidmode="Static" data-toggle="tab" href="#InsertSection3" role="tab" aria-controls="nav-contact" aria-selected="false">تفاصيل المفوض</a>
                                                <a class="nav-item nav-link" id="nav_Att_tab" runat="server" clientidmode="Static" data-toggle="tab" href="#InsertSection4" role="tab" aria-controls="nav-contact" aria-selected="false">تفاصيل مرفقاتت</a>
                                                  <a class="nav-item nav-link" id="A1" runat="server" clientidmode="Static" data-toggle="tab" href="#InsertSection5" role="tab" aria-controls="nav-contact" aria-selected="false">تفاصيل الموافقات</a>

                                            </div>
                                        </nav>
                                        <div class="container">

                                            <div class="tab-content center-block" id="AddField_tabContent">
                                                <div class="tab-pane fade show active" id="InsertSection1" runat="server" clientidmode="Static" role="tabpanel" aria-labelledby="nav_info_tab">
                                                    <div class="row">

                                                        <div class="col-md-6">
                                                            <asp:Label ID="Label17" runat="server" CssClass="form-label mb-2" Text="رقم الوطني للشركة/ المؤسسة فردية"
                                                                Font-Bold="true" Font-Size="Small"></asp:Label>

                                                            <asp:TextBox ID="CompanyNatNumber" runat="server" CssClass="form-control mb-4" placeholder="رقم الوطني للشركة/ المؤسسة فردية"
                                                                Font-Bold="true" Font-Size="Small" Enabled="false"></asp:TextBox>
                                                        </div>

                                                        <div class="col-md-6">
                                                            <asp:Label ID="Label10" runat="server" CssClass="form-label mb-2" Text="اسم الشركة/المؤسسة فردية"
                                                                Font-Bold="true" Font-Size="Small"></asp:Label>

                                                            <asp:TextBox ID="CompanyName" runat="server" CssClass="form-control mb-4" placeholder="اسم الشركة/المؤسسة فردية"
                                                                Font-Bold="true" Font-Size="Small" Enabled="false"></asp:TextBox>
                                                        </div>

                                                        <div class="col-md-6">
                                                            <asp:Label ID="Label15" runat="server" CssClass="form-label mb-2" Text="تاريخ تأسيس الشركة/مؤسسة فردية"
                                                                Font-Bold="true" Font-Size="Small"></asp:Label>

                                                            <asp:TextBox ID="CompanyRegDate" runat="server" CssClass="form-control mb-4" placeholder="تاريخ تأسيس الشركة/مؤسسة فردية"
                                                                Font-Bold="true" Font-Size="Small" Enabled="false"></asp:TextBox>
                                                        </div>

                                                        <div class="col-md-6">
                                                            <asp:Label ID="Label16" runat="server" CssClass="form-label mb-2" Text="رقم الضمان الاجتماعي للشركة/ المؤسسة فردية"
                                                                Font-Bold="true" Font-Size="Small"></asp:Label>

                                                            <asp:TextBox ID="SSCNumber" runat="server" CssClass="form-control mb-4" placeholder="رقم الضمان الاجتماعي للشركة/ المؤسسة فردية"
                                                                Font-Bold="true" Font-Size="Small" Enabled="false"></asp:TextBox>
                                                        </div>

                                                        <div class="col-md-6">
                                                            <asp:Label ID="Label11" runat="server" CssClass="form-label mb-2" Text="رقم الهاتف الشركة/مؤسسة فردية"
                                                                Font-Bold="true" Font-Size="Small"></asp:Label>

                                                            <asp:TextBox ID="CompanyPhone" runat="server" CssClass="form-control mb-2 phoneInput" placeholder="رقم الهاتف الشركة/مؤسسة فردية"
                                                                Font-Bold="true" Font-Size="Small" Enabled="false"></asp:TextBox>
                                                        </div>

                                                        <div class="col-md-6">
                                                            <asp:Label ID="Label12" runat="server" CssClass="form-label mb-2" Text="البريد الالكتروني الشركة/مؤسسة فردية"
                                                                Font-Bold="true" Font-Size="Small"></asp:Label>

                                                            <asp:TextBox ID="CompanyEmail" runat="server" CssClass="form-control mb-2" placeholder="البريد الالكتروني الشركة/مؤسسة فردية"
                                                                Font-Bold="true" Font-Size="Small" Enabled="false"></asp:TextBox>

                                                        </div>
                                                        <div class="col-md-6">
                                                            <asp:Label ID="Label22" runat="server" CssClass="form-label mb-2" Text="اسم المفوض بالتوقيع "
                                                                Font-Bold="true" Font-Size="Small"></asp:Label>

                                                            <asp:TextBox ID="CompSignDel" runat="server" CssClass="form-control mb-4" placeholder="اسم المفوض بالتوقيع"
                                                                Font-Bold="true" Font-Size="Small" Enabled="false"></asp:TextBox>

                                                        </div>


                                                        <div class="col-md-6">
                                                            <asp:Label ID="Label14" runat="server" CssClass="form-label mb-2" Text="المحافظة"
                                                                Font-Bold="true" Font-Size="Small"></asp:Label>
                                                            <asp:TextBox ID="GovernateName" runat="server" CssClass="form-control mb-4"
                                                                Font-Bold="true" Font-Size="Small" Enabled="false"></asp:TextBox>

                                                        </div>


                                                        <div class="col-md-12">
                                                            <asp:Label ID="Label13" runat="server" CssClass="form-label mb-2" Text="النشاط الرئيسي لشركة /المؤسسة الفردية"
                                                                Font-Bold="true" Font-Size="Small"></asp:Label>

                                                            <asp:TextBox ID="MainActive" runat="server" CssClass="form-control mb-2" placeholder="النشاط الرئيسي لشركة /المؤسسة الفردية"
                                                                Font-Bold="true" Font-Size="Small" TextMode="MultiLine" Enabled="false"></asp:TextBox>

                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="tab-pane fade" id="InsertSection2" runat="server" clientidmode="Static" role="tabpanel" aria-labelledby="nav_Class_tab">
                                                    <div class="row">
                                                        <div class="col-md-12">

                                                            <div class="table-responsive mt-2">
                                                                <asp:GridView ID="Branchs" runat="server" DataKeyNames="BranchID"
                                                                    AutoGenerateColumns="False"
                                                                    
                                                                    CssClass="table table-borderless"
                                                                    HorizontalAlign="Center"
                                                                    BackColor="White" BorderStyle="None"
                                                                    ForeColor="#333333" DataSourceID="BranchSqlDataSource"
                                                                    HeaderStyle-HorizontalAlign="Center">
                                                                    <Columns>

                                                                        <asp:TemplateField AccessibleHeaderText="number" HeaderText="#" SortExpression="number">
                                                                            <ItemTemplate>
                                                                                <%# Container.DataItemIndex + 1 %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateField>

                                                                        <asp:BoundField DataField="BranchName" HeaderText="الفرع" />
                                                                    </Columns>
                                                                    <HeaderStyle ForeColor="#1277a7" Font-Bold="true" CssClass="TableHeader" Font-Size="x-small" />
                                                                    <RowStyle BackColor="#FFFFFFF" ForeColor="#333333" HorizontalAlign="Center" Font-Size="x-small" Font-Bold="true" BorderColor="White" />


                                                                    <RowStyle BackColor="White" />
                                                                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                                                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                                                    <SortedAscendingHeaderStyle BackColor="#808080" />
                                                                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                                                    <SortedDescendingHeaderStyle BackColor="#383838" />
                                                                </asp:GridView>

                                                                <asp:SqlDataSource ID="BranchSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:GIPInatiativesConnectionString %>"
                                                                    SelectCommand="ReadBranch" SelectCommandType="StoredProcedure">
                                                                    <SelectParameters>
                                                                        <asp:SessionParameter Name="Company_No" SessionField="CompAppID" Type="Int64" />
                                                                    </SelectParameters>
                                                                </asp:SqlDataSource>
                                                            </div>

                                                        </div>

                                                    </div>
                                                </div>
                                                <div class="tab-pane fade" id="InsertSection3" runat="server" clientidmode="Static" role="tabpanel" aria-labelledby="nav_tech_tab">
                                                    <div class="row">


                                                        <div class="col-md-6">
                                                            <asp:Label ID="Label3" runat="server" CssClass="form-label mb-2" Text="اسم مقدم الطلب"
                                                                Font-Bold="true" Font-Size="Small"></asp:Label>

                                                            <asp:TextBox ID="SanadName" runat="server" CssClass="form-control mb-4" placeholder="اسم مقدم الطلب"
                                                                Font-Bold="true" Font-Size="Small" Enabled="false"></asp:TextBox>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <asp:Label ID="Label4" runat="server" CssClass="form-label mb-2" Text="جنسية مقدم الطلب"
                                                                Font-Bold="true" Font-Size="Small"></asp:Label>

                                                            <asp:TextBox ID="SanadNat" runat="server" CssClass="form-control mb-4" placeholder="جنسية مقدم الطلب"
                                                                Font-Bold="true" Font-Size="Small" Enabled="false"></asp:TextBox>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <asp:Label ID="Label5" runat="server" CssClass="form-label mb-2 " Text="رقم الهاتف لمقدم الطلب"
                                                                Font-Bold="true" Font-Size="Small"></asp:Label>

                                                            <asp:TextBox ID="SanadPhone" runat="server" CssClass="form-control mb-4 phoneInput" placeholder="رقم الهاتف لمقدم الطلب"
                                                                Font-Bold="true" Font-Size="Small" Enabled="false"></asp:TextBox>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <asp:Label ID="Label6" runat="server" CssClass="form-label mb-2" Text="البريد الالكتروني لمقدم الطلب"
                                                                Font-Bold="true" Font-Size="Small"></asp:Label>

                                                            <asp:TextBox ID="SanadEmail" runat="server" CssClass="form-control mb-4" placeholder="البريد الالكتروني لمقدم الطلب"
                                                                Font-Bold="true" Font-Size="Small" Enabled="false"></asp:TextBox>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <asp:Label ID="Label7" runat="server" CssClass="form-label mb-2" Text="المسمى الوظيفي لمقدم الطلب"
                                                                Font-Bold="true" Font-Size="Small"></asp:Label>

                                                            <asp:TextBox ID="SanadJob" runat="server" CssClass="form-control mb-2" placeholder="المسمى الوظيفي لمقدم الطلب"
                                                                Font-Bold="true" Font-Size="Small" Enabled="false"></asp:TextBox>

                                                        </div>
                                                        <div class="col-md-6">
                                                            <asp:Label ID="Label8" runat="server" CssClass="form-label mb-2" Text="صفة مقدم الطلب"
                                                                Font-Bold="true" Font-Size="Small"></asp:Label>
                                                            <asp:TextBox ID="DelegetType" runat="server" CssClass="form-control mb-2" placeholder="صفة مقدم الطلب"
                                                                Font-Bold="true" Font-Size="Small" Enabled="false"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="tab-pane fade" id="InsertSection4" runat="server" clientidmode="Static" role="tabpanel" aria-labelledby="nav_Att_tab">
                                                    <div class="row">


                                                        <div class="col-md-4">
                                                            <asp:Label ID="Label19" runat="server" CssClass="form-label mb-2" Text="صورة كتاب التفويض بالتوقيع"
                                                                Font-Bold="true" Font-Size="Small"></asp:Label>

                                                            <div class="container">
                                                                <asp:LinkButton ID="SignFileDownload" runat="server" OnClick="SignFileDownload_Click">تنزيل</asp:LinkButton>
                                                            </div>

                                                        </div>
                                                        <div class="col-md-4">
                                                            <asp:Label ID="Label20" runat="server" CssClass="form-label mb-2" Text="شهادة تسجيل الشركة"
                                                                Font-Bold="true" Font-Size="Small"></asp:Label>

                                                            <div class="container">
                                                                <asp:LinkButton ID="RegFileDownload" runat="server" OnClick="RegFileDownload_Click">تنزيل</asp:LinkButton>
                                                            </div>

                                                        </div>
                                                        <div class="col-md-4">
                                                            <asp:Label ID="Label21" runat="server" CssClass="form-label mb-2" Text="رخصة مهن سارية المفعول"
                                                                Font-Bold="true" Font-Size="Small"></asp:Label>

                                                            <div class="container">
                                                                <asp:LinkButton ID="CertFileDownload" runat="server" OnClick="CertFileDownload_Click">تنزيل</asp:LinkButton>
                                                            </div>

                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="tab-pane fade" id="InsertSection5" runat="server" clientidmode="Static" role="tabpanel" aria-labelledby="nav_Att_tab">
                                                    <asp:GridView ID="Rejected_Grid" runat="server" AutoGenerateColumns="False"
                                                      DataSourceID="Rejected_ReasonsSqlDataSource"
                                                        EmptyDataText="لا يوجد موافقات او رفض للان"
                                                        CssClass="table table-borderless"
                                                        HorizontalAlign="Center"
                                                        BackColor="White" BorderStyle="None"
                                                        ForeColor="#333333"
                                                        HeaderStyle-HorizontalAlign="Center">

                                                        <Columns>
                                                            <asp:BoundField DataField="reason_id" HeaderText="التسلسل" />
                                                            <asp:BoundField DataField="reason_text" HeaderText="السبب">
                                                                <ItemStyle Width="350px" />
                                                            </asp:BoundField>
                                                            <asp:ButtonField ButtonType="Image" CommandName="DeleteRow" ImageUrl="~/rejectSmall2.png" Text="Button" />
                                                        </Columns>
                                                        <HeaderStyle ForeColor="#1277a7" Font-Bold="true" CssClass="TableHeader" Font-Size="x-small" />
                                                        <RowStyle BackColor="#FFFFFFF" ForeColor="#333333" HorizontalAlign="Center" Font-Size="x-small" Font-Bold="true" BorderColor="White" />


                                                        <RowStyle BackColor="White" />
                                                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                                        <SortedAscendingHeaderStyle BackColor="#808080" />
                                                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                                        <SortedDescendingHeaderStyle BackColor="#383838" />
                                                    </asp:GridView>
                                                    <asp:SqlDataSource ID="Rejected_ReasonsSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:GIPInatiativesConnectionString %>"
                                                        SelectCommand="Rejected_Reasons" SelectCommandType="StoredProcedure">
                                                        <SelectParameters>
                                                            <asp:SessionParameter Name="Company_No" SessionField="compno" Type="Int64" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>





                    </div>
                </div>
            </div>
        </div>

    </section>





    <%-- <div class="container">
        <div class="modal fade modal-xl" id="my_modal" data-backdrop="false" role="dialog">
            <div class="modal-dialog modal-dailog-centered" style="background-color: lightgray">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">معلومات طلب تدريب</h4>
                        <%--<button type="button" class="btn-close" data-bs-dismiss="modal"></button>--%>


<%--    <div style="display: flex;">
        <div class="p-2">
            <label>سبب الرفض:</label>
            <asp:TextBox ID="txtRejectReason" CssClass="form-control" placeholder="سبب الرفض" runat="server" Font-Size="10pt" Width="220px"></asp:TextBox>
        </div>
        <div class="p-2">
            <label></label>
            <asp:Button ID="btnAddBranch" Text="اضافة السبب" CssClass=" form-control-btn btn-primary" runat="server" OnClick="btnAddBranch_Click" />
        </div>
    </div>--%>

</asp:Content>
