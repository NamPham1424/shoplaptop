<%@ page contentType="text/html" pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %> <%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Shopping Cart | Laptop Shop</title>

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

    <style>
      body {
        font-family: "Inter", sans-serif;
        background-color: #f8f9fa;
      }
      .cart-table img {
        width: 80px;
        border-radius: 8px;
      }
      .cart-summary {
        background-color: #fff;
        border-radius: 12px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.05);
      }
      .cart-summary h3 {
        border-bottom: 1px solid #dee2e6;
        padding-bottom: 1rem;
      }
      input[type="number"]::-webkit-outer-spin-button,
      input[type="number"]::-webkit-inner-spin-button {
        -webkit-appearance: none;
        margin: 0;
      }
      input[type="number"] {
        -moz-appearance: textfield;
      }
      .input-group .btn {
        border-color: #fd7e14;
        color: #fd7e14;
      }
      .input-group .btn:hover {
        background-color: #fd7e14;
        color: white;
      }
      .cart-details-form .form-group {
        margin-bottom: 1rem;
      }
      .cart-details-form label {
        font-weight: 500;
        margin-bottom: 0.5rem;
      }
      .cart-details-form .form-control {
        border-radius: 8px;
        border: 1px solid #dee2e6;
        padding: 0.5rem;
      }
    </style>
  </head>
  <body>
    <jsp:include page="../layout/header.jsp" />

    <main class="container py-5">
      <h2 class="mb-4 fw-bold">Your Shopping Cart</h2>

      <!-- Cart Table -->
      <div class="table-responsive bg-white rounded shadow-sm">
        <table class="table cart-table align-middle">
          <thead class="table-light text-uppercase">
            <tr>
              <th scope="col">Product</th>
              <th scope="col">Price</th>
              <th scope="col">Quantity</th>
              <th scope="col">Total</th>
              <th scope="col">Remove</th>
            </tr>
          </thead>
          <tbody>
            <c:if test="${empty cartDetails}">
              <tr>
                <td colspan="5" class="text-center">
                  Your shopping cart is empty.
                </td>
              </tr>
            </c:if>
            <c:forEach
              var="cartDetail"
              items="${cartDetails}"
              varStatus="status"
            >
              <tr>
                <td class="d-flex align-items-center gap-3">
                  <img
                    src="/images/product/${cartDetail.product.image}"
                    alt="${cartDetail.product.name}"
                  />
                  <div>
                    <p class="fw-semibold mb-1">${cartDetail.product.name}</p>
                    <small class="text-muted"
                      >${cartDetail.product.shortDesc}</small
                    >
                  </div>
                </td>
                <td class="price" data-price="${cartDetail.price}">
                  <fmt:formatNumber
                    type="number"
                    value="${cartDetail.price}"
                    pattern="#,###"
                  />
                  đ
                </td>
                <td>
                  <div class="input-group quantity mt-4" style="width: 120px">
                    <div class="input-group-btn">
                      <button
                        class="btn btn-sm btn-minus rounded-circle bg-light border"
                      >
                        <i class="fa fa-minus"></i>
                      </button>
                    </div>
                    <input
                      type="number"
                      class="form-control form-control-sm text-center border-0"
                      value="${cartDetail.quantity}"
                      data-cart-detail-id="${cartDetail.id}"
                      data-cart-detail-price="${cartDetail.price}"
                      data-cart-detail-index="${status.index}"
                      min="1"
                    />
                    <div class="input-group-btn">
                      <button
                        class="btn btn-sm btn-plus rounded-circle bg-light border"
                      >
                        <i class="fa fa-plus"></i>
                      </button>
                    </div>
                  </div>
                </td>
                <td>
                  <p data-cart-detail-id="${cartDetail.id}">
                    <fmt:formatNumber
                      type="number"
                      value="${cartDetail.price * cartDetail.quantity}"
                      pattern="#,###"
                    />
                    đ
                  </p>
                </td>
                <td>
                  <form
                    method="post"
                    action="/delete-cart-product/${cartDetail.id}"
                  >
                    <input
                      type="hidden"
                      name="${_csrf.parameterName}"
                      value="${_csrf.token}"
                    />
                    <button class="btn btn-link text-danger" type="submit">
                      <i class="fa fa-trash"></i>
                    </button>
                  </form>
                </td>
              </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>

      <!-- Summary -->
<div class="row mt-5 align-items-start">
  <div class="col-md-6">
    <a href="/" class="btn btn-outline-primary">← Continue Shopping</a>
  </div>
  <c:if test="${not empty cartDetails}">
    <div class="col-md-6">
      <div class="cart-summary p-4">
        <h3 class="fs-5 fw-bold">Order Summary</h3>
        <div class="d-flex justify-content-between mb-2">
          <span>Subtotal:</span>
          <p data-cart-total-price="${totalPrice}">
            <fmt:formatNumber
              type="number"
              value="${totalPrice}"
              pattern="#,###"
            />
            đ
          </p>
        </div>
        <div class="d-flex justify-content-between mb-2">
          <span>Shipping:</span>
          <span>Free</span>
        </div>
        <div class="d-flex justify-content-between fw-bold fs-5 mb-3">
          <span>Total:</span>
          <p data-cart-total-price="${totalPrice}">
            <fmt:formatNumber
              type="number"
              value="${totalPrice}"
              pattern="#,###"
            />
            đ
          </p>
        </div>

        <!-- Checkout Form -->
        <form:form
          action="/confirm-checkout"
          method="post"
          modelAttribute="cart"
          class="cart-details-form"
        >
          <input
            type="hidden"
            name="${_csrf.parameterName}"
            value="${_csrf.token}"
          />
          <div style="display: none;">
            <c:forEach
              var="cartDetail"
              items="${cart.cartDetails}"
              varStatus="status"
            >
              <div class="mb-3">
                <div class="form-group">
                  <label>Id:</label>
                  <form:input
                    class="form-control"
                    type="text"
                    value="${cartDetail.id}"
                    path="cartDetails[${status.index}].id"
                  />
                </div>
                <div class="form-group">
                  <label>Quantity:</label>
                  <form:input
                    class="form-control"
                    type="text"
                    value="${cartDetail.quantity}"
                    path="cartDetails[${status.index}].quantity"
                  />
                </div>
              </div>
            </c:forEach>
          </div>
          <button class="btn btn-primary w-100" type="submit">
            Proceed to Checkout
          </button>
        </form:form>
      </div>
    </div>
  </c:if>
</div>
      </div>
    </main>

    <jsp:include page="../layout/footer.jsp" />

    <!-- JavaScript Libraries -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/client/lib/easing/easing.min.js"></script>
    <script src="/client/lib/waypoints/waypoints.min.js"></script>
    <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
    <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="/client/js/main.js"></script>
  </body>
</html>
