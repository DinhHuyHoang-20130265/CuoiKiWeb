package vn.edu.hcmuaf.fit.AdminController;

import vn.edu.hcmuaf.fit.beans.AdminUser;
import vn.edu.hcmuaf.fit.services.NewsService;
import vn.edu.hcmuaf.fit.services.SlideService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Arrays;

@WebServlet(name = "EditInsertNewsController", value = "/EditInsertNewsController")
public class EditInsertNewsController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String content = request.getParameter("content");
        String nameFile = request.getParameter("nameFile");
        String oldImg = request.getParameter("oldImg");
        AdminUser admin = (AdminUser) request.getSession().getAttribute("userAdmin");
        String userID = admin.getId();
        String fullnameFile = "http://localhost:8080/CuoiKiWeb_war/assets/imgNews/news/" + nameFile;
        if (id == null || id.length() < 1) {
            NewsService.getInstance().InsertNewNews(title,description,content,fullnameFile,userID);
            removeOldImg(oldImg, request);
            copyImage(request, nameFile);
        } else {
            NewsService.getInstance().UpdateNews(id,title,description,content,fullnameFile,userID);
            removeOldImg(oldImg, request);
            copyImage(request, nameFile);
        }
    }
    private void removeOldImg(String oldImg, HttpServletRequest request) {
        if (oldImg.length() > 0) {
            String[] splited = oldImg.split(",");
            System.out.println(Arrays.toString(splited));
            for (String split : splited) {
                File fileInServer = new File(request.getServletContext().getAttribute("TEMPNEWS_DIR") + File.separator + split);
                if (fileInServer.exists())
                    fileInServer.delete();
                File fileInLocal = new File(request.getServletContext().getAttribute("FILEPNEWS_DIR") + File.separator + split);
                if (fileInLocal.exists())
                    fileInLocal.delete();
            }
        }
    }

    public void copyImage(HttpServletRequest request, String imgFile) throws IOException {
        if (imgFile != null) {
            File file = new File(request.getServletContext().getAttribute("TEMPNEWS_DIR") + File.separator + imgFile);
            FileInputStream fis = new FileInputStream(file);
            File local = new File(request.getServletContext().getAttribute("FILEPNEWS_DIR") + File.separator + imgFile);
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
