<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="Hỏi Dân IT - Dự án laptopshop" />
    <meta name="author" content="Hỏi Dân IT" />
    <title>Order Detail</title>

    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="/css/styles.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
  </head>

  <body class="bg-gray-100 font-sans">
    <jsp:include page="../layout/header.jsp" />
    <div class="flex">
      <jsp:include page="../layout/sidebar.jsp" />
      <div class="flex-1 p-6">
        <main>
          <div class="container mx-auto">
            <h1 class="text-2xl font-bold text-gray-800 mt-4">Manage Orders</h1>
            <nav class="flex my-4" aria-label="Breadcrumb">
              <ol class="inline-flex items-center space-x-1 md:space-x-2">
                <li class="inline-flex items-center">
                  <a href="/admin" class="text-gray-600 hover:text-gray-900">Dashboard</a>
                </li>
                <li>
                  <div class="flex items-center">
                    <svg class="w-6 h-6 text-gray-400" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd"></path></svg>
                    <a href="/admin/order" class="ml-1 text-gray-600 hover:text-gray-900">Orders</a>
                  </div>
                </li>
                <li>
                  <div class="flex items-center">
                    <svg class="w-6 h-6 text-gray-400" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd"></path></svg>
                    <span class="ml-1 text-gray-500">Order Detail</span>
                  </div>
                </li>
              </ol>
            </nav>

            <div class="mt-6">
              <div class="max-w-2xl mx-auto">
                <div class="bg-white shadow-lg rounded-lg p-6">
                  <h3 class="text-xl font-semibold text-gray-800">Order Detail With ID: ${order.id}</h3>
                  <hr class="my-4" />
                  <div class="grid grid-cols-1 gap-4">
                    <div class="bg-gray-50 p-4 rounded-lg">
                      <h4 class="text-lg font-medium text-gray-700">Order Information</h4>
                      <ul class="mt-2 space-y-2">
                        <li><span class="font-medium">ID:</span> ${order.id}</li>
                        <li><span class="font-medium">Receiver Name:</span> ${order.receiverName}</li>
                        <li><span class="font-medium">Receiver Address:</span> ${order.receiverAddress}</li>
                        <li><span class="font-medium">Receiver Phone:</span> ${order.receiverPhone}</li>
                        <li><span class="font-medium">Status:</span> ${order.status}</li>
                      </ul>
                    </div>
                    <div>
                      <h4 class="text-lg font-medium text-gray-700 mt-4">Order Details</h4>
                      <div class="overflow-x-auto">
                        <table class="min-w-full bg-white border border-gray-200 rounded-lg mt-2">
                          <thead>
                            <tr class="bg-gray-100 border-b">
                              <th class="py-2 px-4 text-left text-gray-600 font-medium">Product Name</th>
                              <th class="py-2 px-4 text-left text-gray-600 font-medium">Price</th>
                              <th class="py-2 px-4 text-left text-gray-600 font-medium">Quantity</th>
                              <th class="py-2 px-4 text-left text-gray-600 font-medium">Total</th>
                            </tr>
                          </thead>
                          <tbody>
                            <c:forEach var="orderDetail" items="${orderDetails}">
                              <tr class="border-b hover:bg-gray-50">
                                <td class="py-2 px-4">${orderDetail.product.name}</td>
                                <td class="py-2 px-4">
                                  <fmt:formatNumber value="${orderDetail.price}" type="number" groupingUsed="true" />
                                </td>
                                <td class="py-2 px-4">${orderDetail.quantity}</td>
                                <td class="py-2 px-4">
                                  <fmt:formatNumber value="${orderDetail.price * orderDetail.quantity}" type="number" groupingUsed="true" />
                                </td>
                              </tr>
                            </c:forEach>
                          </tbody>
                        </table>
                      </div>
                    </div>
                  </div>
                  <div class="text-center mt-6">
                    <a href="/admin/order" class="inline-block px-6 py-2 bg-green-600 text-white font-medium rounded-lg hover:bg-green-700">Back</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </main>
        <jsp:include page="../layout/footer.jsp" />
      </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="/js/scripts.js"></script>
  </body>
</html>