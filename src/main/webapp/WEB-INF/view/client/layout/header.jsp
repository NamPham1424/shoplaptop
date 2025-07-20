<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap" rel="stylesheet">

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">
<!-- Custom Style -->
<style>
  body {
    font-family: 'Inter', sans-serif;
  }

  .nav-link,
  .dropdown-item {
    transition: color 0.3s ease, background-color 0.3s ease;
  }

  .nav-link:hover,
  .dropdown-item:hover {
    color: #0d6efd !important;
    background-color: #f8f9fa;
  }

  .dropdown-menu {
    border-radius: 15px;
    animation: fadeIn 0.3s ease-in-out;
  }

  @keyframes fadeIn {
    from {
      opacity: 0;
      transform: translateY(10px);
    }
    to {
      opacity: 1;
      transform: translateY(0);
    }
  }

  .dropdown-menu .dropdown-item {
    border-radius: 10px;
  }
</style>

<!-- Navbar Start -->
<div class="container-fluid fixed-top bg-white shadow-sm">
  <div class="container px-0">
    <nav class="navbar navbar-expand-xl navbar-light py-3">
      <!-- Logo -->
      <a href="/" class="navbar-brand d-flex align-items-center gap-2">
        <i class="fa-solid fa-laptop-code fa-2x text-primary"></i>
        <span class="fs-3 fw-bold text-dark">LapTopStore</span>
      </a>

      <!-- Toggle Button -->
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
        <span class="fa fa-bars text-primary"></span>
      </button>

      <!-- Main Nav -->
      <div class="collapse navbar-collapse" id="navbarCollapse">
        <ul class="navbar-nav mx-auto mb-2 mb-lg-0 gap-3">
          <li class="nav-item">
            <a class="nav-link text-uppercase fw-semibold text-dark" href="/">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link text-uppercase fw-semibold text-dark" href="/products">Shop</a>
          </li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle text-uppercase fw-semibold text-dark" href="#" role="button" data-bs-toggle="dropdown">
              Pages
            </a>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="blog.html">Blogs</a></li>
            </ul>
          </li>
          <li class="nav-item">
            <a class="nav-link text-uppercase fw-semibold text-dark" href="contact.html">Contact</a>
          </li>
        </ul>

        <!-- Right Icons -->
        <div class="d-flex align-items-center gap-4 ms-auto">
           <c:if
        test="${not empty pageContext.request.userPrincipal}">
      
  

          <!-- Cart -->
          <a href="/cart" class="text-dark position-relative">
            <i class="fa fa-shopping-bag fa-lg"></i>
            <span class="badge bg-danger position-absolute top-0 start-100 translate-middle rounded-circle" id="sumCart">
             ${sessionScope.sum}
            </span>
          </a>

          <!-- User Dropdown -->
          <div class="dropdown">
            <a href="#" class="d-flex align-items-center" data-bs-toggle="dropdown">
              <img
                src="/images/avatar/${sessionScope.avatar}"
                alt="User Avatar"
                class="rounded-circle"
                style="width: 40px; height: 40px; object-fit: cover"
              />
            </a>
            <ul class="dropdown-menu dropdown-menu-end border-0 shadow p-3 mt-2" style="min-width: 280px;">
              <!-- Avatar + Name -->
              <li class="text-center mb-3">
                <img
                  src="/images/avatar/${sessionScope.avatar}"
                  alt="User Avatar"
                  class="rounded-circle border mb-2"
                  style="width: 80px; height: 80px; object-fit: cover"
                />
                <h6 class="fw-bold mb-0">
                  <c:out value="${sessionScope.fullname}" />
                </h6>
                <small class="text-muted">admin@example.com</small>
              </li>

              <li><hr class="dropdown-divider" /></li>

              <!-- Options -->
              <li>
                <a class="dropdown-item d-flex align-items-center gap-2 py-2" href="#">
                  <i class="fa fa-user text-primary"></i> <span>Profile</span>
                </a>
              </li>
              <li>
                <a class="dropdown-item d-flex align-items-center gap-2 py-2" href="/order-history">
                  <i class="fa fa-box text-success"></i> <span>Purchase History</span>
                </a>
              </li>

              <li><hr class="dropdown-divider" /></li>

              <!-- Logout -->
              <li>
                <form method="post" action="/logout">
                  <input
          type="hidden"
          name="${_csrf.parameterName}"
          value="${_csrf.token}"
        />
                   <button class="dropdown-item d-flex align-items-center gap-2 text-danger fw-semibold py-2" >
                  <i class="fa fa-sign-out-alt"></i> <span>Logout</span>
                </button>
                </form>
               
              </li>

            </ul>
          </div>
        </div>
            </c:if>
            <c:if test="${empty pageContext.request.userPrincipal }">
            <a href="/login" class="a-login text-dark position-relative">
            Login
           </a>
            </c:if>
      </div>
    </nav>
  </div>
</div>
<!-- Navbar End -->

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
