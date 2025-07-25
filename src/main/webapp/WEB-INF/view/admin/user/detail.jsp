<%@page contentType="text/html" pageEncoding="UTF-8"%> <%@taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@ taglib prefix="form"
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
    <title>Dashboard</title>
    <link href="/css/styles.css" rel="stylesheet" />
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
            <h1 class="mt-4 text-top">Manage User</h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
              <li class="breadcrumb-item active">Users</li>
            </ol>

            <div class="container mt-5">
              <div class="row justify-content-center">
                <div class="col-md-8 col-12">
                  <div class="d-flex justify-content-between">
                    <!-- <h3>User Detail With ID: ${id}</h3> -->
                  </div>
                  <hr />
                  <div class="card mx-auto" style="width: 60%">
                    <div class="card-header text-center">User Information</div>
                    <ul class="list-group list-group-flush">
                      <li class="list-group-item">ID: ${id}</li>
                      <li class="list-group-item">Email: ${user.email}</li>
                      <li class="list-group-item">
                        FullName: ${user.fullname}
                      </li>
                      <li class="list-group-item">Phone: ${user.phone}</li>
                      <li class="list-group-item">Address: ${user.address}</li>
                      <li class="list-group-item">Avatar:</li>
                    </ul>
                    <div class="card-body text-center">
                      <img
                        class="card-img-top d-block mx-auto"
                        src="/images/avatar/${user.avatar}"
                        alt="Avatar"
                      />
                    </div>

                    <div class="card-footer text-center">
                      <a href="/admin/user" class="btn btn-success">Back</a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </main>
        <jsp:include page="../layout/footer.jsp" />
      </div>
    </div>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      crossorigin="anonymous"
    ></script>
    <script src="js/scripts.js"></script>
  </body>
</html>
