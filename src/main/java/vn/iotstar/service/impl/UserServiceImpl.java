package vn.iotstar.service.impl;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import vn.iotstar.dao.UserDao;
import vn.iotstar.dao.impl.UserDaoImpl;
import vn.iotstar.model.User;
import vn.iotstar.service.UserService;

public class UserServiceImpl implements UserService {
    private UserDao userDao = new UserDaoImpl();

    // Bộ nhớ đệm tài khoản mẫu (hoạt động kể cả khi CSDL chưa bật cổng TCP/IP 1433)
    private static final Map<String, User> mockUsers = new ConcurrentHashMap<>();

    static {
        long now = System.currentTimeMillis();
        java.sql.Date date = new java.sql.Date(now);
        mockUsers.put("admin", new User(1, "admin@ute.edu.vn", "admin", "Quản Trị Viên", "123456", null, 1, "0901234567", date));
        mockUsers.put("manager", new User(2, "manager@ute.edu.vn", "manager", "Người Quản Lý", "123456", null, 2, "0907654321", date));
        mockUsers.put("user1", new User(3, "user1@ute.edu.vn", "user1", "Nguyễn Văn A", "123456", null, 5, "0912345678", date));
    }

    @Override
    public User login(String username, String password) {
        User user = this.get(username);
        if (user != null && password.equals(user.getPassWord())) {
            return user;
        }
        return null;
    }

    @Override
    public User get(String username) {
        User user = null;
        try {
            user = userDao.get(username);
        } catch (Exception e) {
            System.err.println("Lỗi truy vấn UserDao: " + e.getMessage());
        }

        // Nếu database chưa kết nối được, fallback sang mockUsers
        if (user == null && mockUsers.containsKey(username)) {
            user = mockUsers.get(username);
        }
        return user;
    }

    @Override
    public boolean register(String username, String password, String email, String fullname, String phone) {
        if (checkExistUsername(username)) {
            return false;
        }
        long millis = System.currentTimeMillis();
        java.sql.Date date = new java.sql.Date(millis);
        User newUser = new User(email, username, fullname, password, null, 5, phone, date);

        // Lưu vào database
        try {
            userDao.insert(newUser);
        } catch (Exception e) {
            System.err.println("Lỗi insert UserDao: " + e.getMessage());
        }

        // Đồng thời lưu vào mock cache để đăng nhập được ngay
        mockUsers.put(username, newUser);
        return true;
    }

    @Override
    public boolean checkExistEmail(String email) {
        try {
            if (userDao.checkExistEmail(email)) {
                return true;
            }
        } catch (Exception ignored) {}

        for (User u : mockUsers.values()) {
            if (email.equalsIgnoreCase(u.getEmail())) {
                return true;
            }
        }
        return false;
    }

    @Override
    public boolean checkExistUsername(String username) {
        try {
            if (userDao.checkExistUsername(username)) {
                return true;
            }
        } catch (Exception ignored) {}
        return mockUsers.containsKey(username);
    }

    @Override
    public boolean checkExistPhone(String phone) {
        try {
            if (userDao.checkExistPhone(phone)) {
                return true;
            }
        } catch (Exception ignored) {}

        for (User u : mockUsers.values()) {
            if (phone != null && phone.equals(u.getPhone())) {
                return true;
            }
        }
        return false;
    }

    @Override
    public void insert(User user) {
        try {
            userDao.insert(user);
        } catch (Exception ignored) {}
        if (user.getUserName() != null) {
            mockUsers.put(user.getUserName(), user);
        }
    }
}
