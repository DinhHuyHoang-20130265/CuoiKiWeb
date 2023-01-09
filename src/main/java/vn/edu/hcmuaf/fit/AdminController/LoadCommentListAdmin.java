package vn.edu.hcmuaf.fit.AdminController;

import vn.edu.hcmuaf.fit.beans.news.NewsComment;
import vn.edu.hcmuaf.fit.beans.product.Product;
import vn.edu.hcmuaf.fit.services.NewsCommentService;
import vn.edu.hcmuaf.fit.services.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "LoadCommentListAdmin", value = "/LoadCommentListAdmin")
public class LoadCommentListAdmin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    /*
    Load more danh sách bình luận trong admin - Nguyễn Minh Hiếu 20130261
    */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String page = request.getParameter("page");
        List<NewsComment> loadNewsComment = NewsCommentService.getInstance().getAllCommentByPage(Integer.parseInt(page));
        request.setAttribute("loadNewsComment", loadNewsComment);
        request.getRequestDispatcher("/admin-page/ajax/ajax_LoadCommentListAdmin.jsp").forward(request, response);
    }
}
