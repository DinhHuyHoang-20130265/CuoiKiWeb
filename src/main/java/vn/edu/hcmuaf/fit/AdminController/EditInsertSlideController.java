package vn.edu.hcmuaf.fit.AdminController;

import vn.edu.hcmuaf.fit.beans.AdminUser;
import vn.edu.hcmuaf.fit.services.LogService;
import vn.edu.hcmuaf.fit.services.ProductService;
import vn.edu.hcmuaf.fit.services.SlideService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Arrays;

@WebServlet(name = "EditInsertSlideController", value = "/EditInsertSlideController")
public class EditInsertSlideController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    /*
       Thêm/sửa slide trong admin - Nguyễn Huy Hiệp 20130258
    */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        int status = Integer.parseInt(request.getParameter("status"));
        String content = request.getParameter("content");
        String oldImg = request.getParameter("oldImg");
        String nameFile = request.getParameter("nameFile");
        AdminUser admin_user = (AdminUser) request.getSession().getAttribute("userAdmin");
        String admin = admin_user.getId();
        String fullnameFile = "http://localhost:8080/CuoiKiWeb_war/assets/img/logo/" + nameFile;
        if (id == null || id.length() < 1) {
            SlideService.getInstance().InsertNewSlide(content, fullnameFile, status);
            removeOldImg(oldImg, request);
            copyImage(request, nameFile);
            LogService.getInstance().addNewLog(admin, "slide", "admin", "Admin " + admin + " đã thêm slide mới : " + id);
        } else {
            SlideService.getInstance().UpdateSlide(id, content, fullnameFile, status);
            removeOldImg(oldImg, request);
            copyImage(request, nameFile);
            LogService.getInstance().addNewLog(admin, "slide", "admin", "Admin " + admin + " đã chỉnh sửa slide : " + id);
        }
    }

    private void removeOldImg(String oldImg, HttpServletRequest request) {
        if (oldImg.length() > 0) {
            String[] splited = oldImg.split(",");
            System.out.println(Arrays.toString(splited));
            for (String split : splited) {
                File fileInServer = new File(request.getServletContext().getAttribute("TEMPAVATAR_DIR") + File.separator + split);
                if (fileInServer.exists())
                    fileInServer.delete();
                File fileInLocal = new File(request.getServletContext().getAttribute("FILEAVATAR_DIR") + File.separator + split);
                if (fileInLocal.exists())
                    fileInLocal.delete();
            }
        }
    }

    public void copyImage(HttpServletRequest request, String imgFile) throws IOException {
        if (imgFile != null) {
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
    }
}
