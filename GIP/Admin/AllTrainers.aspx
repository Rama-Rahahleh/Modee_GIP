<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/DashBored.Master" AutoEventWireup="true" EnableEventValidation = "false" CodeBehind="AllTrainers.aspx.cs" Inherits="GIP.AllTrainers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="Content/Register.css" rel="stylesheet">
    <style type="text/css">
    .hideGridColumn
    {
        display:none;
    }
 </style>
</asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class=" modal-dialog modal-dailog-centered">
            <div class="modal-content">
                <div class="modal-body mx-auto">
                    <div class="modal-header mx-auto d-flex justify-content-center">
                        <h4 class="modal-title">طلبات التدريب</h4>
                    </div>
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered  table-hover table-striped" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="NNO" DataSourceID="SqlDataSource1" ForeColor="Black" OnRowCommand="GridView1_RowCommand">
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="الرقم" InsertVisible="False" ReadOnly="True" SortExpression="ID">
                                <ItemStyle Width="80px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="NNO" HeaderText="الرقم الوطني" SortExpression="NNO">
                                <ItemStyle Width="100px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Name" HeaderText="الاسم" SortExpression="Name">
                                <ItemStyle Width="250px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="SSNO" HeaderText="رقم الضمان" SortExpression="Trainee_SoicalSNo" Visible="False">
                                <ItemStyle Width="100px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="CompanyID" HeaderText="CompanyID" SortExpression="CompanyID" HeaderStyle-CssClass = "hideGridColumn" Visible="false" ItemStyle-CssClass="hideGridColumn" />
                            <asp:BoundField DataField="CompName" HeaderText="اسم الشركة" ReadOnly="True" SortExpression="CompName" Visible="True" />
                            <asp:BoundField DataField="ProgramID" HeaderText="ProgramID" SortExpression="SpecialityID" Visible="False" />
                            <asp:BoundField DataField="ProgName" HeaderText="برنامج التدريب" ReadOnly="True" SortExpression="ProgName">
                                <ItemStyle Width="100px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="StatusID" HeaderText="StatusID" SortExpression="StatusID" Visible="false" HeaderStyle-CssClass = "hideGridColumn" ItemStyle-CssClass="hideGridColumn" />
                            <asp:BoundField DataField="StatName" HeaderText="حالة الطلب" ReadOnly="True" SortExpression="StatusID">
                                <ItemStyle Width="80px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="GovernateID" HeaderText="GovernateID" SortExpression="GovernateID" Visible="False" />
                            <asp:BoundField DataField="GovName" HeaderText="GovName" ReadOnly="True" SortExpression="GovName" Visible="False" />
                            <asp:BoundField DataField="GenderID" HeaderText="GenderID" SortExpression="GenderID" Visible="False" />
                            <asp:BoundField DataField="GenName" HeaderText="GenName" ReadOnly="True" SortExpression="GenName" Visible="False" />
                            <asp:BoundField DataField="PhoneNo" HeaderText="رقم الهاتف" SortExpression="PhoneNo">
                                <ItemStyle Width="100px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" Visible="False" />
                            <asp:BoundField DataField="UniversityID" HeaderText="UniversityID" SortExpression="UniversityID" Visible="False" />
                            <asp:BoundField DataField="UnivName" HeaderText="UnivName" ReadOnly="True" SortExpression="UnivName" Visible="False" />
                            <asp:BoundField DataField="SpecialityID" HeaderText="SpecialityID" SortExpression="SpecialityID" Visible="False" />
                            <asp:BoundField DataField="DepName" HeaderText="DepName" ReadOnly="True" SortExpression="DepName" Visible="False" />
                            <asp:BoundField DataField="GPA" HeaderText="GPA" SortExpression="GPA" Visible="False" />
                            <asp:BoundField DataField="GraduateDate" HeaderText="GraduateDate" SortExpression="GraduateDate" Visible="False" />
                            <asp:BoundField DataField="StartDate" HeaderText="StartDate" SortExpression="StartDate" Visible="False" />
                            <asp:BoundField DataField="EndDate" HeaderText="EndDate" SortExpression="EndDate" Visible="False" />
                            <asp:ButtonField ButtonType="Button" Text="التفاصيل" CommandName="DetailsRow" />
                            <%--<asp:BoundField ButtonType="Button"  AccessibleHeaderText="قبول" CommandName="btnsave" />
                             <asp:BoundField ButtonType="Button"  AccessibleHeaderText="رفض"  CommandName="btnreject"/>--%>
                            
                        </Columns>
                        <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="cornflowerblue" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                        <RowStyle BackColor="White" />
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#808080" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#383838" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GIPInatiativesConnectionString %>" SelectCommand="SELECT * FROM [V_TRAINERS]">
                    </asp:SqlDataSource>
                    <div class="modal-header mx-auto d-flex justify-content-center">
                        <asp:Button ID="btnLoadData" class="modal-title" runat="server" Text="تحميل طلبات المتدربين" OnClick="ExportExcel"/>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
