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

                <!-- Begin Page Content -->
                <div class="container-fluid" style="margin-bottom:200px">
					<div class="col-6 mx-auto">
					<h2 class="text-center m-3">Create a new product</h2>
						<form method="POST" action="addnew" enctype = "multipart/form-data">
						  <div class="form-group">
						    <label for="label">Product label</label>
						    <input type="text" class="form-control" id="libelle" aria-describedby="label" placeholder="Enter label" name="label">
						    <small id="label" class="form-text text-muted">Give a simple label.</small>
						  </div>
						  <div class="form-group">
							    <label for="description">Description</label>
								<textarea class="form-control" id="description" rows="3" name="description"></textarea>
							    <small id="description" class="form-text text-muted">A description of the specific good of the product.</small>
						    </div>
						   <div class="row">
						     <div class="form-group col-6">
							    <label for="price">Price</label>
							    <input type="text" class="form-control" id="price" aria-describedby="price" placeholder="Enter price" name="price">
							    <small id="price" class="form-text text-muted">The price in FCFA.</small>
							  </div>
						     <div class="form-group col-6">
							    <label for="exampleInputPassword1">Stock</label>
							    <input type="number" class="form-control" id="stock" placeholder="Enter stock" name="stock">
						  	</div>
						  </div>
						  
						   <div class="form-group">
						    <label for="price">Choose file</label>
						    <input type="file" class="form-control" id="file" aria-describedby="file" name="image">
						    <small id="file" class="form-text text-muted">Choose a file.</small>
						  </div>
						 
						  
						  <button type="submit" class="btn btn-lg btn-block btn-primary">Save</button>
						</form>
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