<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="GIP.Home" %>
<!DOCTYPE html>
<html lang="ar" dir="rtl">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>برنامج تدريب وتشغيل خريجي الاتصالات وتكنولوجيا المعلومات</title>
    <meta content="" name="description">
    <meta content="" name="keywords">
    <meta name='viewport' content='width=device-width, initial-scale=1.0, user-scalable=0'>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="theme-color" content="#2ddcd3">
    <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="mobile-web-app-capable" content="yes">
    <meta name="HandheldFriendly" content="True">
    <meta name="MobileOptimized" content="320">
    <meta name="author" content="sprukotechnologies">

    <!--fav Modee_icone-->
    <link href="Asset/img/Logo/logo.png" rel="icon">
    <link href="Asset/img/Logo/logo.png" rel="apple-touch-icon">
    
    <%--jQuery--%>
    <script src="/Asset/js/jquery-3.7.1.min.js"></script>

    <%--Bootstrap JS--%>
    <script src="Asset/js/bootstrap.min.js"></script>

    <%--Bootstrap--%>
    <link rel="stylesheet" href="Asset/css/bootstrap-5.0.2/bootstrap.min.css">
    
    
    <!--  Fonts -->
    <link href="Asset/font/stylesheet.css" rel="stylesheet">

    <!-- Font-awesome  Css -->
    <link href="Asset/css/fontawesome-free-5.15.4-web/css/all.css" rel="stylesheet" media='all' />

    <%--Toaster--%>
    <link href="Asset/css/toastr/toastr.min.css" rel="stylesheet" />
    <script src="Asset/css/toastr/toastr.min.js"></script>

     <%--PhoneNumber--%>
      <link href="Asset/css/build/css/intITellnputRTL.css" rel="stylesheet" />
      <script src="Asset/css/build/js/intlTelInput.js"></script>
    <!-- Favicons -->
  <link href="Asset/img/Logo/MoDEE1.png" rel="icon">
  <link href="Asset/img/Logo/MoDEE1.png" rel="apple-touch-icon">
    
  <!-- Fonts -->
  <link href="../Asset/font/stylesheet.css" rel="stylesheet" />
 
  <!-- Vendor CSS Files -->
  <link href="Asset/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="Asset/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="Asset/vendor/aos/aos.css" rel="stylesheet">
  <link href="Asset/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="Asset/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Main CSS File -->
  <link href="Asset/css/main.css" rel="stylesheet">
 
 <!-- Template Main CSS File -->
 <link href="Asset/css/main.css" rel="stylesheet">

 
</head>

<body class="index-page">

  <header id="header" class="header d-flex align-items-center sticky-top">
    <div class="container-fluid container-xl position-relative d-flex align-items-center">

      <a href="Home.aspx" class="logo d-flex align-items-center ms-auto">
        <!-- Uncomment the line below if you also wish to use an image logo -->
        <!-- <img src="Asset/img/logo.png" alt=""> -->
        <h1 class="sitename"><img src="Asset/img/modee2.png"/></h1>
      </a>

      <nav id="navmenu" class="navmenu">
        <ul>
          <li><a href="Home.aspx" class="active">الصفحة الرئيسية<br></a></li>
          <li><a href="#about">من نحن</a></li>
          <li><a href="#Program">البرامج التدريبية</a></li>
          <li><a href="#faq">الاسئلة الشائعة</a></li>
          <li><a href="Home.aspx#contact">اتصل بنا</a></li>
            <li id="userSection" runat="server" class=" dropdown">

    <a href="#"><span id="UserName" runat="server"></span><i class="bi bi-chevron-down"></i></a>
    <ul>
        <li><a id="profileLink" runat="server" href="~/Company/CompanyProfile.aspx">الملف الشخصي<i class="fa fa-user"></i> </a></li>

        <li><a id="settingsLink" runat="server" href="#" class="dropdown-item">طلباتي<i class="fa fa-sliders-h"></i> </a></li>
        <li><a id="chgPwd" runat="server" href="~/ChangePassword.aspx">إعدادات الحساب<span class="small">(تغيير كلمة السر)</span>
            <i class=" fa fa-cog"></i></a></li>
        <li>
            <a href="~/Logout.aspx">خروج<i class="fa fa-sign-out-alt"></i></a>
        </li>
    </ul>


