package cn.hncu.domain;

public class Goods {
    private String id;
    private String name;
    private double price;
    private String type;
    private String imgPath;

    public Goods() {
    }

    public Goods(String id, String name, double price, String type, String imgPath) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.type = type;
        this.imgPath = imgPath;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getImgPath() {
        return imgPath;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }

    @Override
    public String toString() {
        return "Goods{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", type='" + type + '\'' +
                ", imgPath='" + imgPath + '\'' +
                '}';
    }
}
