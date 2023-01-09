package vn.edu.hcmuaf.fit.services;

public class main {
    public static void main(String[] args) {
        System.out.println(CategoryService.getInstance().findParentCateFromParentId("cate05"));
    }
}
