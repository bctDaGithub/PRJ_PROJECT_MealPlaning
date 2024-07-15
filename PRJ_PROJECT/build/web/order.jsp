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
    <link href="css/order-style.css" rel="stylesheet"> <!-- CSS riêng cho trang order -->
</head>
<body>
    <%@ include file="navbar.jsp" %>
    <main class="order-main">
        <div class="order-content">
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

