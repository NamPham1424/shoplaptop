<%@ page contentType="text/html" pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Product Detail-${pro.name}</title>

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
    <link href="/client/css/style.css" rel="stylesheet" />
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

    <!-- Single Product Start -->
    <div class="container-fluid py-5 mt-5">
      <div class="container py-5">
        <div class="row g-4 mb-5">
          <div>
            <nav aria-label="breadcrumb">
              <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">
                  Chi Tiết Sản Phẩm
                </li>
              </ol>
            </nav>
          </div>

          <div class="col-lg-8 col-xl-9">
            <div class="row g-4">
              <div class="col-lg-6">
                <div class="border rounded">
                  <a href="#">
                    <img
                      src="/images/product/${pro.image}"
                      class="img-fluid rounded"
                      alt="Product Image"
                    />
                  </a>
                </div>
              </div>
              <div class="col-lg-6">
                <h4 class="fw-bold mb-3">${pro.name}</h4>
                <p class="mb-3">${pro.factory}</p>
                <h5 class="fw-bold mb-3">
                  <fmt:formatNumber type="number" value="${pro.price} " /> đ
                </h5>
                <div class="d-flex mb-4">
                  <i class="fa fa-star text-secondary"></i>
                  <i class="fa fa-star text-secondary"></i>
                  <i class="fa fa-star text-secondary"></i>
                  <i class="fa fa-star text-secondary"></i>
                  <i class="fa fa-star"></i>
                </div>
                <p class="mb-4">${pro.shortDesc}.</p>
                <div class="input-group quantity mb-5" style="width: 100px">
                  <button
                    class="btn btn-sm btn-minus rounded-circle bg-light border"
                  >
                    <i class="fa fa-minus"></i>
                  </button>
                  <input
                    type="text"
                    class="form-control form-control-sm text-center border-0"
                    value="1"
                  />
                  <button
                    class="btn btn-sm btn-plus rounded-circle bg-light border"
                  >
                    <i class="fa fa-plus"></i>
                  </button>
                </div>
                <a
                  href="#"
                  class="btn border border-secondary rounded-pill px-4 py-2 text-primary"
                >
                  <i class="fa fa-shopping-bag me-2 text-primary"></i> Add to
                  cart
                </a>
              </div>
              <div class="col-lg-12">
                <nav>
                  <div class="nav nav-tabs mb-3">
                    <button
                      class="nav-link active border-white border-bottom-0"
                      type="button"
                      data-bs-toggle="tab"
                      data-bs-target="#nav-description"
                    >
                      Description
                    </button>
                  </div>
                </nav>
                <div class="tab-content mb-5">
                  <div class="tab-pane active" id="nav-description">
                    <p>${pro.detailDesc}</p>
                    <div class="px-2">
                      <div class="row g-4">
                        <div class="col-6">
                          <div
                            class="row bg-light align-items-center text-center justify-content-center py-2"
                          >
                            <div class="col-6"><p class="mb-0">Weight</p></div>
                            <div class="col-6"><p class="mb-0">1 kg</p></div>
                          </div>
                          <div
                            class="row text-center align-items-center justify-content-center py-2"
                          >
                            <div class="col-6"><p class="mb-0">Origin</p></div>
                            <div class="col-6">
                              <p class="mb-0">Agro Farm</p>
                            </div>
                          </div>
                          <div
                            class="row bg-light text-center align-items-center justify-content-center py-2"
                          >
                            <div class="col-6"><p class="mb-0">Quality</p></div>
                            <div class="col-6"><p class="mb-0">Organic</p></div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-xl-3">
            <div class="mb-4">
              <h4>Categories</h4>
              <ul class="list-unstyled">
                <li>
                  <a href="#"
                    ><i class="fas fa-apple-alt me-2"></i>Apples (3)</a
                  >
                </li>
                <li>
                  <a href="#"
                    ><i class="fas fa-apple-alt me-2"></i>Oranges (5)</a
                  >
                </li>
                <li>
                  <a href="#"
                    ><i class="fas fa-apple-alt me-2"></i>Strawberries (2)</a
                  >
                </li>
                <li>
                  <a href="#"
                    ><i class="fas fa-apple-alt me-2"></i>Bananas (8)</a
                  >
                </li>
                <li>
                  <a href="#"
                    ><i class="fas fa-apple-alt me-2"></i>Pumpkins (5)</a
                  >
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Single Product End -->

    <jsp:include page="../layout/footer.jsp" />

    <!-- JavaScript Libraries -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/client/lib/easing/easing.min.js"></script>
    <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
    <script src="/client/js/main.js"></script>
  </body>
</html>
