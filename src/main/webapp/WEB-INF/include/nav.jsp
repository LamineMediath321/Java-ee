<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <header class="header_section">
      <div class="container-fluid">
        <nav class="navbar navbar-expand-lg custom_nav-container">
          <a class="navbar-brand" href="${pageContext.request.contextPath}/home">
            <img src="images/logo.png" alt="" /><span>
              Zezmon
            </span>
          </a>

          <div class="navbar-collapse" id="">
            <div class="container">
              <div class=" mr-auto flex-column flex-lg-row align-items-center">
                <ul class="navbar-nav justify-content-between ">
                  <div class="d-none d-lg-flex">
                    <li class="nav-item">
                      <a class="nav-link" href="fruit.html">
                        Customer Number : 01234567890</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="service.html">
                        Demo@gmail.com
                      </a>
                    </li>
                    <c:if test="${!empty sessionScope.role }">
                     <li class="nav-item">
                      <a class="nav-link" href="${pageContext.request.contextPath}/admin/accesRestreint.jsp">
                        Admin
                      </a>
                    </li>
                    </c:if>
                  </div>
                  <div class=" d-none d-lg-flex">
                    <li class="nav-item">
                    <c:choose>
	                    <c:when test="${empty sessionScope.email }"> 
		                      <a class="nav-link" href="${pageContext.request.contextPath}/login.jsp">
		                        Login / Register
		                      </a>
	                      </c:when>
	                      <c:otherwise>
  								<a class="nav-link" href="logout">
		                        Logout / ${ sessionScope.email}
		                        </a>
  						  </c:otherwise>
                      </c:choose>
                    </li>
                    <form class="form-inline my-2 ml-5 mb-3 mb-lg-0">
                      <button class="btn  my-2 my-sm-0 nav_search-btn" type="submit"></button>
                    </form>
                  </div>
                </ul>
              </div>
            </div>

            <div class="custom_menu-btn">
              <button onclick="openNav()"></button>
            </div>
            <div id="myNav" class="overlay">
              <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
              <div class="overlay-content">
                <a href="${pageContext.request.contextPath}/home">ACCEUIL</a>
                <a href="${pageContext.request.contextPath}/produits">PRODUITS</a>
              </div>
            </div>
          </div>
        </nav>
      </div>
    </header>