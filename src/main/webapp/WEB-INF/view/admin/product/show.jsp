<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content="Hỏi Dân IT - Dự án laptopshop" />
    <meta name="author" content="Hỏi Dân IT" />
    <title>Manage Product</title>
 
    <link href="/css/styles.css" rel="stylesheet" />
    <script
      src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
      crossorigin="anonymous"
    ></script>
   
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"
    />
  </head>

  <body class="sb-nav-fixed">
    <jsp:include page="../layout/header.jsp" />
    <div id="layoutSidenav">
      <jsp:include page="../layout/sidebar.jsp" />
      <div id="layoutSidenav_content">
        <main>
          <div class="container-fluid px-4">
            <h1 class="mt-4">Manage Product</h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
              <li class="breadcrumb-item active">Product</li>
            </ol>

            <div
              class="d-flex justify-content-between flex-column flex-md-row mb-4"
            >
              <h3>Table Product</h3>
              <a
                href="/admin/product/create"
                class="btn btn-primary mt-3 mt-md-0"
                >Create a Product</a
              >
            </div>
            <hr />
            <table class="table table-bordered table-hover">
              <thead>
                <tr>
                  <th scope="col">ID</th>
                  <th scope="col">Name</th>
                  <th scope="col">Price</th>
                  <th scope="col">Factory</th>
                  <th scope="col">Action</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="product" items="${products}">
                  <tr>
                    <th>${product.id}</th>
                    <td>${product.name}</td>
                    <td><fmt:formatNumber value="${product.price}" type="number"  />đ</td>
                    <td>${product.factory}</td>
                    <td>
                      <a
                        href="/admin/product/${product.id}"
                        class="btn btn-success btn-sm"
                        >View</a
                      >
                      <a
                        href="/admin/product/update/${product.id}"
                        class="btn btn-primary btn-sm mx-2"
                        >Update</a
                      >
                      <a
                        href="/admin/product/delete/${product.id}"
                        class="btn btn-danger btn-sm"
                        >Delete</a
                      >
                    </td>
                  </tr>
                </c:forEach>
              </tbody>
            </table>

            <hr />

            <nav aria-label="Page navigation example">
              <ul class="pagination justify-content-center">
                <li class="page-item">
                  <a class="${1 eq currentPage ? 'disabled page-link' : 'page-link'}"
                   href="/admin/product?page=${currentPage - 1}" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                  </a>
                </li>
                <c:forEach begin="0" end="${totalPages - 1}" varStatus="loop">
                  <li class="page-item">
                    <a class="${(loop.index + 1) eq currentPage ? 'active page-link'  : 'page-link'}" 
                    href="/admin/product?page=${loop.index + 1}">
                  ${loop.index +1}
                  </a>
                  </li>

                </c:forEach>

              
           
                <li class="page-item">
                  <a class="${totalPages eq currentPage ? 'disabled page-link' : 'page-link'}"
                   href="/admin/product?page=${currentPage + 1}" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                  </a>
                </li>
              </ul>
            </nav>
          </div>
        </main>
        <jsp:include page="../layout/footer.jsp" />
      </div>
    </div>

    <!-- Scripts -->
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      crossorigin="anonymous"
    ></script>
    <script src="/js/scripts.js"></script>
  </body>
</html>
