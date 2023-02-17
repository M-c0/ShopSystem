package cn.hncu.dao;

import cn.hncu.domain.Order;
import cn.hncu.domain.ShoppingCart;

import java.util.ArrayList;

public interface ShoppingCartDao {
    public void addShoppingCart(String username, String goodsid);
    public ArrayList queryShopingCart(String username);
    public void deleteShoppingCart(String username, String goodsid);
}
