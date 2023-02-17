package cn.hncu.test;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DemoTest {
    public static void main(String[] args) throws ParseException {
        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
        System.out.println(date.getTime());
        Date date1 = new Date(date.getTime());
        System.out.println(date1.getTime());
        System.out.println(simpleDateFormat.format(date));
    }
}
