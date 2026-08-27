package vn.iotstar.service.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import vn.iotstar.dao.CategoryDao;
import vn.iotstar.dao.impl.CategoryDaoImpl;
import vn.iotstar.model.Category;
import vn.iotstar.service.CategoryService;
import vn.iotstar.util.Constant;

public class CategoryServiceImpl implements CategoryService {
    private CategoryDao categoryDao = new CategoryDaoImpl();

    // Mock cache dự phòng
    private static final List<Category> mockList = new ArrayList<>();
    static {
        mockList.add(new Category(1, "Thời trang Nam", null));
        mockList.add(new Category(2, "Thời trang Nữ", null));
        mockList.add(new Category(3, "Điện tử & Thiết bị số", null));
    }

    @Override
    public void insert(Category category) {
        try {
            categoryDao.insert(category);
        } catch (Exception ignored) {}
        category.setId(mockList.size() + 1);
        mockList.add(category);
    }

    @Override
    public void edit(Category newCategory) {
        Category oldCategory = this.get(newCategory.getId());
        if (oldCategory != null) {
            oldCategory.setName(newCategory.getName());
            if (newCategory.getIcon() != null) {
                // Xóa file ảnh cũ nếu có
                String fileName = oldCategory.getIcon();
                if (fileName != null) {
                    File file = new File(Constant.DIR + "/" + fileName);
                    if (file.exists()) {
                        file.delete();
                    }
                }
                oldCategory.setIcon(newCategory.getIcon());
            }
            try {
                categoryDao.edit(oldCategory);
            } catch (Exception ignored) {}
        }
    }

    @Override
    public void delete(int id) {
        try {
            categoryDao.delete(id);
        } catch (Exception ignored) {}
        mockList.removeIf(c -> c.getId() == id);
    }

    @Override
    public Category get(int id) {
        Category c = null;
        try {
            c = categoryDao.get(id);
        } catch (Exception ignored) {}
        if (c == null) {
            for (Category cat : mockList) {
                if (cat.getId() == id) return cat;
            }
        }
        return c;
    }

    @Override
    public Category get(String name) {
        Category c = null;
        try {
            c = categoryDao.get(name);
        } catch (Exception ignored) {}
        if (c == null) {
            for (Category cat : mockList) {
                if (cat.getName().equalsIgnoreCase(name)) return cat;
            }
        }
        return c;
    }

    @Override
    public List<Category> getAll() {
        List<Category> list = null;
        try {
            list = categoryDao.getAll();
        } catch (Exception ignored) {}
        if (list == null || list.isEmpty()) {
            return new ArrayList<>(mockList);
        }
        return list;
    }

    @Override
    public List<Category> search(String keyword) {
        List<Category> list = null;
        try {
            list = categoryDao.search(keyword);
        } catch (Exception ignored) {}
        if (list == null || list.isEmpty()) {
            List<Category> res = new ArrayList<>();
            for (Category c : mockList) {
                if (c.getName().toLowerCase().contains(keyword.toLowerCase())) res.add(c);
            }
            return res;
        }
        return list;
    }
}
