package vn.iotstar.config;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import vn.iotstar.entity.Category;

public class Test {

    public static void main(String[] args) {
        EntityManager em = JpaConfig.getEntityManager();
        EntityTransaction trans = em.getTransaction();

        try {
            trans.begin();

            Category cate = new Category();
            cate.setName("Điện thoại thông minh");
            cate.setIcon("dienthoai.png");
            cate.setStatus(1);

            em.persist(cate);

            trans.commit();
            System.out.println(">>> CHÚC MỪNG! ĐÃ TỰ ĐỘNG SINH BẢNG VÀ CHÈN DỮ LIỆU THÀNH CÔNG! <<<");
        } catch (Exception e) {
            e.printStackTrace();
            if (trans.isActive()) {
                trans.rollback();
            }
        } finally {
            em.close();
        }
    }
}
