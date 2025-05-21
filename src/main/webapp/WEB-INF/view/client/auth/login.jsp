<%@ page contentType="text/html" pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %> <%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="/client/css/auth.css" />
    <title>Login</title>
  </head>
  <body>
    <form class="login-form" action="/login" method="post">
      <h2>Login</h2>
      <br />
      

      <div class="form-group">
        <label for="email">Email</label>
        <input
          cssClass="form-control"
          name="username"
          placeholder="Enter the  email"
        />
      </div>

      <div class="form-group">
        <label for="password">Password</label>
        <input
          name="password"
          cssClass="form-control"
          placeholder="Enter the password"
        />
      </div>

      <div>
        <input
          type="hidden"
          name="${_csrf.parameterName}"
          value="${_csrf.token}"
        />
      </div>
      <c:if test="${param.error != null}">
        <div class="my-2" style="color: red">Invalid email or password.</div>
      </c:if>
    <c:if test="${param.logout != null}">
    <div class="my-2" style="
        color: #28a745; 
        font-weight: bold;
        font-family: 'Arial', sans-serif;
        font-size: 1.1rem;
        background-color: #e6ffed; 
        padding: 10px 15px;
        border-radius: 8px;
        display: inline-block;
        ">
      Logout success.
    </div>
</c:if>



      <div class="btn-wrapper">
        <button class="login-btn" type="submit">Login</button>
      </div>

      <div style="text-align: center; margin-top: 15px">
        <span>Don't have an account?</span>
        <a
          href="/register"
          style="color: #007bff; text-decoration: none; font-weight: bold"
          >Register
        </a>
      </div>
    </form>
  </body>
</html>
