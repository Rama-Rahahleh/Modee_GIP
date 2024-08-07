<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/DashBored.Master" AutoEventWireup="true" CodeBehind="Trainer_Details.aspx.cs" Inherits="GIP.Trainer_Details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Content/Register.css" rel="stylesheet">
<script type="text/javascript">
    $(window).on('load', function () {
        $('#my_modal').modal('show');
    });

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
            window.location.href = "AllTrainers.aspx";
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
<div class="container">
    <div class="modal fade modal-xl" id="my_modal" data-backdrop="false" role="dialog">
        <div class="modal-dialog modal-dailog-centered" style="background-color: lightgray">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">معلومات طلب تدريب</h4>
                    <%--<button type="button" class="btn-close" data-bs-dismiss="modal"></button>--%>
                </div>

                <div class="modal-body">
                    <div class="d-flex justify-content-center">
                        <asp:Label ID="lblmsg" runat="server" Font-Size="Large" ForeColor="Red" />
                    </div>
                    <br />

                    <div style="display: flex;">
                        <span class="form-control" style="width: 500px; color: white; font-size: large; background-color: cornflowerblue">المعلومات الخاصة بالمتدرب </span>
                        
                    </div>

                    <div style="display: flex;">
                        <div class="p-2">
                            <label>الرقم الوطني/الشخصي:</label>
                            <asp:Label ID="txtNatNo" CssClass="form-control" runat="server" Font-Size="10pt" />
                        </div>
                    </div>

                    <div style="display: flex;">
                        <div class="p-2">
                            <label>اسم المتدرب:</label>
                            <asp:Label ID="lblName" Text="اسم المتدرب" CssClass="form-control" runat="server" Font-Size="10pt" Enabled="False" />
                        </div>
                        <div class="p-2">
                            <label>المحافظة:</label>
                            <%--<asp:Label ID="lblGover" CssClass="form-control" Text="المحافظة" runat="server" Font-Size="10pt" Enabled="False"></asp:Label>--%>
                            <asp:TextBox ID="lstGover" CssClass="form-control-list" runat="server" Font-Size="10pt" Enabled="False" ></asp:TextBox>                            
                        </div>
                        <div class="p-2">
                            <label>الجنس:</label>
                            <asp:TextBox ID="lstGender" CssClass="form-control-list" runat="server" Font-Size="10pt"  Enabled="False" ></asp:TextBox>
                            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:GIPInatiativesConnectionString %>" ProviderName="<%$ ConnectionStrings:GIPInatiativesConnectionString.ProviderName %>" SelectCommand="SELECT ID, GenderName FROM Gender"></asp:SqlDataSource>
                        </div>
                    </div>

                    <div style="display: flex;">
                        <div class="p-2">
                            <label>رقم هاتف المتدرب:</label>
                            <asp:Label ID="txtPhone" CssClass="form-control" placeholder="07********" runat="server" Font-Size="10pt" Enabled="False" />
                        </div>
                        <div class="p-2">
                            <label>البريد الالكتروني للمتدرب:</label>
                            <asp:Label ID="txtEmail" CssClass="form-control" text="mahadeen_eyhab@mutah.edu.jo" runat="server" Font-Size="10pt" Enabled="False" />                            
                        </div>
                    </div>
                    
                    
                        <div>
                        <span class="form-control" style="width: 500px; color: white; font-size: large; background-color: cornflowerblue">المعلومات الخاصة بالمؤهل العلمي </span>
                        </div>
                        
                     <asp:GridView ID="MOHEInfo" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered  table-hover table-striped" DataSourceID="SqlDataSource6">

                            <Columns>

                                <asp:BoundField DataField="UniversityID" HeaderText="الجامعة" SortExpression="UniversityID"></asp:BoundField>
                                <asp:BoundField DataField="SpecialityID" HeaderText="التخصص" SortExpression="SpecialityID"></asp:BoundField>
                                <asp:BoundField DataField="GPA" HeaderText="GPA" SortExpression="المعدل"></asp:BoundField>
                                <asp:BoundField DataField="GraduateDate" HeaderText="تاريح التخرج" SortExpression="GraduateDate"></asp:BoundField>
                            <%--<asp:BoundField DataField="الشهادة الجامعية" HeaderText="الشهادة " SortExpression="File" /><asp:BoundField />--%>
                            </Columns>
                        </asp:GridView>

                        <asp:SqlDataSource runat="server" ID="SqlDataSource6" ConnectionString='<%$ ConnectionStrings:GIPInatiativesConnectionString %>' SelectCommand="SELECT [UniversityID], [SpecialityID], [GPA], [GraduateDate] FROM [V_TRAINERS] WHERE ([NNO] = @NNO)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="txtNatNo" PropertyName="Text" Name="NNO" Type="Int64"></asp:ControlParameter>
                            </SelectParameters>
                        </asp:SqlDataSource> 
                   
                   

                 <%--   <div style="display: flex;">
                    
                        <div class="p-2">
                            <label>الجامعة:</label>
                            <asp:TextBox ID="lstUniversity" CssClass="form-control-list" runat="server" Font-Size="10pt" Enabled="False"></asp:TextBox>                            
                        </div>

                        <div class="p-2">
                            <label>التخصص:</label>
                            <asp:TextBox ID="lstDepartment" CssClass="form-control-list" runat="server" Font-Size="10pt" Enabled="False"></asp:TextBox>
                        </div>

                        <div class="p-2">
                            <label>المعدل:</label>
                            <asp:Label ID="lblGPA" CssClass="form-control" Text="المعدل" runat="server" Font-Size="10pt" Enabled="False" />
                        </div>

                        <div class="p-2">
                            <label>سنة التخرج:</label>
                            <asp:Label ID="lblGradYear" CssClass="form-control" Text="سنة التخرج" runat="server" Font-Size="10pt" Enabled="False" />
                        </div>
                    </div>--%>
                    <div>
                        <span class="form-control" style="width: 500px; color: white; font-size: large; background-color: cornflowerblue">المعلومات الخاصة بالضمان الاجتماعي </span>
                        </div>

                <asp:GridView ID="SubGrid" runat="server" AutoGenerateColumns="false" GridLines="Both" CssClass="table table-bordered  table-hover table-striped" >
                    <Columns>
                        <asp:BoundField DataField="CompanyName" HeaderText="اسم الشركة" />
                         <asp:BoundField DataField="StartDate" HeaderText="تاريخ بداية العمل" />
                       <asp:BoundField DataField="StopDate" HeaderText="تاريخ نهاية العمل" />
                    </Columns>
                </asp:GridView>

                    <div style="display: flex;">
                        <span class="form-control" style="width: 500px; color: white; font-size: large; background-color: cornflowerblue">معلومات التدريب </span>
                    </div>

                    <div style="display: flex;">
                        <div class="p-2">
                            <label id="Label3" runat="server">تاريخ بداية التدريب:</label>
                            <asp:Label ID="txtStartDate" TextMode="Date" CssClass="form-control" placeholder="تاريخ بداية التدريب" runat="server" Font-Size="10pt" Enabled="False" />
                        </div>
                        <div class="p-2">
                            <label id="Label4" runat="server">تاريخ نهاية التدريب:</label>
                            <asp:Label ID="txtEndDate" TextMode="Date" CssClass="form-control" placeholder="تاريخ نهاية التدريب" runat="server" Font-Size="10pt" Enabled="False" />
                        </div>
                        <div class="p-2">
                            <label>نوع التدريب:</label>
                            <asp:Label ID="lblProg" Text="نوع التدريب" CssClass="form-control" runat="server" Font-Size="10pt" Enabled="False" />
                        </div>
                    </div>

                    <div style="display: flex;">
                        <div class="p-2">
                            <label>حالة الطلب:</label>
                            <asp:Label ID="lblStatus" Text="حالة الطلب" CssClass="form-control" runat="server" Font-Size="10pt" Enabled="False" />
                        </div>
                        <div class="p-2">
                            <label>شركة التدريب:</label>
                            <asp:Label ID="lblComp" Text="حالة الطلب" CssClass="form-control" runat="server" Font-Size="10pt" Enabled="False" />
                        </div>
                    </div>
                </div>
                <asp:HiddenField ID="hcomno" runat="server" />
                <div style="display: flex;">
                    <div class="p-2">
                        <label>سبب الرفض:</label>
                        <asp:TextBox ID="txtRejectReason" CssClass="form-control" placeholder="سبب الرفض" runat="server" Font-Size="10pt" Width="220px"></asp:TextBox>
                    </div>
                    <div class="p-2">
                        <label></label>
                        <asp:Button ID="btnAddBranch" Text="اضافة السبب" CssClass=" form-control-btn btn-primary" runat="server" OnClick="btnAddBranch_Click" />
                    </div>
                </div>
                <div style="display: flex;">
                    <asp:GridView ID="GridView2" runat="server" CssClass="Grid" AutoGenerateColumns="False"
                        EmptyDataText="لا يوجد اسباب رفض" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" ForeColor="Black" CellSpacing="2" OnRowCommand="GridView2_RowCommand">
                        <Columns>
                            <asp:BoundField DataField="reason_id" HeaderText="التسلسل" />
                            <asp:BoundField DataField="reason_text" HeaderText="السبب">
                                <ItemStyle Width="350px" />
                            </asp:BoundField>
                            <asp:ButtonField ButtonType="Image" CommandName="DeleteRow" ImageUrl="~/rejectSmall2.png" Text="Button" />
                        </Columns>
                        <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                        <RowStyle BackColor="White" BorderStyle="Solid" BorderWidth="1px" />
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#808080" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#383838" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:GIPInatiativesConnectionString %>" SelectCommand="SELECT reason_id, reason_text FROM Tr_Rejected_Reasons WHERE (company_no = @Company_No and Trainer_no = @Trainer_no) ORDER BY reason_id">
                        <SelectParameters>
                            <asp:SessionParameter Name="Company_No" SessionField="compno" Type="Int32" />
                            <asp:SessionParameter Name="Trainer_no" SessionField="trnno" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>

                <div class="modal-footer justify-content-center">
                    <div class="px-3">
                        <asp:Button ID="btnsave" CssClass="btn btn-primary" Text="قبول الطلب" runat="server" OnClick="btnsave_Click" />
                    </div>
                    <div class="px-3">
                        <asp:Button ID="btnExit" CssClass="btn btn-danger" Text="رفض الطلب" data-dismiss="modal" runat="server" OnClick="btnExit_Click" />
                    </div>
                    <div class="px-3">
                        <asp:Button type="button" class="btn btn-danger" data-bs-dismiss="modal" OnClick="btnClose_click" runat="server" Text="خروج" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</asp:Content>
