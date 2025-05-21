<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>

<nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
  <!-- Navbar Brand-->
  <a class="navbar-brand ps-3" href="/admin">Laptopshop</a>
  <!-- Sidebar Toggle-->
  <button
    class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
    id="sidebarToggle"
    href="#!"
  >
    <i class="fas fa-bars"></i>
  </button>
  <!-- Navbar Search-->
  <form
    class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0"
  >
    <span style="color: white">Welcome, NamPham</span>

  </form>
  <!-- Navbar-->
  <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
    <li class="nav-item dropdown">
      <a
        class="nav-link dropdown-toggle"
        id="navbarDropdown"
        href="#"
        role="button"
        data-bs-toggle="dropdown"
        aria-expanded="false"
        ><i class="fas fa-user fa-fw"></i
      ></a>
      <ul
        class="dropdown-menu dropdown-menu-end"
        aria-labelledby="navbarDropdown"
      >
      <li class="text-center mb-3">
                <img
                  src="/images/product/1711078092373-asus-01.png"
                  alt="User Avatar"
                  class="rounded-circle border mb-2"
                  style="width: 80px; height: 80px; object-fit: cover"
                />
                <h6 class="fw-bold mb-0">Hỏi Dân IT</h6>
                <small class="text-muted">admin@example.com</small>
              </li>
              
          <hr class="dropdown-divider" />
        </li>
        <form method="post" action="/logout">
          <input
            type="hidden"
            name="${_csrf.parameterName}"
            value="${_csrf.token}"
          />
          <button
            class="dropdown-item d-flex align-items-center gap-2 text-danger fw-semibold py-2"
          >
            <i class="fa fa-sign-out-alt"></i> <span>Logout</span>
          </button>
        </form>
      </ul>
    </li>
  </ul>
</nav>
