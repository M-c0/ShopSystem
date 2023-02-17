package cn.hncu.domain;

public class Order {
    private String id;
    private String userId;
    private String goodsId;
    private Double price;
    private String address;
    private String phone;

    public Order() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(String goodsId) {
        this.goodsId = goodsId;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Order(String id, String userId, String goodsId, Double price, String address, String phone) {
        this.id = id;
        this.userId = userId;
        this.goodsId = goodsId;
        this.price = price;
        this.address = address;
        this.phone = phone;
    }

    @Override
    public String toString() {
        return "Order{" +
                "id='" + id + '\'' +
                ", userId='" + userId + '\'' +
                ", goodsId='" + goodsId + '\'' +
                ", price='" + price + '\'' +
                ", address='" + address + '\'' +
                ", phone='" + phone + '\'' +
                '}';
    }
}
