/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dto.OrderDetails;
import dto.Order;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import mylib.DButil;

/**
 *
 * @author Cong Tuong
 */
public class OrdersDAO implements DAOInterface<Order> {

    ArrayList<Order> data = new ArrayList<>();
    
    public ArrayList<Order> getAllOrders (int status){
        ArrayList<Order> list=new ArrayList<>();
        Connection cn=null;
        try {
            //b1tao ket noi
            cn=DButil.makeConnection();
            if(cn!=null){
                //b2:viet query va exec query
                String query = "SELECT * FROM Orders WHERE status = ?";
                PreparedStatement pst = cn.prepareStatement(query);
                pst.setInt(1, status);
                ResultSet rs = pst.executeQuery();
                
                // Bước 3: Duyệt qua kết quả và tạo đối tượng Order
                while (rs.next()) {
                    int orderId = rs.getInt("orderId");
                    Date orderDate = rs.getDate("orderDate");
                    String orderStatus = rs.getString("status");
                    int total = rs.getInt("total");
                    int userId = rs.getInt("userId");

                    // Tạo đối tượng Order và thêm vào danh sách
                    Order order = new Order(orderId, orderDate, orderStatus, total, userId);
                    list.add(order);
                }
                rs.close();
                pst.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            try {
                if(cn!=null) cn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        return list;
    }
    
    public int insertOrder(Order order) {
        Connection cn = null;
        int orderId = -1;
        try {
            // Bước 1: Tạo kết nối
            cn = DButil.makeConnection();
            if (cn != null) {
                // Bước 2: Viết và thực thi truy vấn
                String query = "INSERT INTO Orders (orderDate, status, total, userId) VALUES (?, ?, ?, ?)";
                PreparedStatement pst = cn.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
                pst.setDate(1, new java.sql.Date(order.getOrderDate().getTime()));
                pst.setString(2, order.getStatus());
                pst.setDouble(3, order.getTotal());
                pst.setInt(4, order.getUserId());
                
                // Thực thi truy vấn
                pst.executeUpdate();
                
                // Lấy orderId được sinh tự động
                ResultSet generatedKeys = pst.getGeneratedKeys();
                if (generatedKeys.next()) {
                    orderId = generatedKeys.getInt(1);
                }
                
                // Đóng PreparedStatement
                pst.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (cn != null) cn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        return orderId;
    }
    
    public boolean insertOrderDetails(OrderDetails orderDetails) {
        Connection cn = null;
        boolean success = false;
        try {
            // Bước 1: Tạo kết nối
            cn = DButil.makeConnection();
            if (cn != null) {
                // Bước 2: Viết và thực thi truy vấn
                String query = "INSERT INTO OrderDetails (dishId, orderId, quantity) VALUES (?, ?, ?)";
                PreparedStatement pst = cn.prepareStatement(query);
                pst.setInt(1, orderDetails.getDishId());
                pst.setInt(2, orderDetails.getOrderId());
                pst.setInt(3, orderDetails.getQuantity());
                
                // Thực thi truy vấn
                int rowsAffected = pst.executeUpdate();
                
                // Kiểm tra xem có insert thành công hay không
                if (rowsAffected > 0) {
                    success = true;
                }
                
                // Đóng PreparedStatement
                pst.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (cn != null) cn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        return success;
    }


    @Override
    public ArrayList<Order> selectAll() {
        return this.data;
    }

    @Override
    public Order selectById(Order t) {
        for (Order orders : data) {
            if (data.equals(t)) {
                return orders;
            }
        }
        return null;
    }

    @Override
    public int insert(Order t) {
        if (this.selectById(t) == null) {
            this.data.add(t);
            return 1;
        }
        return 0;
    }

    @Override
    public int insertAll(ArrayList<Order> arr) {
        for (Order orders : arr) {
            this.insert(orders);
        }
        return 0;
    }

    @Override
    public int delete(Order t) {
        if (selectById(t) != null) {
            this.data.remove(t);
            return 1;
        }
        return 0;
    }

    @Override
    public int deleteAll(ArrayList<Order> arr) {
        for (Order orders : arr) {
            this.delete(orders);
        }
        return 0;
    }

    @Override
    public int update(Order t) {
        if (selectById(t) != null) {
            this.data.remove(t);
            this.data.add(t);
            return 1;
        }
        return 0;
    }

}
