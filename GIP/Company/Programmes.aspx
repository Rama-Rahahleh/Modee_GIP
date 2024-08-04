<%@ Page Title="" Language="C#" MasterPageFile="~/Company/Site.Master" AutoEventWireup="true" CodeBehind="Programmes.aspx.cs" Inherits="GIP.Company.Programmes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
    

 .container .product {
	/* width: 610px;*/
	 height: 250px;
	 display: flex;
	 margin: 1em 0;
	 border-radius: 5px;
	 overflow: hidden;
	 cursor: pointer;
	 box-shadow: 0px 0px 21px 3px rgba(0, 0, 0, 0.15);
	 transition: all 0.1s ease-in-out;
}
 .container .product:hover {
	 box-shadow: 0px 0px 21px 3px rgba(0, 0, 0, 0.11);
}
 .container .product .img-container {
	 flex: 2;
}
 .container .product .img-container img {
	 object-fit: contain;
	 width: 100%;
	 height: 100%;
}
 .container .product .product-info {
	 background: #fff;
	 flex: 3;
	 padding: 25px;
}
 .container .product .product-info .product-content {
	 padding: 0.2em 0 0.2em 1em;
}
 .container .product .product-info .product-content h5 {
	
      font-size: 1.0em;
 font-weight: bold;
}
 .container .product .product-info .product-content p {
	 color: #636363;
	 font-size: 0.7em;
	 
	 width: 90%;
}
 .container .product .product-info .product-content ul li {
	 color: #636363;
	 font-size: 0.9em;
	 margin-left: 0;
}
 .container .product .product-info .product-content .buttons {
	 padding-top: 0.4em;
}
 .container .product .product-info .product-content .buttons .button {
	 text-decoration: none;
	 color: #5e5e5e;
	 font-weight: bold;
	 padding: 0.3em 0.65em;
	 border-radius: 2.3px;
	 transition: all 0.1s ease-in-out;
}
 .container .product .product-info .product-content .buttons .add {
	 border: 1px #5e5e5e solid;
}
 .container .product .product-info .product-content .buttons .add:hover {
	 border-color: #6997b6;
	 color: #6997b6;
}
 .container .product .product-info .product-content .buttons .buy {
	 border: 1px #5e5e5e solid;
}
 .container .product .product-info .product-content .buttons .buy:hover {
	 border-color: #6997b6;
	 color: #6997b6;
}
 .container .product .product-info .product-content .buttons #price {
	 margin-left: 4em;
	 color: #5e5e5e;
	 font-weight: bold;
	 border: 1px solid rgba(137, 137, 137, .2);
	 background: rgba(137, 137, 137, .04);
}
 
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container">

        <div class="product">
            <div class="img-container">
                <img src="/Asset/img/Logo/GIP.png">
            </div>
            <div class="product-info">
                <div class="product-content">
                    <h5>برنامج تدريب وتشغيل خريجي الاتصالات وتكنولوجيا المعلومات GIP</h5>
                    <p>تقوم الوزارة بدعم 50% من الأجور الشهرية للمستفيدين من البرنامج (خريجي تخصصات الاتصالات وتكنولوجيا المعلومات) لمدة 12 شهر وبقيمة 150 دينار أردني، كما يدعم البرنامج ابناء المحافظات بحسب مكان الإقامة المسجل على بطاقة الاحوال المدنية وذلك من خلال دفع 50 دينار شهريا بدل مواصلات</p>
                  
                    <div class="buttons">
                        <asp:Button ID="StartGIP" runat="server"
                            BackColor="#2487ce" ForeColor="White" Font-Bold="true" Font-Size="Small" OnClick="StartGIP_Click"
                             CssClass="btn  mt-2 login-btn col-md-12" Text="لتقديم"></asp:Button>
                    </div>
                </div>
            </div>
        </div>

        <div class="product">

            <div class="product-info">
                <div class="product-content">
                     <h5>مبادرة قصتك</h5>
                    <p>مبادرة مخصصة لخريجات قطاع الاتصالات وتكنولوجيا المعلومات في القطاع الخاص، بحيث تدعم الوزارة (100%) من مكافآتهم الشهرية بقيمة 300 دينار أردني ولمدة (12) شهر، على ان يتم تشغيلهن في مهام تتناسب مع تخصصاتهن الجامعية وأن يتم توفير فرصة عمل ثابتة في نفس الشركة بعد انتهاء مدة الدعم.</p>
                    
                    
                    <div class="buttons">
                        <asp:Button ID="StartQsaTech"  runat="server"
                            BackColor="#2487ce" ForeColor="White" Font-Bold="true" Font-Size="Small" OnClick="StartQsaTech_Click"
                           CssClass="btn  mt-2 login-btn col-md-12" Text="لتقديم"></asp:Button>
                    </div>
                </div>
            </div>
            <div class="img-container">
                <img src="/Asset/img/Logo/Qesa%20tech.jpeg">
            </div>
        </div>

    </div>

</asp:Content>
