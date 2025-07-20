<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Sản phẩm | Laptop Shop</title>
  <link href="https://fonts.googleapis.com/css2?family=Open+Sans&family=Raleway:wght@600;800&display=swap" rel="stylesheet" />
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link href="/client/css/style.css" rel="stylesheet" />
  <link href="/client/css/shopcss.css" rel="stylesheet" />

  <style>
    body { background-color: #f5f6fa; }
    .main-container { margin-top: 150px; margin-bottom: 60px; }
    .filter-box {
      background: #fff;
      border-radius: 12px;
      padding: 20px;
      box-shadow: 0 2px 12px rgba(0, 0, 0, 0.05);
    }
    .filter-label {
      font-weight: 500;
      font-size: 14px;
      margin-bottom: 5px;
      color: #333;
    }
    .product-card {
      background: #fff;
      border-radius: 12px;
      box-shadow: 0 2px 12px rgba(0, 0, 0, 0.05);
      transition: all 0.3s ease;
      height: 100%;
      display: flex;
      flex-direction: column;
      min-height: 440px;
      text-align: center;
    }
    .product-card:hover {
      transform: translateY(-4px);
      box-shadow: 0 6px 18px rgba(0, 0, 0, 0.1);
    }
    .product-img {
      width: 100%;
      height: 200px;
      object-fit: cover;
      border-radius: 12px 12px 0 0;
    }
    .product-title {
      font-size: 16px;
      font-weight: 600;
      margin-top: 10px;
      min-height: 48px;
      color: #2c3e50;
    }
    .product-desc {
      font-size: 13px;
      color: #666;
      min-height: 40px;
    }
    .product-price {
      font-size: 16px;
      font-weight: bold;
      color: #e74c3c;
    }
    .btn-cart {
      margin-top: auto;
      transition: 0.3s;
    }
    .btn-cart:hover {
      background-color: #0d6efd;
      color: #fff;
    }
    .pagination {
      display: flex !important;
      justify-content: center;
      flex-wrap: wrap;
      list-style: none;

    }
    .page-link.disabled {
                            color: var(--bs-pagination-disabled-color);
                            pointer-events: none;
                            background-color: var(--bs-pagination-disabled-bg);
                          }
    @media (max-width: 991px) {
      .main-container { margin-top: 40px; }
    }
  </style>
</head>
<body>

<!-- Spinner -->
<div id="spinner" class="show w-100 vh-100 bg-white position-fixed top-50 start-50 translate-middle d-flex align-items-center justify-content-center">
  <div class="spinner-grow text-primary" role="status"></div>
</div>

<!-- Header -->
<jsp:include page="../layout/header.jsp" />

<!-- Main Content -->
<div class="container main-container">
  <div class="row">
    <!-- Bộ lọc -->
<!-- Bộ lọc -->
<!-- Bộ lọc -->
<div class="col-lg-3 mb-4">
  <div class="filter-box">
    <h5 class="fw-bold mb-3 text-uppercase text-primary">BỘ LỌC SẢN PHẨM</h5>
  
    <div class="col-12" id="factoryFilter">
      <div class="mb-2"><b>Hãng sản xuất</b></div>
      <div class="form-check form-check-inline">
          <input class="form-check-input" type="checkbox" id="factory-1"
              value="APPLE">
          <label class="form-check-label" for="factory-1">Apple</label>
      </div>
      <div class="form-check form-check-inline">
          <input class="form-check-input" type="checkbox" id="factory-2"
              value="ASUS">
          <label class="form-check-label" for="factory-2">Asus</label>
      </div>

      <div class="form-check form-check-inline">
          <input class="form-check-input" type="checkbox" id="factory-3"
              value="LENOVO">
          <label class="form-check-label" for="factory-3">Lenovo</label>
      </div>

      <div class="form-check form-check-inline">
          <input class="form-check-input" type="checkbox" id="factory-4"
              value="DELL">
          <label class="form-check-label" for="factory-4">Dell</label>
      </div>
    
      <div class="form-check form-check-inline">
          <input class="form-check-input" type="checkbox" id="factory-6"
              value="ACER">
          <label class="form-check-label" for="factory-6">Acer</label>
      </div>
    </div>

    <div class="col-12" id="priceFilter">
        <div class="mb-2"><b>Mức giá</b></div>

        <div class="form-check form-check-inline">
            <input class="form-check-input" type="checkbox" id="price-2"
                value="duoi-15-tr">
            <label class="form-check-label" for="price-2">Dưới 15 triệu</label>
        </div>

        <div class="form-check form-check-inline">
            <input class="form-check-input" type="checkbox" id="price-3"
                value="15-toi-20-tr">
            <label class="form-check-label" for="price-3">Từ 15 - 20
                triệu</label>
        </div>

        <div class="form-check form-check-inline">
            <input class="form-check-input" type="checkbox" id="price-4"
                value="20-toi-30-tr">
            <label class="form-check-label" for="price-4">Từ 20 - 30
                triệu</label>
        </div>

        <div class="form-check form-check-inline">
            <input class="form-check-input" type="checkbox" id="price-5"
                value="30-toi-50-tr">
            <label class="form-check-label" for="price-5">Từ 30 - 50 triệu</label>
        </div>
        <div class="form-check form-check-inline">
          <input class="form-check-input" type="checkbox" id="price-6"
              value="tren-50-tr">
          <label class="form-check-label" for="price-5">Trên 50 triệu</label>
      </div>
    </div>
    
    <div class="col-12">
        <div class="mb-2"><b>Sắp xếp</b></div>

        <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" id="sort-1"
                value="gia-tang-dan" name="radio-sort">
            <label class="form-check-label" for="sort-1">Giá tăng dần</label>
        </div>

        <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" id="sort-2"
                value="gia-giam-dan" name="radio-sort">
            <label class="form-check-label" for="sort-2">Giá giảm dần</label>
        </div>

        <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" id="sort-3" checked
                value="gia-nothing" name="radio-sort">
            <label class="form-check-label" for="sort-3">Không sắp xếp</label>
        </div>
    </div>

    <!-- Buttons -->
    <div class="d-grid gap-2 mt-3">
      <button class="btn btn-success" id="btnFilter">
        <i class="fas fa-filter me-1"></i> LỌC SẢN PHẨM
      </button>
     
    </div>
  </div>
</div>

    <!-- Danh sách sản phẩm -->
    <div class="col-lg-9">
      <c:if test="${totalPages} == 0">
        <div>Không tìm thấy  sản phẩm</div>
      </c:if>
      <h3 class="mb-4 fw-bold text-primary">TẤT CẢ SẢN PHẨM</h3>
      <div class="row g-4">
        <c:forEach var="product" items="${products}">
          <div class="col-md-6 col-lg-4 d-flex">
            <div class="product-card w-100">
              <img src="/images/product/${product.image}" alt="${product.name}" class="product-img" />
              <div class="p-3">
                <h6 class="product-title">
                  <a href="/product/${product.id}">${product.name}</a>
                </h6>
                <p class="product-desc">${product.shortDesc}</p>
                <p class="product-price">
                  <fmt:formatNumber value="${product.price}" pattern="#,###" /> đ
                </p>
                <form action="/add-product-to-cart/${product.id}" method="post">
                  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                  <button class="btn btn-outline-success w-100 btn-cart" type="submit">
                    <i class="fas fa-shopping-cart me-1"></i> Thêm vào giỏ
                  </button>
                </form>
              </div>
            </div>
          </div>
        </c:forEach>
      </div>

      <!-- Pagination -->
  
         <nav class="mt-5" aria-label="Page navigation">
        <ul class="pagination justify-content-center">
          <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
            <a class="page-link" href="/products?page=${currentPage - 1}${queryString}" aria-label="Previous">
              <span aria-hidden="true">&laquo;</span>
            </a>
          </li>
          <c:forEach begin="0" end="${totalPages - 1}" varStatus="loop">
            <li class="page-item ${loop.index + 1 == currentPage ? 'active' : ''}">
              <a class="page-link" href="/products?page=${loop.index + 1}${queryString}">${loop.index + 1}</a>
            </li>
          </c:forEach>
          <li class="page-item ${currentPage == totalPages ? 'disabled' : ''}">
            <a class="page-link" href="/products?page=${currentPage + 1}${queryString}" aria-label="Next">
              <span aria-hidden="true">&raquo;</span>
            </a>
          </li>
        </ul>
      </nav>
  
      
    </div>
  </div>
</div>

<!-- Footer -->
<jsp:include page="../layout/footer.jsp" />

<a href="#" class="btn btn-primary rounded-circle back-to-top">
  <i class="fa fa-arrow-up"></i>
</a>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="/client/lib/easing/easing.min.js"></script>
<script src="/client/lib/waypoints/waypoints.min.js"></script>
<script src="/client/lib/lightbox/js/lightbox.min.js"></script>
<script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>
<script src="/client/js/main.js"></script>
</body>
</html>
