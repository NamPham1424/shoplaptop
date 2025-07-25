<%@ page contentType="text/html" pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>HomePage | Laptop Shop</title>

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
      rel="stylesheet"
    />

    <!-- Icon Font Stylesheet -->
    <link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
    />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
      rel="stylesheet"
    />

    <!-- Libraries Stylesheet -->
    <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet" />
    <link
      href="/client/lib/owlcarousel/assets/owl.carousel.min.css"
      rel="stylesheet"
    />

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/client/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Template Stylesheet -->
    <link rel="stylesheet" href="/client/css/style.css" />
    <link rel="stylesheet" href="/client/css/shopcss.css" />

    <meta name="_csrf" content="${_csrf.token}" />
   
    <!-- default header name is X-CSRF-TOKEN -->
    <meta name="_csrf_header" content="${_csrf.headerName}" />

    <link
      href="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.css"
      rel="stylesheet"
    />
  </head>
  <body>
    <!-- Spinner Start -->
    <div
      id="spinner"
      class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50 d-flex align-items-center justify-content-center"
    >
      <div class="spinner-grow text-primary" role="status"></div>
    </div>
    <!-- Spinner End -->

    <jsp:include page="../layout/header.jsp" />

    <!-- Modal Search Start -->
    <div
      class="modal fade"
      id="searchModal"
      tabindex="-1"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-fullscreen">
        <div class="modal-content rounded-0">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">
              Search by keyword
            </h5>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
            ></button>
          </div>
          <div class="modal-body d-flex align-items-center">
            <div class="input-group w-75 mx-auto d-flex">
              <input
                type="search"
                class="form-control p-3"
                placeholder="keywords"
                aria-describedby="search-icon-1"
              />
              <span id="search-icon-1" class="input-group-text p-3"
                ><i class="fa fa-search"></i
              ></span>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Modal Search End -->

    <jsp:include page="../layout/banner.jsp" />

    <!-- Fruits Shop Start -->
    <div class="container-fluid fruite py-5">
      <div class="container py-5">
        <div class="tab-class text-center">
          <div class="row g-4">
            <div class="col-lg-4 text-start">
              <h1>Featured Products</h1>
            </div>
            <div class="col-lg-8 text-end">
              <ul class="nav nav-pills d-inline-flex text-center mb-5">
                <li class="nav-item">
                  <a
                    class="d-flex m-2 py-2 bg-light rounded-pill active"
                    href="/products"
                  >
                    <span class="text-dark" style="width: 130px"
                      >All Products</span
                    >
                  </a>
                </li>
              </ul>
            </div>
          </div>
          <div class="tab-content">
            <div id="tab-1" class="tab-pane fade show p-0 active">
              <div class="row g-4">
                <div class="col-lg-12">
                  <div class="row g-4">
                    <c:forEach var="product" items="${products}">
                      <div class="col-md-6 col-lg-4 col-xl-3">
                        <div class="rounded position-relative fruite-item">
                          <div class="fruite-img">
                            <img
                              src="/images/product/${product.image}"
                              class="img-fluid w-100 rounded-top"
                              alt="${product.name}"
                            />
                          </div>
                          <div
                            class="text-white bg-secondary px-3 py-1 rounded position-absolute"
                            style="top: 10px; left: 10px"
                          >
                            Laptop
                          </div>
                          <div
                            class="p-4 border border-secondary border-top-0 rounded-bottom d-flex flex-column"
                          >
                            <h4
                              style="
                                font-size: 15px;
                                flex-grow: 0;
                                margin-bottom: 10px;
                              "
                            >
                              <a href="/product/${product.id}"
                                >${product.name}</a
                              >
                            </h4>
                            <p
                              style="
                                font-size: 13px;
                                flex-grow: 0;
                                margin-bottom: 10px;
                              "
                            >
                              ${product.shortDesc}
                            </p>
                            <div
                              class="d-flex flex-column justify-content-between"
                              style="flex-grow: 1"
                            >
                              <p
                                style="
                                  font-size: 15px;
                                  text-align: center;
                                  width: 100%;
                                "
                                class="text-dark fw-bold mb-3"
                              >
                                <fmt:formatNumber
                                  type="number"
                                  value="${product.price}"
                                  pattern="#,###"
                                />
                                đ
                              </p>
                              <!-- <form
                                action="/add-product-to-cart/${product.id}"
                                method="post"
                              >
                                <input
                                  type="hidden"
                                  name="${_csrf.parameterName}"
                                  value="${_csrf.token}"
                                /> -->
                          
                                  <button data-product-id="${product.id}"Add commentMore actions
                                  class="btnAddToCartHomepage mx-auto btn border border-secondary rounded-pill px-3 text-primary">
                                  <i
                                      class="fa fa-shopping-bag me-2 text-primary"></i>
                                  Add to cart
                              </button>
                              <!-- </form> -->
                            </div>
                          </div>
                        </div>
                      </div>
                    </c:forEach>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Fruits Shop End -->

    <jsp:include page="../layout/feature.jsp" />
    <jsp:include page="../layout/footer.jsp" />

    <!-- Copyright Start -->
    <div class="container-fluid copyright bg-dark py-4">
      <div class="container">
        <div class="row">
          <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
            <span class="text-light"
              ><a href="#"
                ><i class="fas fa-copyright text-light me-2"></i>Your Site
                Name</a
              >, All rights reserved.</span
            >
          </div>
          <div class="col-md-6 my-auto text-center text-md-end text-white">
            Designed By
            <a class="border-bottom" href="https://htmlcodex.com">HTML Codex</a>
            Distributed By
            <a class="border-bottom" href="https://themewagon.com"
              >ThemeWagon</a
            >
          </div>
        </div>
      </div>
    </div>
    <!-- Copyright End -->

    <!-- Back to Top -->
    <a
      href="#"
      class="btn btn-primary border-3 border-primary rounded-circle back-to-top"
      ><i class="fa fa-arrow-up"></i
    ></a>

    <!-- JavaScript Libraries -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/client/lib/easing/easing.min.js"></script>
    <script src="/client/lib/waypoints/waypoints.min.js"></script>
    <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
    <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>
    <script
    src="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.js"></script>
    <script src="/client/js/main.js"></script>
  </body>
</html>
