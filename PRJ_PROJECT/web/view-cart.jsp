<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="dto.OrderDetails"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page import="dao.CartDAO"%> <!-- Import lớp CartDAO -->

<%
    List<OrderDetails> cart = (List<OrderDetails>) session.getAttribute("cart");
    CartDAO cartDAO = new CartDAO();
%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>View Cart</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link href="css/bootstrap-icons.css" rel="stylesheet">
        <link href="css/tooplate-little-fashion.css" rel="stylesheet">
        <style>
            .container {
                margin-top: 50px;
            }
            .btn-order {
                margin-top: 20px;
            }
        </style>
    </head>
    <body>
        <%@ include file="navbar.jsp" %>
        <div class="container" style="margin-bottom: 50px; margin-top: 200px">
            <h1 style="color: rgb(247, 72, 20)">Your Cart</h1>
            <form action="view-cart" method="post">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th></th>
                            <th>Image</th>
                            <th>Name</th>
                            <th>Quantity</th>
                            <th>Price</th>
                            <th>Action</th> <!-- Cột mới cho nút Remove -->
                        </tr>
                    </thead>
                    <tbody>
                        <% if (cart != null && !cart.isEmpty()) {
                                for (OrderDetails order : cart) {
                        %>
                        <tr>
                            <td>
                                <input type="checkbox" name="selectedOrders" value="<%= order.getDetailId()%>">
                            </td>
                            <td><img src="<%= order.getImageUrl()%>" alt="<%= order.getDishname()%>" style="height: 100px;"></td>
                            <td><%= order.getDishname()%></td>
                            <td><%= order.getQuantity()%></td>
                            <td>$<%= order.getPrice()%></td>
                            <td>
                                <form action="view-cart" method="post">
                                    <input type="hidden" name="action" value="remove">
                                    <input type="hidden" name="detailId" value="<%= order.getDetailId()%>">
                                    <button type="submit" class="btn btn-danger btn-sm">Remove</button>
                                </form>
                            </td>
                        </tr>
                        <%      }
                        } else {
                        %>
                        <tr>
                            <td colspan="6">Your cart is empty.</td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
                <button type="submit" style="background: red" class="btn btn-primary btn-order">Order</button>
            </form>
        </div>
        <%@ include file="footer.jsp" %>
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/custom.js"></script>
    </body>
</html>
