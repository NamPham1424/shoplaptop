<%@ page contentType="text/html" pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Shop Laptop</title>

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
    <!-- Footer Start -->
    <div class="container-fluid bg-dark text-white-50 footer pt-5 mt-5">
      <div class="container py-5">
        <div
          class="pb-4 mb-4"
          style="border-bottom: 1px solid rgba(226, 175, 24, 0.5)"
        >
          <div class="row g-4">
            <div class="col-lg-3">
              <a href="/">
                <h1 class="text-primary mb-0">LaptopStore</h1>
                <p class="text-secondary mb-0">Best Deals on Laptops</p>
              </a>
            </div>
            <div class="col-lg-6">
              <div class="position-relative mx-auto">
                <input
                  class="form-control border-0 w-100 py-3 px-4 rounded-pill"
                  type="email"
                  placeholder="Your Email"
                />
                <button
                  type="submit"
                  class="btn btn-primary border-0 border-secondary py-3 px-4 position-absolute rounded-pill text-white"
                  style="top: 0; right: 0"
                >
                  Subscribe Now
                </button>
              </div>
            </div>
            <div class="col-lg-3">
              <div class="d-flex justify-content-end pt-3">
                <a
                  class="btn btn-outline-secondary me-2 btn-md-square rounded-circle"
                  href=""
                  ><i class="fab fa-twitter"></i
                ></a>
                <a
                  class="btn btn-outline-secondary me-2 btn-md-square rounded-circle"
                  href=""
                  ><i class="fab fa-facebook-f"></i
                ></a>
                <a
                  class="btn btn-outline-secondary me-2 btn-md-square rounded-circle"
                  href=""
                  ><i class="fab fa-youtube"></i
                ></a>
                <a
                  class="btn btn-outline-secondary btn-md-square rounded-circle"
                  href=""
                  ><i class="fab fa-linkedin-in"></i
                ></a>
              </div>
            </div>
          </div>
        </div>
        <div class="row g-5">
          <div class="col-lg-3 col-md-6">
            <h4 class="text-light mb-3">Why Shop With Us?</h4>
            <p class="mb-4">
              We offer the best deals on top-quality laptops, ensuring high
              performance and reliability.
            </p>
            <a
              href=""
              class="btn border-secondary py-2 px-4 rounded-pill text-primary"
              >Read More</a
            >
          </div>
          <div class="col-lg-3 col-md-6">
            <h4 class="text-light mb-3">Shop Info</h4>
            <a class="btn-link" href="">About Us</a>
            <a class="btn-link" href="">Contact Us</a>
            <a class="btn-link" href="">Privacy Policy</a>
            <a class="btn-link" href="">Terms & Conditions</a>
            <a class="btn-link" href="">Return Policy</a>
            <a class="btn-link" href="">FAQs & Help</a>
          </div>
          <div class="col-lg-3 col-md-6">
            <h4 class="text-light mb-3">Account</h4>
            <a class="btn-link" href="">My Account</a>
            <a class="btn-link" href="">Order History</a>
            <a class="btn-link" href="">Shopping Cart</a>
            <a class="btn-link" href="">Wishlist</a>
            <a class="btn-link" href="">Checkout</a>
          </div>
          <div class="col-lg-3 col-md-6">
            <h4 class="text-light mb-3">Contact</h4>
            <p>Address: Đại Học FPT</p>
            <p>Email: nampham2662@gmail.com</p>
            <p>Phone: +884868202662</p>
            <p>Payment Methods</p>
            <img src="/client/img/payment.png" class="img-fluid" alt="" />
          </div>
        </div>
      </div>
    </div>
    <!-- Footer End -->
  </body>
</html>
