/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dto.OrderDetails;
import java.util.List;

/**
 *
 * @author Cong Tuong
 */
public class CartDAO {

    public void addItemToCart(OrderDetails order, List<OrderDetails> cart) {
        cart.add(order);
    }

    public void removeItemFromCart(int detailId, List<OrderDetails> cart) {
        for (OrderDetails order : cart) {
            if (order.getDetailId() == detailId) {
                cart.remove(order);
                break;
            }
        }
    }
}
