<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/DashBored.Master" AutoEventWireup="true" CodeBehind="comapp.aspx.cs" Inherits="GIP.comapp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .hideGridColumn {
            display: none;
        }
    </style>

    </asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class=" modal-dialog modal-dailog-centered">
            <div class="modal-content">
                <div class="modal-body mx-auto">
                    <div class="modal-header mx-auto d-flex justify-content-center">
                        <h4 class="modal-title">طلبات الشركات</h4>
                    </div>
                    <asp:GridView ID="GridView1" runat="server"  CSSclass="table table-bordered  table-hover table-striped" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="App_ID" DataSourceID="SqlDataSource1" ForeColor="Black" OnRowCommand="GridView1_RowCommand">
                        <Columns>
                        <asp:BoundField DataField="App_ID" HeaderText="رقم الطلب" InsertVisible="False" ReadOnly="True" SortExpression="App_ID" />
                            <asp:BoundField DataField="Company_No" HeaderText="رقم المنشأة" SortExpression="Company_No">
                            <ItemStyle Width="100px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Company_Name" HeaderText="اسم المنشأة" SortExpression="Company_Name">
                            <ItemStyle Width="200px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="phone_No" HeaderText="رقم الهاتف" SortExpression="Company_Phone" />
                            <asp:BoundField DataField="Company_Email" HeaderText="Company_Email" SortExpression="Company_Email" Visible="False" />
                            <asp:BoundField DataField="Insurance_NO" HeaderText="Insurance_NO" SortExpression="Insurance_NO" Visible="False" />
                            <asp:BoundField DataField="CompanyTypeID" HeaderText="CompanyTypeID" SortExpression="CompanyTypeID" Visible="False" />
<%--                            <asp:BoundField DataField="TypeName" HeaderText="نوع المنشأة" ReadOnly="True" SortExpression="TypeName" />--%>
                            <asp:BoundField DataField="Establishment_Date" HeaderText="Establishment_Date" SortExpression="Establishment_Date" Visible="False" />
                            <asp:BoundField DataField="Main_Activity" HeaderText="Main_Activity" SortExpression="Main_Activity" Visible="False" />
                            <asp:BoundField DataField="GovernateID" HeaderText="GovernateID" SortExpression="GovernateID" Visible="False" />
                            <asp:BoundField DataField="GoverName" HeaderText="GoverName" ReadOnly="True" SortExpression="GoverName" Visible="False" />
                            <asp:BoundField DataField="username" HeaderText="username" SortExpression="username" Visible="False" />
                            <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" Visible="False" />
                            <asp:BoundField DataField="SignFilename" HeaderText="SignFilename" SortExpression="SignFilename" Visible="False" />
                            <asp:BoundField DataField="RegFilename" HeaderText="RegFilename" SortExpression="RegFilename" Visible="False" />
                            <asp:BoundField DataField="CertFilename" HeaderText="CertFilename" SortExpression="CertFilename" Visible="False" />
                            <asp:BoundField DataField="SignDelegatorName" HeaderText="SignDelegatorName" SortExpression="SignDelegatorName" Visible="False" />
                            <%--<asp:BoundField DataField="Company_status" HeaderText="Company_status" SortExpression="Comp_status" HeaderStyle-CssClass = "hideGridColumn" ItemStyle-CssClass="hideGridColumn"/>
                            <asp:BoundField DataField="Comp_status" HeaderText="حالة الطلب" ReadOnly="True" SortExpression="Comp_status" />--%>
                            <asp:ButtonField ButtonType="Button" CommandName="DetailsRow" Text="التفاصيل" />
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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GIPInatiativesConnectionString %>" SelectCommand="ReadAllComp" SelectCommandType="StoredProcedure"> </asp:SqlDataSource>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
