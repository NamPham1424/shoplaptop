<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="Hỏi Dân IT - Dự án laptopshop" />
  <meta name="author" content="Hỏi Dân IT" />
  <title>Dashboard</title>
  <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
  <link href="css/styles.css" rel="stylesheet" />
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.3.0/css/all.css" />
  <style>
    .card-enhanced {
      border-radius: 16px;
      box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
      transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .card-enhanced:hover {
      transform: translateY(-5px);
      box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
    }

    .card-body i {
      float: right;
      font-size: 1.5rem;
      opacity: 0.7;
    }

    .card-footer a {
      color: #fff;
      text-decoration: none;
      font-weight: 500;
    }

    .card-footer a:hover {
      text-decoration: underline;
    }
  </style>
</head>

<body class="sb-nav-fixed">
  <jsp:include page="../layout/header.jsp" />
  <div id="layoutSidenav">
    <jsp:include page="../layout/sidebar.jsp" />
    <div id="layoutSidenav_content">
      <main>
        <div class="container-fluid px-4">
          <h1 class="mt-4">Dashboard</h1>
          <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item active">Thống Kê</li>
          </ol>

          <div class="row">
            <div class="col-xl-4 col-md-6">
              <div class="card bg-primary text-white mb-4 card-enhanced">
                <div class="card-body">
                 Só Lượng User (${countUsers})
                  <i class="fas fa-box"></i>
                </div>
                <div class="card-footer d-flex align-items-center justify-content-between">
                  <a class="small text-white stretched-link" href="/admin/user">Xem chi tiết</a>
                  <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                </div>
              </div>
            </div>

            <div class="col-xl-4 col-md-6">
              <div class="card bg-warning text-white mb-4 card-enhanced">
                <div class="card-body">
                  Số Lượng Product (${countProducts})
                  <i class="fas fa-spinner"></i>
                </div>
                <div class="card-footer d-flex align-items-center justify-content-between">
                  <a class="small text-white stretched-link" href="/admin/product">Xem chi tiết</a>
                  <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                </div>
              </div>
            </div>

            <div class="col-xl-4 col-md-6">
              <div class="card bg-success text-white mb-4 card-enhanced">
                <div class="card-body">
                 Số Lượng Order  (${countOrders})
                  <i class="fas fa-check-circle"></i>
                </div>
                <div class="card-footer d-flex align-items-center justify-content-between">
                  <a class="small text-white stretched-link" href="/admin/order">Xem chi tiết</a>
                  <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                </div>
              </div>
            </div>

            <!-- <div class="col-xl-4 col-md-6">
              <div class="card bg-danger text-white mb-4 card-enhanced">
                <div class="card-body">
                  Đơn bị huỷ
                  <i class="fas fa-times-circle"></i>
                </div>
                <div class="card-footer d-flex align-items-center justify-content-between">
                  <a class="small text-white stretched-link" href="#">Xem chi tiết</a>
                  <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                </div>
              </div>
            </div> -->
          </div>

        </div>
      </main>
      <jsp:include page="../layout/footer.jsp" />
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
  <script src="js/scripts.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
  <script src="js/chart-area-demo.js"></script>
  <script src="js/chart-bar-demo.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
  <script src="js/datatables-simple-demo.js"></script>
</body>
</html>
