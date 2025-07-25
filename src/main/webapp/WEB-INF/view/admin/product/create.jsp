<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@taglib prefix="form"
uri="http://www.springframework.org/tags/form" %>
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
    <title>Create Product</title>
    <link href="/css/styles.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script>
      $(document).ready(() => {
        const avatarFile = $("#avatarFile");
        avatarFile.change(function (e) {
          const imgURL = URL.createObjectURL(e.target.files[0]);
          $("#avatarPreview").attr("src", imgURL);
          $("#avatarPreview").css({ display: "block" });
        });
      });
    </script>
    <script
      src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
      crossorigin="anonymous"
    ></script>
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
            <div class="container mt-5">
              <div class="row">
                <div class="col-12 col-md-8 mx-auto">
                  <h3>Create a Product</h3>
                  <hr />
                  <form:form
                    action="/admin/product/create"
                    method="post"
                    modelAttribute="newProduct"
                    enctype="multipart/form-data"
                  >
                    <!-- Name and Price -->
                    <div class="row">
                      <div class="col-12 col-md-6 mb-3">
                        <c:set var="errorName">
                          <form:errors
                            path="name"
                            cssClass="invalid-feedback"
                          />
                        </c:set>
                        <label class="form-label">Name:</label>
                        <form:input
                          type="text"
                          class="form-control ${not empty errorName ? 'is-invalid' : ''}"
                          path="name"
                        />
                        ${errorName}
                      </div>
                      <div class="col-12 col-md-6 mb-3">
                        <c:set var="errorPrice">
                          <form:errors
                            path="price"
                            cssClass="invalid-feedback"
                          />
                        </c:set>
                        <label class="form-label">Price:</label>
                        <form:input
                          type="number"
                          class="form-control ${not empty errorPrice ? 'is-invalid' : ''}"
                          path="price"
                        />
                        ${errorPrice}
                      </div>
                    </div>

                    <!-- Detail Description and Short Description -->
                    <div class="mb-3">
                      <c:set var="errorDetailDesc">
                        <form:errors
                          path="detailDesc"
                          cssClass="invalid-feedback"
                        />
                      </c:set>
                      <label class="form-label">Detail Description:</label>
                      <form:input
                        type="text"
                        class="form-control ${not empty errorDetailDesc ? 'is-invalid' : ''}"
                        path="detailDesc"
                      />
                      ${errorDetailDesc}
                    </div>

                    <div class="row">
                      <div class="col-12 col-md-6 mb-3">
                        <c:set var="errorShortDesc">
                          <form:errors
                            path="shortDesc"
                            cssClass="invalid-feedback"
                          />
                        </c:set>
                        <label class="form-label">Short Description:</label>
                        <form:input
                          type="text"
                          class="form-control ${not empty errorShortDesc ? 'is-invalid' : ''}"
                          path="shortDesc"
                        />
                        ${errorShortDesc}
                      </div>

                      <!-- Quantity -->
                      <div class="col-12 col-md-6 mb-3">
                        <c:set var="errorQuantity">
                          <form:errors
                            path="quantity"
                            cssClass="invalid-feedback"
                          />
                        </c:set>
                        <label class="form-label">Quantity:</label>
                        <form:input
                          type="number"
                          class="form-control ${not empty errorQuantity ? 'is-invalid' : ''}"
                          path="quantity"
                        />
                        ${errorQuantity}
                      </div>
                    </div>

                    <!-- Factory and Target -->
                    <div class="row">
                      <div class="col-12 col-md-6 mb-3">
                        <label class="form-label">Factory:</label>
                        <form:select class="form-select" path="factory">
                          <form:option value="Apple"
                            >Apple (MacBook)</form:option
                          >
                          <form:option value="ASUS">Asus</form:option>
                          <form:option value="LENOVO">Lenovo</form:option>
                          <form:option value="DELL">Dell</form:option>
                          <form:option value="LEGION">Legion</form:option>
                          <form:option value="MSI">MSI</form:option>
                          <form:option value="ACER">ACER</form:option>
                        </form:select>
                      </div>

                      <div class="col-12 col-md-6 mb-3">
                        <label class="form-label">Target:</label>
                        <form:select class="form-select" path="target">
          
                          <form:option value="Gaming"
                            >Gaming Laptop</form:option
                          >
                          <form:option value="SINHVIEN-VANPHONG"
                            >Sinh viên -Văn phòng</form:option
                          >
                          <form:option value="THIET-KE"
                            >Thiết Kế Đồ Họa</form:option
                          >
                          <form:option value="DOANH-NHAN"
                            >Doanh Nhân</form:option
                          >
                        </form:select>
                      </div>
                    </div>

                    <!-- Image Upload -->
                    <div class="mb-3">
                      <label for="avatarFile" class="form-label">Image:</label>
                      <input
                        class="form-control"
                        type="file"
                        name="namFile"
                        id="avatarFile"
                        accept=".png, .jpg, .jpeg"
                      />
                    </div>
                    <div class="mb-3">
                      <img
                        style="max-height: 250px; display: none"
                        alt="avatar preview"
                        id="avatarPreview"
                      />
                    </div>

                    <!-- Submit Button -->
                    <div class="d-flex justify-content-between">
                      <button type="submit" class="btn btn-primary">
                        Create
                      </button>
                      <a href="/admin/product" class="btn btn-secondary"
                        >Back</a
                      >
                    </div>
                  </form:form>
                </div>
              </div>
            </div>
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
    <script src="js/scripts.js"></script>
  </body>
</html>
