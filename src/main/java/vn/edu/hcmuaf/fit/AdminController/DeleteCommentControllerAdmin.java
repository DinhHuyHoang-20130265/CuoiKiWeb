package vn.edu.hcmuaf.fit.AdminController;

import vn.edu.hcmuaf.fit.beans.news.NewsComment;
import vn.edu.hcmuaf.fit.beans.product.Product;
import vn.edu.hcmuaf.fit.services.NewsCommentService;
import vn.edu.hcmuaf.fit.services.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import javax.xml.stream.events.Comment;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "DeleteCommentControllerAdmin", value = "/DeleteCommentControllerAdmin")
public class DeleteCommentControllerAdmin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        int page = Integer.parseInt(request.getParameter("page"));
        NewsCommentService.getInstance().RemoveComment(id);
        List<NewsComment> list = NewsCommentService.getInstance().getAllCommentByPage(page);
        request.setAttribute("loadNewsComment", list);
        request.getRequestDispatcher("/admin-page/ajax/ajax_LoadCommentListAdmin.jsp").forward(request, response);
    }
}
