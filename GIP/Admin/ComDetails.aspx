<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/DashBored.Master" AutoEventWireup="true" CodeBehind="ComDetails.aspx.cs" Inherits="GIP.ComDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Content/Register.css" rel="stylesheet">
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
                else
                {
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
                window.location.href = "comapp.aspx";
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
                            <span class="form-control" style="width: 500px; color: white; font-size: large; background-color: cornflowerblue">المعلومات الخاصة بمقدم الطلب </span>
                        </div>

                        <div style="display: flex;">
                            <div class="p-2">
                                <label>الرقم الوطني/الشخصي:</label>
                                <asp:TextBox ID="txtNatNo" CssClass="form-control" placeholder="الرقم الوطني/الشخصي" runat="server" Font-Size="10pt" Enabled="False" />
                            </div>
                        </div>
                        <div style="display: flex;">
                            <div class="p-2">
                                <label>اسم مقدم الطلب:</label>
                                <asp:TextBox ID="txtName" CssClass="form-control" placeholder="اسم مقدم الطلب" runat="server" Font-Size="10pt" Width="220px" Enabled="False" />
                            </div>
                            <div class="p-2">
                                <label>جنسية مقدم الطلب:</label>
                                <asp:TextBox ID="txtNation" CssClass="form-control" placeholder="جنسية مقدم الطلب" runat="server" Font-Size="10pt" Enabled="False" />
                            </div>
                        </div>

                        <div style="display: flex;">
                            <div class="p-2">
                                <label>رقم الهاتف لمقدم الطلب:</label>
                                <asp:TextBox ID="txtPhone" CssClass="form-control" placeholder="07********" runat="server" Font-Size="10pt" Enabled="False" MaxLength="10" />
                            </div>
                            <div class="p-2">
                                <label>البريد الالكتروني لمقدم الطلب:</label>
                                <asp:TextBox ID="txtEmail" CssClass="form-control" placeholder="البريد الالكتروني لمقدم الطلب" runat="server" Font-Size="10pt" Width="220px" Enabled="False" />
                            </div>
                            <div class="p-2">
                                <label>المسمى الوظيفي لمقدم الطلب:</label>
                                <asp:TextBox ID="txtJob" CssClass="form-control" placeholder="المسمى الوظيفي لمقدم الطلب" runat="server" Font-Size="10pt" Enabled="False" />
                            </div>
                        </div>

                        <div style="display: flex;">
                            <div class="p-2">
                                <label>صفة مقدم الطلب:</label>
                                <asp:DropDownList ID="lstDelegetType" CssClass="form-control-list" runat="server" Font-Size="10pt" DataSourceID="SqlDataSource3" DataTextField="Delegation_Type" DataValueField="Delegation_ID" Enabled="False"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:GIPInatiativesConnectionString %>" SelectCommand="SELECT [Delegation_ID], [Delegation_Type] FROM [Delegation_Type] ORDER BY [Delegation_ID]"></asp:SqlDataSource>
                            </div>
                        </div>

                        <div style="display: flex;">
                            <span class="form-control" style="width: 500px; color: white; font-size: large; background-color: cornflowerblue">المعلومات الخاصة بالمنشأة </span>
                        </div>

                        <div style="display: flex;">
                            <div class="p-2">
                                <label>نوع المنشأة:</label>
                                <asp:DropDownList ID="lstCompType" CssClass="form-control-list" runat="server" Font-Size="10pt" DataSourceID="SqlDataSource1" DataTextField="Com_Type" DataValueField="Type_ID" Enabled="False"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GIPInatiativesConnectionString %>" ProviderName="<%$ ConnectionStrings:GIPInatiativesConnectionString.ProviderName %>" SelectCommand="SELECT [Type_ID], [Com_Type] FROM [CompanyType] ORDER BY [Type_ID]"></asp:SqlDataSource>
                            </div>
                        </div>

                        <div style="display: flex;">
                            <div class="p-2">
                                <label>الرقم الوطني للمنشأة:</label>
                                <asp:TextBox ID="txtCompNo" CssClass="form-control" placeholder="الرقم الوطني للمنشأة" runat="server" Font-Size="10pt" Enabled="False" />
                            </div>

                            <div class="p-2">
                                <label>اسم المنشأة:</label>
                                <asp:TextBox ID="txtCompName" CssClass="form-control" placeholder="اسم المنشأة" runat="server" Font-Size="10pt" Width="340px" Enabled="False" />
                            </div>
                        </div>

                        <div style="display: flex;">
                            <div class="p-2">
                                <label>رقم الهاتف للمنشأة:</label>
                                <asp:TextBox ID="txtCompPhone" CssClass="form-control" placeholder="رقم الهاتف للمنشأة" runat="server" Font-Size="10pt" Enabled="False" />
                            </div>
                            <div class="p-2">
                                <label>البريد الالكتروني للمنشأة:</label>
                                <asp:TextBox ID="txtCompEmail" CssClass="form-control" placeholder="البريد الالكتروني للمنشأة" runat="server" Font-Size="10pt" Width="220px" Enabled="False" />
                            </div>
                            <div class="p-2">
                                <label>رقم الضمان:</label>
                                <asp:TextBox ID="txtCompInsurance" CssClass="form-control" placeholder="رقم الضمان" runat="server" Font-Size="10pt" Enabled="False" />
                            </div>
                        </div>

                        <div style="display: flex;">
                            <div class="p-2">
                                <label>تاريخ تأسيس الشركة:</label>
                                <asp:TextBox ID="txtCompEstDate" CssClass="form-control" placeholder="سنة تأسيس الشركة" runat="server" Font-Size="10pt" Enabled="False" TextMode="Date" />
                            </div>
                            <div class="p-2">
                                <label>النشاط الرئيسي:</label>
                                <asp:TextBox ID="txtCompActivity" CssClass="form-control" placeholder="النشاط الرئيسي" runat="server" Font-Size="10pt" Width="220px" Enabled="False" />
                            </div>
                            <div class="p-2">
                                <label>المحافظة:</label>
                                <asp:DropDownList ID="lstCompGover" CssClass="form-control-list" runat="server" Font-Size="10pt" DataSourceID="SqlDataSource2" DataTextField="GovernateName" DataValueField="ID" Enabled="False"></asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:GIPInatiativesConnectionString %>" SelectCommand="SELECT [ID], [GovernateName] FROM [Governate] ORDER BY [ID]"></asp:SqlDataSource>
                                <%--<asp:TextBox ID="TextBox17" CssClass="form-control" placeholder="المحافظة" runat="server" Font-Size="10pt" />--%>
                            </div>
                        </div>

                        <div style="display: flex;">
                            <div class="p-2">
                                <label>اسم المفوض بالتوقيع:</label>
                                <asp:TextBox ID="txtCompSignDel" CssClass="form-control" placeholder="اسم المفوض بالتوقيع" runat="server" Font-Size="10pt" Width="220px" Enabled="False" />
                            </div>
                        </div>

                        <div style="display: flex;">
                            <div class="p-2">
                                <label>فروع الشركة:</label>
                            </div>
                        </div>

                        <div style="display: flex;">
                            <asp:GridView ID="GridView1" runat="server" CssClass="Grid" AutoGenerateColumns="False" DataSourceID="SqlDataSource4"
                                EmptyDataText="لا يوجد فروع" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" ForeColor="Black" CellSpacing="2" DataKeyNames="BranchID">
                                <Columns>
                                    <asp:BoundField DataField="BranchID" HeaderText="التسلسل" ItemStyle-Width="120">
                                        <ItemStyle Width="120px"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Placename" HeaderText="الفرع" ItemStyle-Width="120">
                                        <ItemStyle Width="120px"></ItemStyle>
                                    </asp:BoundField>
                                    <asp:ButtonField ButtonType="Image" CommandName="DeleteRow" ImageUrl="~/rejectSmall2.png" Text="حذف" />
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
                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:GIPInatiativesConnectionString %>" SelectCommand="ReadBranch" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="Company_No" SessionField="compno" Type="Int64" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>

                        <div style="display: flex;">
                            <span class="form-control" style="width: 500px; color: white; font-size: large; background-color: cornflowerblue">المرفقات المطلوبة </span>
                        </div>

                        <div style="display: flex;">
                            <div class="p-2">
                                <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False"
                                    CellPadding="4" ForeColor="Black"
                                    DataKeyNames="Text" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CssClass="Grid" OnRowCommand="GridView5_RowCommand">
                                    <AlternatingRowStyle BackColor="White" />
                                    <Columns>
                                        <asp:BoundField DataField="Text" HeaderText="اسم المرفق" />
                                        <asp:ButtonField ButtonType="Image" CommandName="DeleteRow"
                                            ImageUrl="~/images.png" Text="Button" />
                                    </Columns>
                                    <EditRowStyle BackColor="#2461BF" />
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <HeaderStyle BackColor="#1E2125" Font-Bold="True" ForeColor="White" />
                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                    <RowStyle BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" />
                                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                                </asp:GridView>
                            </div>
                        </div>
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
                                EmptyDataText="لا يوجد اسباب رفض" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" ForeColor="Black" CellSpacing="2" OnRowCommand="GridView2_RowCommand" DataSourceID="SqlDataSource5">
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
                            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:GIPInatiativesConnectionString %>" SelectCommand="SELECT reason_id, reason_text FROM Rejected_Reasons WHERE (company_no = @Company_No) ORDER BY reason_id">
                                <SelectParameters>
                                    <asp:SessionParameter Name="Company_No" SessionField="compno" Type="Int64" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                    </div>
                    <br />
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
