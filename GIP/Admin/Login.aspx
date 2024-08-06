<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="GIP.Admin.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/Asset/css/Forms.css" rel="stylesheet" />

    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    <script type="text/javascript">
        function loadGrecaptcha() {
            var captchaContainer = grecaptcha.render('grrecaptcha', {
                sitekey: '6Lf9_goqAAAAAPFBeIYuJoC6H6_cr6ZH2Wg5dQT1',
                callback: function (response) {
                    console.log(response);
                    setTimeout(function () {
                        grecaptcha.reset(captchaContainer);
                    }, 120000);
                }
         });
     }

     // Ensure the loadGrecaptcha function is called after the DOM has fully loaded
     document.addEventListener("lblMessage1", function () {
         loadGrecaptcha();
     });

       //var your_site_key = '6Lf9_goqAAAAAPFBeIYuJoC6H6_cr6ZH2Wg5dQT1';
       //var renderRecaptcha = function () {
       //    grecaptcha.render('ReCaptchContainer', {
       //        'sitekey': '6Lf9_goqAAAAAPFBeIYuJoC6H6_cr6ZH2Wg5dQT1',
       //        'callback': reCaptchaCallback,
       //        theme: 'light', //light or dark
       //        type: 'image',// image or audio
       //        size: 'normal'//normal or compact
       //    });
       //};
       //var reCaptchaCallback = function (response) {
       //    if (response !== '') {
       //        document.getElementById('lblMessage1').innerHTML = "";
       //    }
       //};
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <%-- <asp:UpdateProgress ID="UpdateProgress1" DynamicLayout="false" runat="server" DisplayAfter="0" AssociatedUpdatePanelID="UpdatePanel1">

    <ProgressTemplate>
        <div style="position: fixed; text-align: center; height: 100%; width: 100%; top: 0; right: 0; left: 0; z-index: 9999999; background-color: #000000; opacity: 0;">
            <asp:Image ID="imgUpdateProgress" runat="server" ImageUrl="assets/images/loader.gif"
                AlternateText="Loading ..." ToolTip="Loading ..."
                Style="padding: 10px; position: fixed; top: 45%; left: 50%;" />
        </div>
    </ProgressTemplate>
