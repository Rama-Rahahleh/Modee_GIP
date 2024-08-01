<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VerifyUser.aspx.cs" Inherits="GIP.Admin.VerifyUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Asset/css/Forms.css" rel="stylesheet" />
    <style>
        .inner-page {
            background-color: #d5dae6;
        }

        .Panel {
            margin: 20px 20px;
            padding: 10px;
        }

        .btn-alert, .btn-alert:active {
            color: #fff;
            border-radius: 4px;
            /*background: #fbd564 !important;*/
            /*background: linear-gradient(107deg, #86b8f1, #fbd564);*/
            background: linear-gradient(107deg, #86b8f1, #fb9a64);
            transition: all 0.4s;
            line-height: normal;
            border-radius: 30px;
            margin-top: 10px;
            padding: 6px 20px;
            min-width: 150px;
            border: none;
        }

            .btn-alert:hover, .btn-alert:focus {
                /*background: linear-gradient(107deg, #fbd564, #86b8f1);*/
                background: linear-gradient(107deg, #fb9a64, #86b8f1);
                outline: none;
            }

        .verify-btn {
            background: linear-gradient(85deg, #98bfef,#58697e);
            border-color: whitesmoke;
        }

            .verify-btn:hover {
                box-shadow: 0 0 5px #719D6F !important;
                background: linear-gradient(85deg,#58697e,#98bfef );
            }

        .userInput input {
            margin: 10px;
            height: 40px;
            width: 15%;
            /*        width: 50px;
*/ border: none;
            border-radius: 5px;
            text-align: center;
            font-family: DroidArabicKufi;
            font-size: 1.2rem;
            background: #e8f4f7;
        }

        .OtpBtn {
            border-radius: 20px;
            height: 40px;
            background-color: red;
            border: 1px solid red;
            width: 140px
        }

        .cookiesContent {
            display: flex;
            flex-direction: column;
            align-items: center;
            background-color: #fff;
            color: #000;
            text-align: center;
            border-radius: 20px;
        }

        button.close {
            width: 30px;
            font-size: 20px;
            color: #c0c5cb;
            align-self: flex-end;
            background-color: transparent;
            border: none;
            margin-bottom: 10px;
        }


        button.accept {
            background-color: #ed6755;
            border: none;
            border-radius: 5px;
            width: 200px;
            padding: 14px;
            font-size: 16px;
            color: white;
            box-shadow: 0px 6px 18px -5px rgba(237, 103, 85, 1);
        }

        .modal-footer {
            border-top: 2px solid #e8ebf3 !important;
            border-radius: 0px !important;
        }

        .modal-confirm .modal-footer {
            font-size: 14px;
            font-weight: bold
        }

        .section-title {
            padding-bottom: 0px !important;
        }
    </style>
    <script>
        function ValidateOTP_Required(sender, args) {

            args.IsValid = true;
            var otp_Input1 = document.getElementById("ist");
            var otp_Input2 = document.getElementById("sec");
            var otp_Input3 = document.getElementById("third");
            var otp_Input4 = document.getElementById("fourth");
            var otp_Input5 = document.getElementById("fifth");
            var otp_Input6 = document.getElementById("sixth");
            var validatorOTP = document.getElementById("OTP_Validator");

            if (otp_Input1.value == "" || otp_Input2.value == "" || otp_Input3.value == "" || otp_Input4.value == "" || otp_Input5.value == "" || otp_Input6.value == "") {
                args.IsValid = false;
                //    validatorOTP.ErrorMessage = "OTP required to proceed to login";
            }

            if (otp_Input6.value == "") {
                otp_Input6.focus();
                otp_Input6.setAttribute("style", "border-color:red");
            }
            if (otp_Input5.value == "") {
                otp_Input5.focus();
                otp_Input5.setAttribute("style", "border-color:red");
            }
            if (otp_Input4.value == "") {
                otp_Input4.focus();
                otp_Input4.setAttribute("style", "border-color:red");
            }
            if (otp_Input3.value == "") {
                otp_Input3.focus();
                otp_Input3.setAttribute("style", "border-color:red; border-width:1px");
            }
            if (otp_Input2.value == "") {
                otp_Input2.focus();
                otp_Input2.setAttribute("style", "border-color:red");
            }
            if (otp_Input1.value == "") {
                otp_Input1.focus();
                otp_Input1.setAttribute("style", "border-color:red");
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section id="hero" class="hero section Login">
          
        <asp:UpdateProgress ID="UpdateProgress1" DynamicLayout="false" runat="server" DisplayAfter="0" AssociatedUpdatePanelID="UpdatePanel1">

            <ProgressTemplate>
                <div style="position: fixed; text-align: center; height: 100%; width: 100%; top: 0; right: 0; left: 0; z-index: 9999999; background-color: #000000; opacity: 0;">
                    <asp:Image ID="imgUpdateProgress" runat="server" ImageUrl="assets/images/loader.gif"
                        AlternateText="Loading ..." ToolTip="Loading ..."
                        Style="padding: 10px; position: fixed; top: 45%; left: 50%;" />
                </div>
            </ProgressTemplate>
        </asp:UpdateProgress>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
            <ContentTemplate>
                <img src="Asset/img/hero-bg-abstract.jpg" alt="" data-aos="fade-in" class="">
                <div class="container login">
                  

                    <div class="form-signin rounded-sm shadow">
                        <div class="container section-title" data-aos="fade-up">
                            <h2>تحقق من المستخدم</h2>
                            <h6 id="otpLbl" runat="server" class="font-weight-bold text-center">أدخل الرمز الذي تلقيته عبر البريد الإلكتروني لمتابعة تسجيل الدخول إلى حسابك</h6>
                        </div>

                        <div class="tab-content">
                            <div style="text-align: center;">
                                <asp:Label ID="lblMessage1" runat="server" ForeColor="red" Font-Bold="true"></asp:Label>
                            </div>
                            <div id="login" class="container tab-pane active">
                                <asp:Label ID="ErrorLabel" runat="server" CssClass="alert  text-center w-100"
                                    Height="50" Visible="false" Font-Bold="true" BackColor="#cd756b"
                                    ForeColor="White" Style="height: auto;"></asp:Label>

                                <div class="p-3 mt-1" id="OtpDiv" runat="server">

                                    <div class="form-floating mb-2 center-block">
                                        <div id="otp" class="inputs d-flex flex-row justify-content-center mt-2" runat="server" style="direction: ltr">
                                            <div class="userInput" style="display: flex">
                                                <input type="text" id='ist' maxlength="1" clientidmode="Static" runat="server" onkeyup="clickEvent(this,'sec')">
                                                <input type="text" id="sec" maxlength="1" clientidmode="Static" runat="server" onkeyup="clickEvent(this,'third')">
                                                <input type="text" id="third" maxlength="1" clientidmode="Static" runat="server" onkeyup="clickEvent(this,'fourth')">
                                                <input type="text" id="fourth" maxlength="1" clientidmode="Static" runat="server" onkeyup="clickEvent(this,'fifth')">
                                                <input type="text" id="fifth" maxlength="1" clientidmode="Static" runat="server" onkeyup="clickEvent(this,'sixth')">
                                                <input type="text" id="sixth" maxlength="1" clientidmode="Static" runat="server">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12 align-content-center text-center " style="text-align: center;">
                                        <asp:CustomValidator ID="OTP_Validator" ClientIDMode="Static" runat="server" CssClass="otp-validator"
                                            Display="Dynamic" ValidationGroup="verify"
                                            Font-Bold="true" Font-Size="Small" ForeColor="red"
                                            ClientValidationFunction="ValidateOTP_Required" OnServerValidate="OTP_Validator_ServerValidate"
                                            SetFocusOnError="true"></asp:CustomValidator>

                                        <asp:Button ID="submitOTP" ValidationGroup="verify" runat="server" OnClick="submitOTP_Click"
                                            CausesValidation="true" CssClass="btn btn-primary login-btn  col-md-12 mb-3" Text="تحقق"></asp:Button>

                                        لم تتلق أي رمز ؟
         <div class="resend-otp">
             <asp:LinkButton ID="ResendOTP" runat="server" ClientIDMode="Static" CausesValidation="false" class="center-block mt-1" OnClick="ResendOTP_Click"
                 ForeColor="blue" Font-Bold="true" Font-Size="Small">إعادة إرسال الرمز <span id="timer">60</span></asp:LinkButton>
         </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>
                <%--Invalid/Sucess--%>
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
                                <p id="contact" runat="server" style="font-weight: 200; font-size: medium;">يرجى التواصل مع ضابط الارتباط في وزارة الاقتصاد الرقمي والريادة لفك قفل الحساب..</p>


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
                <div class="modal fade" id="statusErrorsModal" runat="server" clientidmode="Static"
                    aria-hidden="true" data-backdrop="static" data-keyboard="false">
                    <div class="modal-dialog modal-confirm" style="width: 40%!important; margin-top: 12%!important;">
                        <div class="modal-content">
                            <div class="modal-header">
                                <div class="icon-box" runat="server" style="background-color: white">
                                    <img src="/assets/images/exclamation.png" alt="cookies-img" style="margin-bottom: 15px;" />
                                </div>
                            </div>

                            <div class="modal-body text-center">
                                <p id="exceeded" runat="server">
                                    <b>لقد تجاوزت العدد المسموح به من عمليات تسجيل الدخول الغير ناجحه...
                                </p>
                                <p id="contact2" runat="server" style="font-weight: 200; font-size: small;">
                                    تم إيقاف حسابك!
                                                    <br />
                                    يرجى التواصل مع ضابط الارتباط في وزارة الاقتصاد الرقمي والريادة لفك قفل الحساب..
                                </p>


                            </div>
                            <div class="modal-footer border-2 d-flex justify-content-md-center">

                                <asp:Button ID="BtnLogout" runat="server" Text="الدخول إلى المنصة" OnClick="BtnLogout_Click"
                                    type="button" CssClass="btn w-100"
                                    Style="background-color: cornflowerblue; color: white" />
                            </div>
                        </div>
                    </div>
                </div>

            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="submitOTP" />
                <asp:PostBackTrigger ControlID="BtnLogout" />

            </Triggers>
        </asp:UpdatePanel>
    </section>
    <script>        
        var time;
        function resetTimer() {
            var timer = $("#timer");
            var actionTimer = $("#ResendOTP");
            if (!time) {
                time = 60;
            }
            actionTimer
                .css({ cursor: "not-allowed", color: "#EF3A3A" })
                .attr("onclick", false);
            timer.text(`(${time}s)`);
            var intervalTimer = setInterval(function () {
                time -= 1;
                timer.text(`(${time}s)`);
                if (time < 1) {
                    clearInterval(intervalTimer);
                    timer.text("");
                    actionTimer
                        .css({ cursor: "pointer", color: "#009688" })
                        .attr("onclick", "resendToken()");
                }
            }, 1000);
        }
        resetTimer();

        function resendToken() {
            time = 90;
            resetTimer();
        }

    </script>
    <script type="text/javascript">

        //open modal

        function openInvalid() {
            $("#statusErrorsModal").modal('show');
        }

        function openLockedModal() {
            $("#statusLockedModal").modal('show');
        }
        function clickEvent(first, last) {
            if (first.value.length) {
                document.getElementById(last).focus();
            }
        }
        function showContent(status, messgae) {
            toastr.options = {
                "closeButton": true,
                "debug": false,
                "progressBar": true,
                "preventDuplicates": false,
                "positionClass": "toast-top-right",
                "showDuration": "600",
                "hideDuration": "1000",
                "timeOut": "6000",
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
    </script>
</asp:Content>
