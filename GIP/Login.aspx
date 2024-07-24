<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="GIP.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Asset/css/Forms.css" rel="stylesheet" />

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
  
    <section id="hero" class="hero section Login">

        <img src="Asset/img/hero-bg-abstract.jpg" alt="" data-aos="fade-in" class="">

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

                                    <label for="CompanyNat" class="sr-only">الرقم الوطني للمنشأة</label>
                                    <asp:TextBox ID="CompanyNat" runat="server" CssClass="form-control mb-2" placeholder="الرقم الوطني للمنشأة"
                                        Font-Bold="true" Font-Size="Smaller" onKeypress="return onlyNumbers(event);"></asp:TextBox>
                                    <asp:RequiredFieldValidator SetFocusOnError="true" ForeColor="red"
                                        Font-Size="Small" Font-Bold="true"
                                        ErrorMessage="يرجى ادخال الرقم الوطني لشركة"
                                        ID="CompanyNatValidator" runat="server" ValidationGroup="login"
                                        ControlToValidate="CompanyNat"></asp:RequiredFieldValidator>
                                </div>
                                <div>
                                    <label for="Password" class="sr-only">كلمة المرور</label>
                                    <asp:TextBox ID="Password" runat="server" CssClass="form-control mb-2" placeholder="كلمة المرور"
                                        Font-Bold="true" Font-Size="Small" TextMode="Password"></asp:TextBox>

                                    <asp:RequiredFieldValidator SetFocusOnError="true" ForeColor="red"
                                        Font-Size="Small" Font-Bold="true"
                                        ErrorMessage="يرجى ادخال كلمة المرور"
                                        ID="RequiredFieldValidator1" runat="server" ValidationGroup="login"
                                        ControlToValidate="Password"></asp:RequiredFieldValidator>

                                    <div id="forgetDiv" runat="server" style="height: auto; float: inline-end">
                                        <asp:LinkButton ID="ForgetLkBtn" runat="server" Font-Bold="true" Font-Size="12px"
                                            PostBackUrl="~/Forgot.aspx">نسيت كلمة السرّ؟</asp:LinkButton>

                                    </div>
                                    <div style="display: grid;justify-content: center;align-items: center;text-align: center;">
                                         <asp:Label ID="recaptchaMsg" runat="server" Font-Bold="true" Font-Size="Small" ForeColor="Red" Visible="false"></asp:Label>
                                    
                                        <div id="grrecaptcha" class="g-recaptcha" data-sitekey="6Lf9_goqAAAAAPFBeIYuJoC6H6_cr6ZH2Wg5dQT1"></div>
                                       
                                        </div>
                                </div>


                                <div class="col-md-12 align-content-center " style="text-align: center;">
                                    <asp:Button ID="submit" ValidationGroup="login" runat="server"
                                        OnClick="submit_Click"
                                        CausesValidation="true" CssClass="btn btn-primary mt-5 login-btn col-md-12" Text="تسجيل الدخول"></asp:Button>

                                    <p class="mr-4 mt-3 f-s-18 font-weight-bold" id="createLable" runat="server" style="font-weight: bold; font-size: 12px;">
                                        لإنشاء حساب جديد  <a href="Create.aspx">اضغط هنا </a>
                                    </p>

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
</asp:Content>