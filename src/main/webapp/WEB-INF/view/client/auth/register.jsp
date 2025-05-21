<%@ page contentType="text/html" pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt" %> <%@ taglib prefix="form"
uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Create User</title>
    <link rel="stylesheet" href="/client/css/auth.css" />
  </head>
  <body>
    <form:form
      class="register-form"
      action="/register"
      method="POST"
      modelAttribute="registerUser"
    >
      <h2>Create User</h2>

      <c:set var="errorPassword">
        <form:errors path="confirmPassword" cssClass="invalid-feedback" />
      </c:set>

      <c:set var="errorEmail">
        <form:errors path="email" cssClass="invalid-feedback" />
      </c:set>
      <c:set var="errorFname">
        <form:errors path="firstName" cssClass="invalid-feedback" />
      </c:set>
      <c:set var="errorLname">
        <form:errors path="lastName" cssClass="invalid-feedback" />
      </c:set>

      <div class="form-group">
        <label for="firstName">FirstName</label>
        <form:input
          path="firstName"
          class="form-control ${not empty errorFname ? 'is-invalid' : ''}"
          placeholder="Enter the first name"
        />
        ${errorFname}
      </div>

      <div class="form-group">
        <label for="lastName">LastName</label>
        <form:input
          path="lastName"
          class="form-control ${not empty errorLname ? 'is-invalid' : ''}"
          placeholder="Enter the last name"
        />
        ${errorLname}
      </div>

      <div class="form-group">
        <label for="email">Email</label>
        <form:input
          path="email"
          class="form-control ${not empty errorEmail ? 'is-invalid' : ''}"
          placeholder="name@example.com"
        />
        ${errorEmail}
      </div>

      <div class="form-group">
        <label for="password">Password</label>
        <form:input
          path="password"
          class="form-control ${not empty errorPassword ? 'is-invalid' : ''}"
          placeholder="Enter the password"
        />

        ${errorPassword}
      </div>

      <div class="form-group">
        <label for="confirmPassword">ConfirmPassword</label>
        <form:password
          path="confirmPassword"
          class="form-control ${not empty errorPassword ? 'is-invalid' : ''}"
          placeholder="ConfirmPassword"
        />
        ${errorPassword}
      </div>

      <div class="btn-wrapper">
        <button class="register-btn" type="submit">Register</button>
      </div>

      <div style="text-align: center; margin-top: 15px">
        <span>Already have an account?</span>
        <a
          href="/login"
          style="color: #007bff; text-decoration: none; font-weight: bold"
          >Login
        </a>
      </div>
    </form:form>
  </body>
</html>
