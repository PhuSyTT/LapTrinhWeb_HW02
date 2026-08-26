package vn.iotstar.service;

import vn.iotstar.model.User;

public interface UserService {
    // Chức năng đăng nhập (Ví dụ 1)
    User login(String username, String password);
    User get(String username);

    // Chức năng đăng ký (Ví dụ 2)
    void insert(User user);
    boolean register(String username, String password, String email, String fullname, String phone);
    boolean checkExistEmail(String email);
    boolean checkExistUsername(String username);
    boolean checkExistPhone(String phone);
}