</asp:UpdateProgress>--%>
    <section id="hero" class="hero section Login">

        <img src="/Asset/img/hero-bg-abstract.jpg" alt="" data-aos="fade-in" class="">

        <div class="container login">
            <!-- Section Title -->

            <div class="form-signin rounded-sm shadow">
                <div class="container section-title" data-aos="fade-up">
                    <h2>تسجيل الدخول</h2>
                </div>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="tab-content">
                            <div style="text-align: center;">
                                <asp:Label ID="lblMessage1" runat="server" ForeColor="red" Font-Bold="true"></asp:Label>
                            </div>
                            <!-- Tab1 -->
                            <div id="login" class="container tab-pane active">
                                <div>
                                    <asp:Label ID="Label1" runat="server" CssClass="form-label mb-2" Text="اسم المستخدم"
                                        Font-Bold="true" Font-Size="Small"></asp:Label>


                                    <asp:TextBox ID="username" runat="server" CssClass="form-control mb-2" placeholder="اسم المستخدم"
                                        Font-Bold="true" Font-Size="Smaller" ></asp:TextBox>
                                    <asp:RequiredFieldValidator SetFocusOnError="true" ForeColor="red"
                                        Font-Size="Small" Font-Bold="true"
                                        ErrorMessage="يرجى ادخال اسم المستخدم"
                                        ID="CompanyNatValidator" runat="server" ValidationGroup="login"
                                        ControlToValidate="username"></asp:RequiredFieldValidator>
                                </div>
                                <div>
                                    <asp:Label ID="Label2" runat="server" CssClass="form-label mb-2" Text="كلمة المرور"
                                        Font-Bold="true" Font-Size="Small"></asp:Label>
                                  
                                    <asp:TextBox ID="Password" runat="server" CssClass="form-control mb-2" placeholder="كلمة المرور"
                                        Font-Bold="true" Font-Size="Small" TextMode="Password"></asp:TextBox>

                                    <asp:RequiredFieldValidator SetFocusOnError="true" ForeColor="red"
                                        Font-Size="Small" Font-Bold="true"
                                        ErrorMessage="يرجى ادخال كلمة المرور"
                                        ID="RequiredFieldValidator1" runat="server" ValidationGroup="login"
                                        ControlToValidate="Password"></asp:RequiredFieldValidator>

                                    <div style="display: grid;justify-content: center;align-items: center;text-align: center;">
                                         <asp:Label ID="recaptchaMsg" runat="server" Font-Bold="true" Font-Size="Small" ForeColor="Red" Visible="false"></asp:Label>
                                    
                                        <div id="grrecaptcha" class="g-recaptcha" data-sitekey="6Lf9_goqAAAAAPFBeIYuJoC6H6_cr6ZH2Wg5dQT1"></div>
                                       
                                        </div>
                                </div>


                                <div class="col-md-12 align-content-center " style="text-align: center;">
                                    <asp:Button ID="submit" ValidationGroup="login" runat="server"
                                        OnClick="submit_Click"
                                        CausesValidation="true" CssClass="btn btn-primary mt-5 login-btn col-md-12" Text="تسجيل الدخول"></asp:Button>


                                </div>

                            </div>


                        </div>




                        <div class="modal fade" id="statusLockedModal" runat="server" clientidmode="Static"
                            aria-hidden="true" data-backdrop="static" data-keyboard="false">
                            <div class="modal-dialog modal-confirm" style="width: 40%!important; margin-top: 12%!important;">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <div class="icon-box" runat="server" style="background-color: white">
                                            <img src="/assets/images/block-user-128_.png" alt="cookies-img" class="w-100" />
                                        </div>
                                    </div>

                                    <div class="modal-body text-center">
                                        <h2 id="AccountLocked" runat="server"><b>تم إيقاف حسابك! </b></h2>
                                        <p id="contact2" runat="server" style="font-weight: 200; font-size: medium;">يرجى التواصل مع ضابط الارتباط في وزارة الاقتصاد الرقمي والريادة لفك قفل الحساب..</p>


                                    </div>
                                    <div class="modal-footer border-2 d-flex justify-content-md-center">
                                        <button type="button" class="btn w-100" id="HomePage" runat="server"
                                            style="background-color: #2685af; color: white"
                                            data-dismiss="modal" onclick="window.location.href='Login.aspx'">
                                            الدخول إلى المنصة
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="submit" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>
      
    </section>
    <script>
        function onlyNumbers(event) {
            var charCode = (event.which) ? event.which : event.keyCode;
            if (charCode < 48 || charCode > 57) {
                event.preventDefault();
                return false;
            }
            return true;
        }
    </script>
     <script>

         function openLockedModal() {
             $("#statusLockedModal").modal('show');
         }
     </script>
      <script>
          function showContent(status, messgae) {
              toastr.options = {
                  "closeButton": true,
                  "debug": false,
                  "progressBar": true,
                  "preventDuplicates": false,
                  "positionClass": "toast-top-left",
                  "showDuration": "600",
                  "hideDuration": "1000",
                  "timeOut": "0",
                  "extendedTimeOut": "60000",
                  "showEasing": "swing",
                  "hideEasing": "linear",
                  "showMethod": "fadeIn",
                  "hideMethod": "fadeOut"
              }

              if (status == 'success') {
                  toastr["success"](messgae);
              }
              else if (status == 'info') {

                  toastr["info"](messgae);
              }
              else if (status == 'error') {

                  toastr["error"](messgae);
              }
              else if (status == 'warning') {

                  toastr["warning"](messgae);
              }
          }
          //document.getElementById("AddBranch").onsubmit = null;
      </script>
</asp:Content>