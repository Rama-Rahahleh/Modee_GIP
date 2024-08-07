<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/DashBored.Master" AutoEventWireup="true" CodeBehind="Companies.aspx.cs" Inherits="GIP.Companies" %>

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
                    <div id="login" class="container tab-pane active "  data-aos="fade-up">

                        <div class="container section-title">
                            <h2>طلبات الشركات</h2>
                        </div>

                        <asp:GridView ID="GridView1" runat="server" DataKeyNames="Company_No"
                            AutoGenerateColumns="False" Width="100%"
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
                                <asp:BoundField DataField="Company_Name" HeaderText="اسم المنشأة" SortExpression="Company_Name"></asp:BoundField>
                                <asp:BoundField DataField="Company_No" HeaderText="رقم المنشأة" SortExpression="Company_No"></asp:BoundField>
                                <asp:BoundField DataField="Company_Email" HeaderText="البريد الالكتروني" SortExpression="Company_Email" />
                                <asp:BoundField DataField="Company_Phone" HeaderText="رقم الهاتف" SortExpression="Company_Phone" />

                                <asp:BoundField DataField="Status" HeaderText="حالة الطلب" SortExpression="Company_Phone" />


                                <asp:TemplateField>

                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="DetailsRow" Text="">
                                           تفاصيل</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="Approve" runat="server" CommandName="ApproveRow">قبول</asp:LinkButton>
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
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:GIPInatiativesConnectionString %>" 
                            SelectCommand="ReadAllComp"
                            SelectCommandType="StoredProcedure"></asp:SqlDataSource>


                    </div>
                </div>
            </div>
        </div>
    </section>


     <div class="modal fade" id="ChangeStatus"
     aria-hidden="true" data-backdrop="static" data-keyboard="false">
     <div class="modal-dialog modal-confirm">
         <div class="modal-content">
             <div class="modal-header">
                 <div class="icon-box" runat="server" style="background-color:#f23f3f ; color: white">
                     <i class="fas fa-times-circle"></i>
                 </div>

             </div>
             <div class="modal-body text-center">

                 <p>
                     تـأكيد الموافقة على طلب الشركة ؟
                 </p>
             </div>
             <div class="modal-footer border-2 d-flex justify-content-md-center">
                 <asp:Button type="button" ID="Approve" class="btn"
                     Style="background-color: #f23f3f; color: white; font-weight: 700"
                     OnClick="Approve_Click" runat="server" Text="تأكيد"></asp:Button>

                 <button type="button" class="btn btn-secondary btn-close-modal"
                     style="background-color: lightgray; color: white; font-weight: 700"
                     data-dismiss="modal">
                     الغاء</button>
             </div>
         </div>
     </div>
 </div>

               <div class="modal fade" id="DeclineStatus"
    aria-hidden="true" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-confirm">
        <div class="modal-content">
            <div class="modal-header">
                <div class="icon-box" runat="server" style="background-color:#f23f3f ; color: white">
                    <i class="fas fa-times-circle"></i>
                </div>

            </div>
            <div class="modal-body text-center">

                <p>
                   يرجى إضافة سبب الرفض 
                </p>
                
                    <asp:TextBox ID="ReasonText" runat="server" ></asp:TextBox>
            </div>
            <div class="modal-footer border-2 d-flex justify-content-md-center">
                <asp:Button type="button" ID="Decline" class="btn"
                    Style="background-color: #f23f3f; color: white; font-weight: 700"
                    OnClick="Decline_Click" runat="server" Text="تأكيد"></asp:Button>

                <button type="button" class="btn btn-secondary btn-close-modal"
                    style="background-color: lightgray; color: white; font-weight: 700"
                    data-dismiss="modal">
                    الغاء</button>
            </div>
        </div>
    </div>
</div>
               </ContentTemplate>
    <Triggers>
     
         <asp:PostBackTrigger ControlID="GridView1" />
        <asp:AsyncPostBackTrigger ControlID="Approve" />
       
            
    </Triggers>
</asp:UpdatePanel>
    <script>
       

        //openConfirmDelete
        function confirmChange() {
            $("#ChangeStatus").modal('show');
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
