package cn.hncu.domain;

public class ShoppingCart {
    private String userid;
    private String goodsid;

    public ShoppingCart() {
    }

    public ShoppingCart(String userid, String goodsid) {
        this.userid = userid;
        this.goodsid = goodsid;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public String getGoodsid() {
        return goodsid;
    }

    public void setGoodsid(String goodsid) {
        this.goodsid = goodsid;
    }
}
