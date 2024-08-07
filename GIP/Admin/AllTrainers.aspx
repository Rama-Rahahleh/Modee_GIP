<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/DashBored.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="AllTrainers.aspx.cs" Inherits="GIP.AllTrainers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/Asset/css/Forms.css" rel="stylesheet" />
    <link href="/Asset/css/Grids.css" rel="stylesheet" />
    <link href="/Asset/css/ModalPopup.css" rel="stylesheet" />
    <style>
        .form-signin {
            width: 100%;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

            <section id="hero" class="hero section Login">

                <img src="/Asset/img/hero-bg-abstract.jpg" alt="" data-aos="fade-in" class="">

                <div class="container login">
                    <!-- Section Title -->

                    <div class="form-signin rounded-sm shadow">
                        <div class="tab-content">

                            <!-- Tab1 -->
                            <div id="login" class="container tab-pane active " data-aos="fade-up">

                                <div class="container section-title">
                                    <h2>طلبات التدريب</h2>
                                </div>
                                 <asp:Button ID="btnLoadData" class="modal-title" runat="server" Text="تحميل طلبات المتدربين" OnClick="ExportExcel" />
                                <asp:GridView ID="Trainees" runat="server" AutoGenerateColumns="False"
                                    DataKeyNames="Company_No"
                                    Width="100%"
                                    CssClass="table table-borderless"
                                    HorizontalAlign="Center"
                                    BackColor="White" BorderStyle="None"
                                    ForeColor="#333333"
                                    HeaderStyle-HorizontalAlign="Center"
                                    DataSourceID="SqlDataSource1"
                                    OnRowCommand="GridView1_RowCommand">
                                    <Columns>
                                        <asp:TemplateField AccessibleHeaderText="number" HeaderText="#" SortExpression="number">
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex + 1 %>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:BoundField DataField="Trainee_ID" HeaderText="الرقم" InsertVisible="False" ReadOnly="True" SortExpression="Trainee_ID" />
                                        <asp:BoundField DataField="Trainee_No" HeaderText="الرقم الوطني" SortExpression="Trainee_No" />
                                        <asp:BoundField DataField="Trainee_Name" HeaderText="الاسم" SortExpression="Trainee_Name" />
                                          <asp:BoundField DataField="CompanyID" HeaderText="اسم الشركة" ReadOnly="True" SortExpression="CompName" />
                                        <asp:BoundField DataField="CompName" HeaderText="اسم الشركة" ReadOnly="True" SortExpression="CompName" />
                                        <asp:BoundField DataField="ProgName" HeaderText="برنامج التدريب" ReadOnly="True" SortExpression="ProgName" />
                                        <asp:BoundField DataField="StatName" HeaderText="حالة الطلب" ReadOnly="True" SortExpression="StatusID" />
                                     
                                        <asp:BoundField DataField="UnivName" HeaderText="UnivName" ReadOnly="True" SortExpression="UnivName" />

                                        <asp:TemplateField>

                                            <ItemTemplate>
                                                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="DetailsRow" Text="">تفاصيل</asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="Approve" runat="server" CommandName="ApproveRow">قبول</asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="HaveNote" runat="server" CommandName="NoteRow">إضافة ملاحظة </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="Decline" runat="server" CommandName="RejectRow">رفض </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>

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
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:GIPInatiativesConnectionString %>"
                                    SelectCommand="TRAINERS" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                
                                   
                               


                            </div>
                        </div>
                    </div>
                </div>

            </section>
        </ContentTemplate>
        <Triggers></Triggers>
    </asp:UpdatePanel>






</asp:Content>
