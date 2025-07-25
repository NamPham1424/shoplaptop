<%@ page contentType="text/html" pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Product Detail - ${pro.name}</title>

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
      rel="stylesheet"
    />

    <!-- Icon Font -->
    <link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
    />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
      rel="stylesheet"
    />

    <!-- Library CSS -->
    <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet" />
    <link
      href="/client/lib/owlcarousel/assets/owl.carousel.min.css"
      rel="stylesheet"
    />

    <!-- Bootstrap & Custom CSS -->
    <link href="/client/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/client/css/style.css" rel="stylesheet" />

    <!-- Ẩn nút tăng giảm của input number -->
    <style>
      input[type="number"]::-webkit-inner-spin-button,
      input[type="number"]::-webkit-outer-spin-button {
        -webkit-appearance: none;
        margin: 0;
      }

      input[type="number"] {
        -moz-appearance: textfield;
      }
    </style>
      <meta name="_csrf" content="${_csrf.token}" />
      <!-- default header name is X-CSRF-TOKEN -->
      <meta name="_csrf_header" content="${_csrf.headerName}" />


      <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.css"
          rel="stylesheet">
  </head>
  <body>
    <!-- Spinner -->
    <div
      id="spinner"
      class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50 d-flex align-items-center justify-content-center"
    >
      <div class="spinner-grow text-primary" role="status"></div>
    </div>

    <jsp:include page="../layout/header.jsp" />

    <!-- Product Detail -->
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
                  <a href="#"
                    ><img
                      src="/images/product/${pro.image}"
                      class="img-fluid rounded"
                      alt="Product Image"
                  /></a>
                </div>
              </div>

              <div class="col-lg-6">
                <h4 class="fw-bold mb-3">${pro.name}</h4>
                <p class="mb-3">${pro.factory}</p>
                <h5 class="fw-bold mb-3">
                  <fmt:formatNumber type="number" value="${pro.price}" /> đ
                </h5>
                <div class="d-flex mb-4">
                  <i class="fa fa-star text-secondary"></i>
                  <i class="fa fa-star text-secondary"></i>
                  <i class="fa fa-star text-secondary"></i>
                  <i class="fa fa-star text-secondary"></i>
                  <i class="fa fa-star"></i>
                </div>
                <p class="mb-4">${pro.shortDesc}</p>

                <div class="input-group quantity mb-5" style="width: 120px">
                  <button
                    class="btn btn-sm btn-minus rounded-circle bg-light border"
                    type="button"
                  >
                    <i class="fa fa-minus"></i>
                  </button>
                  <input
                    type="number"
                    class="form-control form-control-sm text-center border-0 quantity-input"
                    value="1"
                    min="1"
                    data-cart-detail-id="${cartDetail.id}"
                    data-cart-detail-price="${cartDetail.price}"
                    data-cart-detail-index="${status.index}"
                  />
                  <button
                    class="btn btn-sm btn-plus rounded-circle bg-light border"
                    type="button"
                  >
                    <i class="fa fa-plus"></i>
                  </button>
                </div>

                <!-- <form
                action="/add-product-to-cart/${pro.id}"
                method="post"
              > -->
              <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
              <input class="form-control d-none" type="text" value="${pro.id}"
                  name="id" />

              <input class="form-control d-none" type="text" name="quantity"
                  id="cartDetails0.quantity" value="1" />
              <button data-product-id="${pro.id}"
                  class="btnAddToCartDetail btn border border-secondary rounded-pill px-4 py-2 mb-4 text-primary"><i
                      class="fa fa-shopping-bag me-2 text-primary"></i>
                  Add to cart
              </button>
              <!-- </form> -->
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
                    <!-- <div class="px-2">
                  <div class="row g-4">
                    <div class="col-6">
                      <div class="row bg-light text-center py-2">
                        <div class="col-6"><p class="mb-0">Weight</p></div>
                        <div class="col-6"><p class="mb-0">1 kg</p></div>
                      </div>
                      <div class="row text-center py-2">
                        <div class="col-6"><p class="mb-0">Origin</p></div>
                        <div class="col-6"><p class="mb-0">Agro Farm</p></div>
                      </div>
                      <div class="row bg-light text-center py-2">
                        <div class="col-6"><p class="mb-0">Quality</p></div>
                        <div class="col-6"><p class="mb-0">Organic</p></div>
                      </div>
                    </div>
                  </div>
                </div> -->
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <jsp:include page="../layout/footer.jsp" />

    <!-- JS Libraries -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/client/lib/easing/easing.min.js"></script>
    <script src="/client/lib/waypoints/waypoints.min.js"></script>
    <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
    <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>
    <script
    src="https://cdnjs.cloudflare.com/ajax/libs/jquery-toast-plugin/1.3.2/jquery.toast.min.js"></script>

    <script src="/client/js/main.js"></script>

    <!-- Xử lý tăng/giảm số lượng -->
    <script>
      $(document).ready(function () {
        $(".btn-plus").click(function () {
          const input = $(this).siblings("input");
          let value = parseInt(input.val());
          if (!isNaN(value)) input.val(value + 1);
        });

        $(".btn-minus").click(function () {
          const input = $(this).siblings("input");
          let value = parseInt(input.val());
          if (!isNaN(value) && value > 1) input.val(value - 1);
        });
      });
    </script>
  </body>
</html>
