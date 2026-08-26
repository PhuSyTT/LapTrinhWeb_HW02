package vn.iotstar.dao;

import vn.iotstar.model.User;

public interface UserDao {
    // Phương thức cho chức năng đăng nhập (Ví dụ 1)
    User get(String username);

    // Các phương thức cho chức năng đăng ký (Ví dụ 2)
    void insert(User user);
    boolean checkExistEmail(String email);
    boolean checkExistUsername(String username);
    boolean checkExistPhone(String phone);
}
