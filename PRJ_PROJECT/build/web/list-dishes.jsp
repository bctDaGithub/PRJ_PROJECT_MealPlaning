<%-- 
    Document   : list-dishes
    Created on : Jul 15, 2024, 9:45:30 PM
    Author     : Cong Tuong
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="dto.Dishes"%>
<%@page import="dao.DishDAO"%>
<%
    // Fetch the list of dishes from the database
    DishDAO dishDAO = new DishDAO();
    List<Dishes> dishesList = dishDAO.getAllDishes();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Foods</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100;300;400;700;900&display=swap" rel="stylesheet">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/bootstrap-icons.css" rel="stylesheet">
        <link rel="stylesheet" href="css/slick.css"/>
        <link href="css/tooplate-little-fashion.css" rel="stylesheet">
        <style>
            .card {
                display: flex;
                flex-direction: column;
                height: 100%;
            }
            .card-img-top {
                object-fit: cover;
                height: 200px; /* Adjust this height as needed */
            }
            .card-body {
                flex: 1;
                display: flex;
                flex-direction: column;
            }
            .card-body .btn {
                margin-top: auto;
            }
        </style>
    </head>
    <body>
        <%@ include file="navbar.jsp" %>
        <main>
            <div class="container mt-5">
                <div class="row">
                    <% for(Dishes dish : dishesList) { %>
                    <div class="col-lg-4 col-md-6 col-sm-12 mb-4 d-flex">
                        <div class="card w-100">
                            <img src="<%= dish.getImagePath() %>" class="card-img-top" alt="<%= dish.getName() %>">
                            <div class="card-body">
                                <h5 class="card-title"><%= dish.getName() %></h5>
                                <p class="card-text"><%= dish.getDescription() %></p>
                                <p class="card-text">Calories: <%= dish.getCalories() %></p>
                                <p class="card-text">Price: $<%= dish.getEstimatedPrice() %></p>
                                <a href="order.jsp?dishId=<%= dish.getId() %>" class="btn btn-primary">View & Order</a>
                            </div>
                        </div>
                    </div>
                    <% } %>
                </div>
            </div>
        </main>
        <%@ include file="footer.jsp" %>
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/custom.js"></script>
    </body>
</html>