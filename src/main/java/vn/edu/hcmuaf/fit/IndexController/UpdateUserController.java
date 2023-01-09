package vn.edu.hcmuaf.fit.IndexController;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import vn.edu.hcmuaf.fit.beans.SiteUser;
import vn.edu.hcmuaf.fit.services.UserInformationService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.*;
import java.nio.file.Paths;
import java.util.Iterator;
import java.util.List;

@WebServlet(name = "UpdateUserController", value = "/UpdateUserController")
public class UpdateUserController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    /*
     Cập nhật lại thông tin tài khoản - Nguyễn Minh Hiếu - 20130261
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SiteUser user = (SiteUser) request.getSession().getAttribute("user");
        String full_name = request.getParameter("full_name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String phone_number = request.getParameter("phone_number");
        String imgFile = request.getParameter("filename");
        System.out.println(imgFile);
        if (imgFile != null && imgFile.length() > 0) {
            File file = new File(request.getServletContext().getAttribute("TEMPAVATAR_DIR") + File.separator + imgFile);
            FileInputStream fis = new FileInputStream(file);
            File local = new File(request.getServletContext().getAttribute("FILEAVATAR_DIR") + File.separator + imgFile);
            FileOutputStream fos = new FileOutputStream(local);
            byte[] bytes = new byte[1024];
            int read;
            while ((read = fis.read(bytes)) != -1) {
                fos.write(bytes, 0, read);
            }
            fis.close();
            fos.close();
        }
        UserInformationService.getInstance().UpdateUserInfo(user.getId(), full_name, email, address, phone_number, imgFile);
        response.getWriter().println("Cập nhật thông tin tài khoản thành công");
    }
}