</li>
        </ul>
        <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
      </nav>

        <a id="signin" runat="server" class="btn-getstarted" href="Login">تسجيل دخول</a>
    </div>
  </header>

  <main class="main">

    <!-- Hero Section -->
    <section id="hero" class="hero section">

      <img src="Asset/img/hero-bg-abstract.jpg" alt="" data-aos="fade-in" class="">

      <div class="container">
        <div class="row justify-content-center" data-aos="zoom-out">
          <div class="col-xl-7 col-lg-9 text-center">
            <h1>  تدريب وتشغيل خريجي الاتصالات وتكنولوجيا المعلومات</h1>
            <p></p>
          </div>
        </div>
        <div class="text-center" data-aos="zoom-out" data-aos-delay="100">
          <a href="#Program" class="btn-get-started">تعرف على برامجنا التدريبية </a>
        </div>

        <div class="row gy-4 mt-5">
          <div class="col-md-6 col-lg-3" data-aos="zoom-out" data-aos-delay="100">
            <div class="icon-box">
              <div class="icon"><i class="bi bi-easel"></i></div>
              <h4 class="title"><a href="">Lorem Ipsum</a></h4>
              <p class="description">Voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi</p>
            </div>
          </div><!--End Icon Box -->

          <div class="col-md-6 col-lg-3" data-aos="zoom-out" data-aos-delay="200">
            <div class="icon-box">
              <div class="icon"><i class="bi bi-gem"></i></div>
              <h4 class="title"><a href="">Sed ut perspiciatis</a></h4>
              <p class="description">Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore</p>
            </div>
          </div><!--End Icon Box -->

          <div class="col-md-6 col-lg-3" data-aos="zoom-out" data-aos-delay="300">
            <div class="icon-box">
              <div class="icon"><i class="bi bi-geo-alt"></i></div>
              <h4 class="title"><a href="">Magni Dolores</a></h4>
              <p class="description">Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia</p>
            </div>
          </div><!--End Icon Box -->

          <div class="col-md-6 col-lg-3" data-aos="zoom-out" data-aos-delay="400">
            <div class="icon-box">
              <div class="icon"><i class="bi bi-command"></i></div>
              <h4 class="title"><a href="">Nemo Enim</a></h4>
              <p class="description">At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis</p>
            </div>
          </div><!--End Icon Box -->

        </div>
      </div>

    </section>
      <!-- /Hero Section -->

    <!-- About Section -->
    <section id="about" class="about section">

      <!-- Section Title -->
      <div class="container section-title" data-aos="fade-up">
        <h2>من نحن<br></h2>
        <p>تدريب وتشغيل خريجي الاتصالات وتكنولوجيا المعلومات</p>
      </div><!-- End Section Title -->

      <div class="container">

        <div class="row gy-4">

          <div class="col-lg-6 content" data-aos="fade-up" data-aos-delay="100">
            <p>
              Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore
              magna aliqua.
            </p>
            <ul>
              <li><i class="bi bi-check2-circle"></i> <span>Ullamco laboris nisi ut aliquip ex ea commodo consequat.</span></li>
              <li><i class="bi bi-check2-circle"></i> <span>Duis aute irure dolor in reprehenderit in voluptate velit.</span></li>
              <li><i class="bi bi-check2-circle"></i> <span>Ullamco laboris nisi ut aliquip ex ea commodo</span></li>
            </ul>
          </div>

          <div class="col-lg-6" data-aos="fade-up" data-aos-delay="200">
            <p>Ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. </p>
            <a href="#" class="read-more"><span>Read More</span><i class="bi bi-arrow-right"></i></a>
          </div>

        </div>

      </div>

    </section> <!-- /About Section -->

    <!-- Stats Section -->
    <section id="stats" class="stats section light-background">

      <div class="container" data-aos="fade-up" data-aos-delay="100">

        <div class="row gy-4">

          <div class="col-lg-4 col-md-6">
            <div class="stats-item text-center w-100 h-100">
              <span data-purecounter-start="0" data-purecounter-end="232" data-purecounter-duration="1" class="purecounter"></span>
              <p>عدد الشركات</p>
            </div>
          </div><!-- End Stats Item -->

          <div class="col-lg-4 col-md-6">
            <div class="stats-item text-center w-100 h-100">
              <span data-purecounter-start="0" data-purecounter-end="521" data-purecounter-duration="1" class="purecounter"></span>
              <p>عدد الخريجي</p>
            </div>
          </div><!-- End Stats Item -->

          <div class="col-lg-4 col-md-6">
            <div class="stats-item text-center w-100 h-100">
              <span data-purecounter-start="0" data-purecounter-end="1453" data-purecounter-duration="1" class="purecounter"></span>
              <p>عدد الخريجي من الإناث</p>
            </div>
          </div><!-- End Stats Item -->

          

        </div>

      </div>

    </section><!-- /Stats Section -->

    <!-- About Alt Section -->
    <section id="Program" class="about-alt section">

        <div class="container">

            <div class="row gy-4">
                <div class="col-lg-6 position-relative align-self-start" data-aos="fade-up" data-aos-delay="100">
                    <img src="Asset/img/Logo/GIP.png" class="img-fluid" alt="">
                </div>
                <div class="col-lg-6 content" data-aos="fade-up" data-aos-delay="200">
                    <h3>برنامج تدريب وتشغيل خريجي الاتصالات وتكنولوجيا المعلومات GIP</h3>
                    <p class="fst-italic">
                        <b>نبذه عن البرنامج</b> <br />
                        تقوم الوزارة بدعم 50% من الأجور الشهرية للمستفيدين من البرنامج 
                        (خريجي تخصصات الاتصالات وتكنولوجيا المعلومات) لمدة 12 شهر وبقيمة 150 دينار أردني، كما يدعم
                        البرنامج ابناء المحافظات بحسب مكان الإقامة المسجل على بطاقة الاحوال المدنية وذلك من خلال دفع 50 دينار شهريا بدل مواصلات
                    </p>
                   
                    <p>
                        <b>شروط الاستفادة من البرنامج للشركات</b>
                        <br />
                      أن تقوم الشركة بالتسجيل حسب الأصول على المنصة الخاصة بالبرنامج ضمن الفترة
                        المحددة للتسجيل، بحيث يتم تسجيل كافة المعلومات المطلوبة 
                        وارفاق صورة عن السجل التجاري للشركة ورخصة مهن سارية المفعول، على أن يتم تشغيل المستفيدين بمجال تخصصهم
                    </p>
                </div>
          

                <div class="col-lg-6 content" data-aos="fade-up" data-aos-delay="200">
                    <h3>مبادرة  قصتك </h3>
                    <p class="fst-italic">
                        <b>نبذه عن البرنامج</b>
                        <br />
                        مبادرة مخصصة لخريجات قطاع الاتصالات وتكنولوجيا المعلومات في القطاع الخاص،
                        بحيث تدعم الوزارة (100%) من مكافآتهم الشهرية بقيمة 300 دينار أردني ولمدة (12) شهر،
                        على ان يتم تشغيلهن في مهام تتناسب مع تخصصاتهن الجامعية وأن يتم توفير فرصة عمل ثابتة في نفس الشركة بعد انتهاء مدة الدعم.

                    </p>

                    <p>
                        <b>شروط الاستفادة من البرنامج للشركات</b>
                        <br />
                        أن تقوم الشركة بالتسجيل حسب الأصول على المنصة الخاصة بالبرنامج ضمن الفترة المحددة للتسجيل،
                        بحيث يتم تسجيل كافة المعلومات المطلوبة وارفاق صورة عن السجل التجاري 
                        للشركة ورخصة مهن سارية المفعول، على أن يتم تشغيل المستفيدات بمجال تخصصهم.
                    </p>
                </div>

                <div class="col-lg-6 position-relative align-self-start" data-aos="fade-up" data-aos-delay="100">
                    <img src="Asset/img/Logo/Qesa%20tech.jpeg" class="img-fluid" alt="">
                </div>
            </div>
        </div>

    </section><!-- /About Alt Section -->

   
    <!-- Call To Action Section -->
    <section id="call-to-action" class="call-to-action section accent-background" style="background: url('https://images.pexels.com/photos/2653362/pexels-photo-2653362.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')">

      <div class="container">
        <div class="row justify-content-center" data-aos="zoom-in" data-aos-delay="100">
          <div class="col-xl-10">
            <div class="text-center">
              <h3></h3>
              <p> .</p>
              <a href="#"></a>
            </div>
          </div>
        </div>
      </div>

    </section><!-- /Call To Action Section -->

 
    <!-- Faq Section -->
    <section id="faq" class="faq section light-background">

      <!-- Section Title -->
      <div class="container section-title" data-aos="fade-up">
        <h2>الاسئلة الشائعة</h2>
        <p>بعض الاسئلة والاستفسارات الشائعة عن البرامج </p>
      </div>
        
       <!-- End Section Title -->

      <div class="container">

        <div class="row justify-content-center">

          <div class="col-lg-10" data-aos="fade-up" data-aos-delay="100">

              <div class="faq-container">

                  <div class="faq-item ">
                      <h3>ما هي مدة الدعم الذي يقدمها برنامج التدريب ، مبادرة قصتك؟ </h3>
                      <div class="faq-content">
                          <p>12 شهر </p>
                      </div>
                      <i class="faq-toggle bi bi-chevron-right"></i>
                  </div>
                  <!-- End Faq item-->

                  <div class="faq-item">
                      <h3>ما هي نسبة مساهمة الوزارة في برنامج تدريب وتشغيل خريجي الاتصالات وتكنولوجيات المعلومات ؟ </h3>
                      <div class="faq-content">
                          <p>
                              150 دينار شهري عن كل مستفيد من سكان العاصمة عمان، و200 دينار شهري عن كل مستفيد من سكان المحافظات الأخرى.
                          </p>
                      </div>
                      <i class="faq-toggle bi bi-chevron-right"></i>
                  </div>
                  <!-- End Faq item-->


                  <div class="faq-item">
                      <h3>ما هي نسبة مساهمة الوزارة في مبادرة قصتك ؟ </h3>
                      <div class="faq-content">
                          <p>
                              300 دينار شهري عن كل مستفيدة بالإضافة الى تحمل نسبة الضمان الاجتماعي عن المستفيدة وقيمتها 22.5 دينار/شهر
                          </p>
                      </div>
                      <i class="faq-toggle bi bi-chevron-right"></i>
                  </div>
                  <!-- End Faq item-->

                  <div class="faq-item">
                      <h3>كيف سيتم صرف أجور متدربين برنامج تدريب وتشغيل خريجي الاتصالات وتكنولوجيات المعلومات؟ </h3>
                      <div class="faq-content">
                          <p>من خلال قيام الشركة بإرسال مطالبة نهاية كل شهر لطلب صرف أجور المستفيدين بحسب الاتفاقية الموقعة مع الوزارة.</p>
                      </div>
                      <i class="faq-toggle bi bi-chevron-right"></i>
                  </div>
                  <!-- End Faq item-->

                  <div class="faq-item">
                      <h3>كيف سيتم صرف أجور المتدربين مبادرة قصتك؟ </h3>
                      <div class="faq-content">
                          <p>ستقوم الشركة بإرسال مطالبة نهاية كل شهر لطلب صرف أجور المستفيدات بحسب الاتفاقية الموقعة مع الوزارة.</p>
                      </div>
                      <i class="faq-toggle bi bi-chevron-right"></i>
                  </div>
                  <!-- End Faq item-->

                  <div class="faq-item">
                      <h3>ما هي شروط الاستفادة للخريجين؟</h3>
                      <div class="faq-content">
                          <p>
                              أن يكون خريج أحد تخصصات الاتصالات وتكنولوجيا المعلومات بالإضافة 
                      الى الهندسة الصناعية والهندسة الكهربائية، 
                      أن يكون متعطل عن العمل منذ تاريخ تخرجه، عدم الاستفادة مسبقاً من برامج الوزارة الأخرى.
                          </p>
                      </div>
                      <i class="faq-toggle bi bi-chevron-right"></i>
                  </div>
                  <!-- End Faq item-->

                  <div class="faq-item">
                      <h3>ما هي شروط الاستفادة للخريجين من برنامج تدريب والتشغيل؟ </h3>
                      <div class="faq-content">
                          <p>
                              أن يكون خريج أحد تخصصات الاتصالات وتكنولوجيا المعلومات بالإضافة
                      الى الهندسة الصناعية والهندسة الكهربائية، 
                      أن يكون متعطل عن العمل منذ تاريخ تخرجه، عدم الاستفادة مسبقاً من برامج الوزارة الأخرى. 
                          </p>
                      </div>
                      <i class="faq-toggle bi bi-chevron-right"></i>
                  </div>
                  <!-- End Faq item-->

                  <div class="faq-item">
                      <h3>ما هي شروط الاستفادة للخريجين من مبادرة قصتك؟ </h3>
                      <div class="faq-content">
                          <p>
                              أن تكون خريجة أحد تخصصات الاتصالات وتكنولوجيا المعلومات بالإضافة الى الهندسة الصناعية والهندسة الكهربائية، 
                            أن تكون متعطلة عن العمل آخر ثلاثة أشهر، عدم الاستفادة مسبقاً من برامج الوزارة الأخرى، 
                            الأولوية لسكان المحافظات، الأولوية للمعدلات الجامعية الأعلى.
                          </p>
                      </div>
                      <i class="faq-toggle bi bi-chevron-right"></i>
                  </div>
                  <!-- End Faq item-->

              </div>

          </div><!-- End Faq Column-->

        </div>

      </div>

    </section><!-- /Faq Section -->

    <!-- Contact Section -->
    <section id="contact" class="contact section">

      <!-- Section Title -->
      <div class="container section-title" data-aos="fade-up">
        <h2>أتصل بنا</h2>
        <p>يمكنكم التواصل مع فريق الوزارة وفي حال وجود أي استفسار فني يمكنكم التواصل مع فريق وزارة الاقتصاد الرقمي والريادة</p>
      </div><!-- End Section Title -->

      <div class="container" data-aos="fade-up" data-aos-delay="100">

        <div class="mb-4" data-aos="fade-up" data-aos-delay="200">
          <iframe style="border:0; width: 100%; height: 270px;" 
              src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3385.1786591072196!2d35.84364607613991!3d31.956049525486893!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x151ca16c71ad710b%3A0x1e2c92b4b45e8074!2sMinistry%20of%20Digital%20Economy%20And%20Entrepreneurship!5e0!3m2!1sen!2sjo!4v1704871442257!5m2!1sen!2sjo"
              
              frameborder="0" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
        </div><!-- End Google Maps -->

        <div class="row gy-4">

          <div class="col-lg-4">
            <div class="info-item d-flex" data-aos="fade-up" data-aos-delay="300">
              <i class="bi bi-geo-alt flex-shrink-0"></i>
              <div>
                <h3>الموقع</h3>
                <p>عمان- الدوار الثامن -بيادر وادي السير ص.ب. 9903-عمان 11191-الأردن</p>
              </div>
            </div><!-- End Info Item -->

            <div class="info-item d-flex" data-aos="fade-up" data-aos-delay="400">
              <i class="bi bi-telephone flex-shrink-0"></i>
              <div>
                <h3>لتواصل</h3>
                <p>+962 65 805 700</p>
              </div>
            </div><!-- End Info Item -->

            <div class="info-item d-flex" data-aos="fade-up" data-aos-delay="500">
              <i class="bi bi-envelope flex-shrink-0"></i>
              <div>
                <h3>البريد الالكتروني</h3>
                <p>InvestmentTeam@modee.gov.jo</p>
              </div>
            </div><!-- End Info Item -->

          </div>

          <div class="col-lg-8">
            <form action="forms/contact.php" method="post" class="php-email-form" data-aos="fade-up" data-aos-delay="200">
              <div class="row gy-4">

                <div class="col-md-6">
                  <input type="text" name="name" class="form-control" placeholder="الأسم" required="">
                </div>

                <div class="col-md-6 ">
                  <input type="email" class="form-control" name="email" placeholder="البريد الالكتروني" required="">
                </div>

                <div class="col-md-12">
                  <input type="text" class="form-control" name="subject" placeholder="العنوان" required="">
                </div>

                <div class="col-md-12">
                  <textarea class="form-control" name="message" rows="6" placeholder="الأستفسار" required=""></textarea>
                </div>

                <div class="col-md-12 text-center">
                  <div class="loading">Loading</div>
                  <div class="error-message"></div>
                  <div class="sent-message">Your message has been sent. Thank you!</div>

                  <button type="submit">إرسال</button>
                </div>

              </div>
            </form>
          </div><!-- End Contact Form -->

        </div>

      </div>

    </section>
      
     <!-- /Contact Section -->

  </main>

  <footer id="footer" class="footer light-background">

    <div class="container footer-top">
      <div class="row gy-4">
        <div class="col-lg-5 col-md-12 footer-about">
          <a href="Home.aspx" class="logo d-flex align-items-center">
            <span class="sitename">منصة تدريب خريجي تكنولوجيات المعلومات</span>
          </a>
          <p>Cras fermentum odio eu feugiat lide par naso tierra. Justo eget nada terra videa magna derita valies darta donna mare fermentum iaculis eu non diam phasellus.</p>
          <div class="social-links d-flex mt-4">
            <a href="https://x.com/MoDEEJO?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor"><i class="bi bi-twitter-x"></i></a>
            <a href="https://www.facebook.com/MoDEEJO/?locale=ar_AR"><i class="bi bi-facebook"></i></a>
            <a href="https://www.instagram.com/MoDEEJO/?hl=ar"><i class="bi bi-instagram"></i></a>
            <a href="https://www.linkedin.com/company/modeejo/mycompany/"><i class="bi bi-linkedin"></i></a>
          </div>
        </div>

        <div class="col-lg-3 col-6 footer-links">
          <h4>أهم الروابط</h4>
          <ul>
            <li><a href="Home.aspx">صفحة رئيسية</a></li>
            <li><a href="#About">من نحن</a></li>
            <li><a href="#Program">برامجنا</a></li>
              <li><a href="#faq">أسئلة شائعه</a></li>
            <li><a href="#contact">اتصل بنا</a></li>
          </ul>
        </div>

       

        <div class="col-lg-3 col-md-12 footer-contact text-center text-md-end">
          <h4>أتصل بنا</h4>
          <p>عمان- الدوار الثامن -بيادر وادي السير -</p>
    
          <p>عمان- الأردن</p>
          <p class="mt-4"><strong>رقم هاتف:</strong> <span>+962 65 805 700</span></p>
          <p><strong>البريد الالكتروني:</strong> <span>InvestmentTeam@modee.gov.jo</span></p>
        </div>

      </div>
    </div>

    <div class="container copyright text-center mt-4">
      <p>
            &copy; جميع الحقوق محفوظة  <strong><span>وزارة الاقتصاد الرقمي الريادة </span></strong>
      </p>
      
    </div>

  </footer>

  <!-- Scroll Top -->
  <a href="#" id="scroll-top" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
  
  <!-- Preloader -->
  <div id="preloader"></div>

  <!-- Vendor JS Files -->
  <script src="Asset/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="Asset/vendor/php-email-form/validate.js"></script>
  <script src="Asset/vendor/aos/aos.js"></script>
  <script src="Asset/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="Asset/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="Asset/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="Asset/vendor/imagesloaded/imagesloaded.pkgd.min.js"></script>
  <script src="Asset/vendor/isotope-layout/isotope.pkgd.min.js"></script>
    
  <!-- Main JS File -->
  <script src="Asset/js/main.js"></script>

</body>

</html>
