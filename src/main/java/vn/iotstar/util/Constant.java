package vn.iotstar.util;

import java.io.File;

public class Constant {
    public static final String SESSION_USERNAME = "username";
    public static final String COOKIE_REMEMBER = "username";

    // Thư mục lưu trữ hình ảnh upload
    public static final String DIR = "D:/upload";

    static {
        File dir = new File(DIR + "/category");
        if (!dir.exists()) {
            dir.mkdirs();
        }
    }

    public static class Path {
        public static final String LOGIN = "/views/login.jsp";
        public static final String REGISTER = "/views/register.jsp";
        public static final String HOME = "/views/web/home.jsp";
    }
}
