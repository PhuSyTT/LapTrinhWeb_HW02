package vn.iotstar.connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    private final String serverName = "localhost";
    private final String dbName = "ShoppingDB";
    private final String portNumber = "1433";
    private final String userID = "sa";
    private final String password = "123";

    public Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            // 1. Thử kết nối bằng Windows Authentication (Integrated Security)
            try {
                String urlIntegrated = "jdbc:sqlserver://" + serverName + ";databaseName=" + dbName 
                        + ";integratedSecurity=true;trustServerCertificate=true;";
                conn = DriverManager.getConnection(urlIntegrated);
                if (conn != null) {
                    return conn;
                }
            } catch (Exception ex) {
                // Tiếp tục thử kết nối bằng tài khoản sa nếu Integrated Security yêu cầu dll
            }

            // 2. Thử kết nối bằng SQL Server Authentication (sa)
            String urlSql = "jdbc:sqlserver://" + serverName + ":" + portNumber + ";databaseName=" + dbName 
                    + ";user=" + userID + ";password=" + password + ";trustServerCertificate=true;";
            conn = DriverManager.getConnection(urlSql);
        } catch (Exception e) {
            System.err.println("Lỗi kết nối cơ sở dữ liệu: " + e.getMessage());
            e.printStackTrace();
        }
        return conn;
    }

    public static void main(String[] args) {
        try {
            DBConnection db = new DBConnection();
            Connection conn = db.getConnection();
            if (conn != null) {
                System.out.println("Kết nối Database thành công!");
                conn.close();
            } else {
                System.out.println("Kết nối Database thất bại!");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
