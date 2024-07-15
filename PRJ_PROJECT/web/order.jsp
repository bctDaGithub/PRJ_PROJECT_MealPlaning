<%-- 
    Document   : order.jsp
    Created on : Jul 15, 2024, 11:54:00 PM
    Author     : Cong Tuong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dto.Dishes"%>
<%@page import="dao.DishDAO"%>
<%
    String dishIdParam = request.getParameter("dishId");
    if (dishIdParam != null) {
        int dishId = Integer.parseInt(dishIdParam);
        DishDAO dishDAO = new DishDAO();
        Dishes dish = dishDAO.getDishById(dishId);
        if (dish != null) {
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title><%= dish.getName() %> - Order</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-icons.css" rel="stylesheet">
    <link href="css/tooplate-little-fashion.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif; /* Kiểu font chữ */
            background-color: #f8f9fa; /* Màu nền trang */
            margin-top: 56px; /* Khoảng cách với navbar */
            margin-bottom: 56px; /* Khoảng cách với footer */
        }
        .container {
            max-width: 800px; /* Chiều rộng tối đa của phần chi tiết món ăn */
            margin: auto;
            padding: 20px;
            background-color: #ffffff; /* Màu nền cho phần chi tiết món ăn */
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0,0,0,0.1); /* Đổ bóng cho phần chi tiết */
            overflow: hidden; /* Ngăn chặn tràn nội dung */
        }
        .dish-image {
            float: left; /* Đẩy hình ảnh sang trái */
            width: 200px; /* Kích thước cố định cho hình ảnh */
            height: auto;
            margin-right: 20px; /* Khoảng cách với nội dung */
            border-radius: 8px; /* Đường viền cong cho hình ảnh */
        }
        .dish-info {
            overflow: hidden; /* Ngăn chặn tràn nội dung */
        }
        .order-form {
            margin-top: 20px;
        }
        .form-group {
            margin-bottom: 10px; /* Khoảng cách giữa các ô nhập */
        }
        #quantity {
            width: 60px; /* Độ rộng thu nhỏ của ô quantity */
        }
        .btn-order {
            background-color: #dc3545; /* Màu đỏ cho nút Order */
            border-color: #dc3545; /* Đường viền màu đỏ */
            color: #ffffff; /* Màu chữ trắng */
        }
        footer {
            position: fixed;
            bottom: 0;
            width: 100%;
            background-color: #343a40; /* Màu nền footer */
            color: #ffffff; /* Màu chữ footer */
            text-align: center;
            padding: 10px 0;
        }
    </style>
</head>
<body>
    <%@ include file="navbar.jsp" %>
    <main>
        <div class="container mt-5">
            <div class="dish-details">
                <img src="<%= dish.getImagePath() %>" alt="<%= dish.getName() %>" class="dish-image">
                <div class="dish-info">
                    <h1><%= dish.getName() %></h1>
                    <p><%= dish.getDescription() %></p>
                    <p>Calories: <%= dish.getCalories() %></p>
                    <p>Price: $<%= dish.getEstimatedPrice() %></p>
                </div>
            </div>
            <div class="order-form">
                <form action="place-order.jsp" method="post">
                    <input type="hidden" name="dishId" value="<%= dish.getId() %>">
                    <div class="form-group">
                        <label for="quantity">Quantity:</label>
                        <input type="number" id="quantity" name="quantity" class="form-control" min="1" value="1" required>
                    </div>
                    <button type="submit" class="btn btn-order">Place Order</button>
                </form>
            </div>
        </div>
    </main>
    <%@ include file="footer.jsp" %>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/custom.js"></script>
</body>
</html>





<%
        } else {
            // Handle dish not found
            out.println("<h1>Dish not found!</h1>");
        }
    } else {
        // Handle invalid dishId
        out.println("<h1>Invalid Dish ID!</h1>");
    }
%>

