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
    <title>Update Order - Hỏi Dân IT</title>

    <!-- Tailwind CSS CDN -->
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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
                                    <svg class="w-6 h-6 text-gray-400" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd"></path>
                                    </svg>
                                    <a href="/admin/order" class="ml-1 text-gray-600 hover:text-gray-900">Orders</a>
                                </div>
                            </li>
                            <li>
                                <div class="flex items-center">
                                    <svg class="w-6 h-6 text-gray-400" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd"></path>
                                    </svg>
                                    <span class="ml-1 text-gray-500">Update</span>
                                </div>
                            </li>
                        </ol>
                    </nav>

                    <div class="mt-6">
                        <div class="max-w-3xl mx-auto">
                            <div class="bg-white shadow-lg rounded-lg p-6">
                                <h3 class="text-xl font-semibold text-gray-800">Update Order - ID: ${newOrder.id}</h3>
                                <hr class="my-4" />
                                <form:form method="post" action="/admin/order/update" modelAttribute="newOrder">
                                    <div class="mb-3" style="display: none;">
                                        <label class="form-label">Id:</label>
                                        <form:input type="text" class="form-control" path="id" />
                                    </div>
                                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                                        <div class="mb-3">
                                            <label class="block text-gray-700 font-medium mb-1">Receiver Name:</label>
                                            <form:input type="text" class="w-full p-2 border rounded-lg bg-gray-50" path="receiverName" readonly="true" />
                                        </div>
                                        <div class="mb-3">
                                            <label class="block text-gray-700 font-medium mb-1">Receiver Address:</label>
                                            <form:input type="text" class="w-full p-2 border rounded-lg bg-gray-50" path="receiverAddress" readonly="true" />
                                        </div>
                                        <div class="mb-3">
                                            <label class="block text-gray-700 font-medium mb-1">Receiver Phone:</label>
                                            <form:input type="text" class="w-full p-2 border rounded-lg bg-gray-50" path="receiverPhone" readonly="true" />
                                        </div>
                                        <div class="mb-3">
                                            <label class="block text-gray-700 font-medium mb-1">User Email:</label>
                                            <form:input type="text" class="w-full p-2 border rounded-lg bg-gray-50" path="user.email" readonly="true" />
                                        </div>
                                    </div>
                                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                                        <div class="mb-3">
                                            <label class="block text-gray-700 font-medium mb-1">Total Price:</label>
                                            <input type="text" class="w-full p-2 border rounded-lg bg-gray-50" value="<fmt:formatNumber type='number' value='${newOrder.totalPrice}' groupingUsed='true' /> đ" readonly />
                                        </div>
                                        <div class="mb-3">
                                            <label class="block text-gray-700 font-medium mb-1">Status:</label>
                                            <form:select class="w-full p-2 border rounded-lg" path="status">
                                                <form:option value="PENDING">Pending</form:option>
                                                <form:option value="SHIPPING">Shipping</form:option>
                                                <form:option value="COMPLETE">Complete</form:option>
                                                <form:option value="CANCEL">Cancel</form:option>
                                            </form:select>
                                        </div>
                                    </div>

                                    <div class="flex justify-between mt-6">
                                        <button type="submit" class="px-6 py-2 bg-yellow-500 text-white font-medium rounded-lg hover:bg-yellow-600">Update</button>
                                        <a href="/admin/order" class="px-6 py-2 bg-gray-500 text-white font-medium rounded-lg hover:bg-gray-600">Back</a>
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="/js/scripts.js"></script>
</body>
</html>