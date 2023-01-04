<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

   <title>Zezmon</title>

    <!-- Custom fonts for this template-->
    <link href="${pageContext.request.contextPath}/public/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="${pageContext.request.contextPath}/public/admin/css/sb-admin-2.min.css" rel="stylesheet">
     <!-- Custom styles for this page -->
    <link href="${pageContext.request.contextPath}/public/admin/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

	    <!-- Sidebar -->
	    <%@ include file="include/sidebar.jsp" %>
	    <!-- End of sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <%@ include file="include/topNavbar.jsp" %>
				
				<div class="col-6 mx-auto">
					<h1 class="text-center">Single product</h1>
					<h2 class="text-center alert alert-info">
						label: ${label }
					</H2>
					<img src="/e_commerce/public/uploads/${image}" width="500" height="400" class="rounded mx-auto d-block">
					
					<p class="mt-3">
						Description: ${description }
					</p>
					<div class="row alert alert-success">
						<p class="col-6 ">Price: ${price } </p>
						<p class="col-6 ">In stock: ${stock } </p>
					</div>
				</div>	
               
      <!-- footer section -->
		<%@ include file="/WEB-INF/include/footer.jsp" %>
		<!-- footer section -->    

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="logout">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath}/public/admin/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/public/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath}/public/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath}/public/admin/js/sb-admin-2.min.js"></script>
   

    <!-- Page level plugins -->
    <script src="${pageContext.request.contextPath}/public/admin/vendor/chart.js/Chart.min.js"></script>

 <!-- Page level plugins -->
    <script src="${pageContext.request.contextPath}/public/admin/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/public/admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="${pageContext.request.contextPath}/public/admin/js/demo/datatables-demo.js"></script>

</body>

</html>