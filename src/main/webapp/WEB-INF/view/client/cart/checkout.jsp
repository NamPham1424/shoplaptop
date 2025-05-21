<%@ page contentType="text/html" pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Checkout | Laptop Shop</title>
    <!-- Google Fonts & Icons -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
    />
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
    <!-- Bootstrap & Custom CSS -->
    <link href="/client/css/bootstrap.min.css" rel="stylesheet" />
    <link href="/client/css/style.css" rel="stylesheet" />
    <link href="/client/css/shopcss.css" rel="stylesheet" />
    <style>
      body {
        background-color: #f8f9fa;
        font-family: "Open Sans", sans-serif;
      }
      .checkout-form {
        background-color: #fff;
        border-radius: 12px;
        padding: 2rem;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.05);
      }
      .form-label {
        font-weight: 600;
      }
      .order-summary {
        background-color: #fff;
        border-radius: 12px;
        padding: 2rem;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.05);
      }
      .order-summary h4 {
        border-bottom: 1px solid #ddd;
        padding-bottom: 1rem;
        margin-bottom: 1.5rem;
      }
      .btn-back-to-cart {
        margin-top: 20px;
      }
    </style>
  </head>
  <body>
    <jsp:include page="../layout/header.jsp" />
    <main class="container py-5">
      <h2 class="mb-4 fw-bold">Checkout</h2>
      <form action="/place-order" method="post">
        <input
          type="hidden"
          name="${_csrf.parameterName}"
          value="${_csrf.token}"
        />
        <div class="row gy-4">
          <!-- Billing Details -->
          <div class="col-lg-7">
            <div class="checkout-form">
              <h4 class="mb-4">Thông tin thanh toán</h4>
              <div class="mb-3">
                <label class="form-label">Họ và tên</label>
                <input
                  type="text"
                  class="form-control"
                  name="receiverName"
                  required
                />
              </div>
              <div class="mb-3">
                <label class="form-label">Số điện thoại</label>
                <input
                  type="tel"
                  class="form-control"
                  name="receiverPhone"
                  required
                />
              </div>
              <div class="mb-3">
                <label class="form-label">Địa chỉ giao hàng</label>
                <textarea
                  class="form-control"
                  name="receiverAddress"
                  rows="3"
                  required
                ></textarea>
              </div>
              <div class="mb-3">
                <label class="form-label">Phương thức thanh toán</label>
                <div class="form-check">
                  <input
                    class="form-check-input"
                    type="radio"
                    name="paymentMethod"
                    id="cod"
                    value="COD"
                    checked
                  />
                  <label class="form-check-label" for="cod"
                    >Thanh toán khi nhận hàng (COD)</label
                  >
                </div>
              </div>
              <a
                href="/cart"
                class="btn btn-outline-secondary text-start btn-back-to-cart"
              >
                <i class="bi bi-arrow-left me-2"></i>Quay lại giỏ hàng
              </a>
            </div>
          </div>
          <!-- Order Summary -->
          <div class="col-lg-5">
            <div class="order-summary">
              <h4 class="fw-bold">Tóm tắt đơn hàng</h4>
              <ul class="list-group mb-3">
                <c:forEach var="item" items="${cartDetails}">
                  <li
                    class="list-group-item d-flex justify-content-between align-items-center"
                  >
                    <span>${item.product.name} x ${item.quantity}</span>
                    <span
                      ><fmt:formatNumber
                        type="number"
                        value="${item.price * item.quantity}"
                      />đ</span
                    >
                  </li>
                </c:forEach>
              </ul>
              <div class="d-flex justify-content-between mb-2">
                <strong>Tạm tính:</strong>
                <strong
                  ><fmt:formatNumber
                    type="number"
                    value="${totalPrice}"
                  />đ</strong
                >
              </div>
              <div class="d-flex justify-content-between mb-2">
                <span>Phí vận chuyển:</span>
                <span>Miễn phí</span>
              </div>
              <div
                class="d-flex justify-content-between fs-5 fw-bold mt-3 mb-4"
              >
                <span>Tổng cộng:</span>
                <span
                  ><fmt:formatNumber
                    type="number"
                    value="${totalPrice}"
                  />đ</span
                >
              </div>
              <button type="submit" class="btn btn-primary w-100">
                Đặt hàng
              </button>
            </div>
          </div>
        </div>
      </form>
    </main>
    <jsp:include page="../layout/footer.jsp" />
    <!-- JS Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/client/lib/jquery/jquery.min.js"></script>
    <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
    <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="/client/js/main.js"></script>
  </body>
</html>
