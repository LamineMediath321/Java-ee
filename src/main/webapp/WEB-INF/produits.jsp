<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>

<head>
  <!-- Basic -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- Site Metas -->
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />

  <title>Zezmon</title>

<!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/public/css/bootstrap.css" />
  
    <link rel="stylesheet" href="${pageContext.request.contextPath}/alert/dist/sweetalert.css">
  

  <!-- fonts style -->
  <link href="https://fonts.googleapis.com/css?family=Dosis:400,500|Poppins:400,700&display=swap" rel="stylesheet" />
  <!-- Custom styles for this template -->
  <link href="${pageContext.request.contextPath}/public/css/style.css" rel="stylesheet" />
  <!-- responsive style -->
  <link href="${pageContext.request.contextPath}/public/css/responsive.css" rel="stylesheet" />
</head>

<body class="sub_page">

		<input type="hidden" id="status" value="<%= request.getAttribute("status") %>"/>
	

  <div class="hero_area">
    <!-- header section strats -->
	<%@include file="include/nav.jsp" %>
    <!-- end header section -->
  </div>

  <!-- products section -->
  <section class="products_section">
    <div class="heading_container">
      <h2>
        New Products In Store
      </h2>
      <p>
        Featured Product Just Arrived
      </p>
    </div>
    <div class="container layout_padding">
      <div class="product_container">
    <c:forEach var="product" items="${ products }">
    	<a href="?id=${product.id }">
          <div class="product_box">
            <div class="product_img-box">
              <img src="/e_commerce/public/uploads/${product.image}" alt="" />
              <span>
                Sale
              </span>
            </div>
            <div class="product_detail-box">
              <span>
                FCFA <c:out value="${product.price }" />
              </span>
              <p>
               <c:out value="${product.label }" />
              </p>
            </div>
          </div>
        </a>
    </c:forEach>

        
      </div>
    </div>
  </section>

  <!-- end products section -->

  <!-- find section -->
  <section class="find_section layout_padding-bottom">
    <div class="container-fluid">
      <div class="row">
        <div class="col-lg-6 col-md-8 offset-md-2">
          <div class="find_container">
            <div class="row">
              <div class="col-sm-6">
                <div class="find_container-img">
                  <img src="public/images/find-img.png" alt="" />
                </div>
              </div>
              <div class="col-sm-6">
                <h3>
                  Find Everything <br />
                  From A to Z
                </h3>
                <p>
                  Shop Back to school
                </p>
              </div>
            </div>
          </div>
          <div class="shop_container">
            <div class="row">
              <div class="col-sm-6">
                <p>
                  Shoes
                </p>
                <h3>
                  Shop by catagories
                </h3>
                <div>
                  <a href="">
                    View More
                  </a>
                </div>
              </div>
              <div class="col-sm-6">
                <div class="shoe_img-box">
                  <img src="public/images/shoes.png" alt="" />
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="find_img-box">
            <img src="public/images/find-hero.png" alt="" />
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- end find section -->


  <!-- sign section -->
  <section class="sign_section layout_padding2">
    <div class="container">
      <div class="row">
        <div class="col-md-5">
          <h3>
            Sign up for Newsletter
          </h3>
          <p>
            There are many variations of passages of Lorem Ipsum available,
            but the majority have suffered
          </p>
        </div>
        <div class="col-md-7">
          <form action="">
            <input type="email" placeholder="Enter your email" />
            <button>
              Sign Up
            </button>
          </form>
        </div>
      </div>
    </div>
  </section>

  <!-- end sign section -->

  <!-- info section -->
  <section class="info_section layout_padding">
    <div class="container links_container">
      <div class="row ">
        <div class="col-md-3">
          <h3>
            CUSTOMER SERVICE
          </h3>
          <ul>
            <li>
              <a href="">
                International Help
              </a>
            </li>
            <li>
              <a href="">
                Contact Customer Care
              </a>
            </li>
            <li>
              <a href="">
                Return Policy
              </a>
            </li>
            <li>
              <a href="">
                Privacy Policy
              </a>
            </li>
            <li>
              <a href="">
                Shipping Information
              </a>
            </li>
            <li>
              <a href="">
                Promotion Terms
              </a>
            </li>
          </ul>
        </div>
        <div class="col-md-3">
          <h3>
            LET US HELP YOU
          </h3>
          <ul>
            <li>
              <a href="">
                Your Account
              </a>
            </li>
            <li>
              <a href="">
                Your Orders
              </a>
            </li>
            <li>
              <a href="">
                Shipping Rates & Policies
              </a>
            </li>
            <li>
              <a href="">
                Amazon Prime
              </a>
            </li>
            <li>
              <a href="">
                Returns & Replacements
              </a>
            </li>
            <li>
              <a href="">
                Help
              </a>
            </li>
          </ul>
        </div>
        <div class="col-md-3">
          <h3>
            INFORMATION
          </h3>
          <ul>
            <li>
              <a href="">
                About Us
              </a>
            </li>
            <li>
              <a href="">
                Careers
              </a>
            </li>
            <li>
              <a href="">
                Sell on shop
              </a>
            </li>
            <li>
              <a href="">
                Press & News
              </a>
            </li>
            <li>
              <a href="">
                Competitions
              </a>
            </li>
            <li>
              <a href="">
                Terms & Conditions
              </a>
            </li>
          </ul>
        </div>
        <div class="col-md-3">
          <h3>
            OUR SHOP
          </h3>
          <ul>
            <li>
              <a href="">
                Daily Deals
              </a>
            </li>
            <li>
              <a href="">
                App Only Deals
              </a>
            </li>
            <li>
              <a href="">
                Our Hottest Products
              </a>
            </li>
            <li>
              <a href="">
                Gift Vouchers
              </a>
            </li>
            <li>
              <a href="">
                Trending Product
              </a>
            </li>
            <li>
              <a href="">
                Hot Flash Sale
              </a>
            </li>
          </ul>
        </div>
      </div>
    </div>
    <div class="container">
      <div class="follow_container">
        <div class="row">
          <div class="col-md-9">
            <div class="app_container">
              <h3>
                DOWNLOAD OUR APPS

              </h3>
              <div>
                <img src="public/images/google-play.png" alt="">
                <img src="public/images/apple-store.png" alt="">
              </div>
            </div>
          </div>
          <div class="col-md-3 ">
            <div class="info_social">
              <div>
                <a href="">
                  <img src="public/images/fb.png" alt="">
                </a>
              </div>
              <div>
                <a href="">
                  <img src="public/images/twitter.png" alt="">
                </a>
              </div>
              <div>
                <a href="">
                  <img src="public/images/linkedin.png" alt="">
                </a>
              </div>
              <div>
                <a href="">
                  <img src="public/images/instagram.png" alt="">
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- end info section -->

  <!-- footer section -->
  <%@ include file="include/footer.jsp" %>
  <!-- footer section -->

  <script type="text/javascript" src="${pageContext.request.contextPath}/public/js/jquery-3.4.1.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/public/js/bootstrap.js"></script>

  <script>
    function openNav() {
      document.getElementById("myNav").style.width = "100%";
    }

    function closeNav() {
      document.getElementById("myNav").style.width = "0%";
    }
  </script>
  
   <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<script type="text/javascript">
		let status = document.getElementById("status").value;
		if(status == 'Success'){
			swal("Congratulation","your order has been placed successfully","success");
			
		}
	</script>
</body>

</html>