<%@ Page Title="" Language="C#" MasterPageFile="~/Company/Site.Master" AutoEventWireup="true" CodeBehind="MyApps.aspx.cs" Inherits="GIP.Company.MyApps" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link href="/Asset/css/Forms.css" rel="stylesheet" />
    <style>
        .form-signin{
            width:100%;
        }
    </style>
       
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
                            <h2>طلبات المتدربين </h2>
                        </div>
         <asp:GridView ID="GridView1" runat="server"
             CssClass="table table-bordered  table-hover table-striped"
             AutoGenerateColumns="False" BackColor="#CCCCCC"
             BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px"
             CellPadding="4" CellSpacing="2"
             DataSourceID="SqlDataSource1" ForeColor="Black"
              OnSelectedIndexChanged="GridView1_SelectedIndexChanged">





             <Columns>
                 <asp:BoundField DataField="Trainee_Name" HeaderText="اسم المتدرب" SortExpression="Trainee_Name">
                     <ItemStyle Width="100px" />
                 </asp:BoundField>
                 <asp:BoundField DataField="GovernateID" HeaderText="المحافظة" SortExpression="GovernateID">
                     <ItemStyle Width="100px" />
                 </asp:BoundField> 
                 <asp:BoundField DataField="ProgramID" HeaderText="البرنامج" SortExpression="ProgramID">
                     <ItemStyle Width="100px" />
                 </asp:BoundField>
                 <asp:BoundField DataField="StatusID" HeaderText="حالة الطلب" SortExpression="StatusID">
                     <ItemStyle Width="100px" />
                 </asp:BoundField>
                 <asp:BoundField DataField="StartDate" HeaderText="تاريخ بدء التدريب" SortExpression="StartDate">
                     <ItemStyle Width="100px" />
                 </asp:BoundField>
               
                 
                 <asp:BoundField DataField="EndDate" HeaderText="تاريخ انتهاء التدريب"    SortExpression="EndDate">
                     <ItemStyle Width="100px" />
                 </asp:BoundField>
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
         <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:GIPInatiativesConnectionString %>' SelectCommand="ReadMyApps" SelectCommandType="StoredProcedure">
             <SelectParameters>
                 <asp:SessionParameter SessionField="[&quot;CmpID&quot;]" Name="CopmanyID" Type="Int64"></asp:SessionParameter>

             </SelectParameters>
         </asp:SqlDataSource>
</asp:Content>
