package vn.edu.hcmuaf.fit.FilesManipulation;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.util.ArrayList;

@WebListener
public class FileLocationContextListener implements ServletContextListener, HttpSessionListener, HttpSessionAttributeListener {

    public FileLocationContextListener() {
    }

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        String rootPath = System.getProperty("catalina.home");
        String realRootPath = rootPath.substring(0, rootPath.lastIndexOf("\\"));
        ServletContext ctx = sce.getServletContext();
        String font = ctx.getInitParameter("font.dir");
        String productRelativePath = ctx.getInitParameter("tempproduct.dir");
        String newsRelativePath = ctx.getInitParameter("tempnews.dir");
        String avatarRelativePath = ctx.getInitParameter("tempavatar.dir");
        String slideRelativePath = ctx.getInitParameter("slide.dir");
        String realProductPath = ctx.getInitParameter("saveproduct.dir");
        String realNewsPath = ctx.getInitParameter("savenews.dir");
        String realAvatarPath = ctx.getInitParameter("saveavatar.dir");
        String realSlidePath = ctx.getInitParameter("saveslide.dir");
        File fontPath = new File(rootPath + File.separator + "webapps" + File.separator + font);
        File tempproduct = new File(rootPath + File.separator + "webapps" + File.separator + productRelativePath);
        File tempnews = new File(rootPath + File.separator + "webapps" + File.separator + newsRelativePath);
        File tempavatar = new File(rootPath + File.separator + "webapps" + File.separator + avatarRelativePath);
        File tempslide = new File(rootPath + File.separator + "webapps" + File.separator + slideRelativePath);
        File saveproduct = new File(realRootPath + File.separator + realProductPath);
        File savenews = new File(realRootPath + File.separator + realNewsPath);
        File saveavatar = new File(realRootPath + File.separator + realAvatarPath);
        File saveslide = new File(realRootPath + File.separator + realSlidePath);
        if (!tempproduct.exists())
            tempproduct.mkdirs();
        if (!tempnews.exists())
            tempnews.mkdirs();
        if (!tempavatar.exists())
            tempavatar.mkdirs();
        if (!tempslide.exists())
            tempslide.mkdirs();
        if (!saveproduct.exists())
            saveproduct.mkdirs();
        if (!savenews.exists())
            savenews.mkdirs();
        if (!saveavatar.exists())
            saveavatar.mkdirs();
        if (!saveslide.exists())
            saveslide.mkdirs();
        if (!fontPath.exists())
            fontPath.mkdirs();
        ctx.setAttribute("FILES_DIR_TEMPPRODUCT", tempproduct);
        ctx.setAttribute("FILES_DIR_TEMPNEWS", tempnews);
        ctx.setAttribute("FILES_DIR_TEMPAVATAR", tempavatar);
        ctx.setAttribute("FILES_DIR_TEMPSLIDE", tempslide);
        ctx.setAttribute("FILES_DIR_FILEPRODUCT", saveproduct);
        ctx.setAttribute("FILES_DIR_FILENEWS", savenews);
        ctx.setAttribute("FILES_DIR_FILEAVATAR", saveavatar);
        ctx.setAttribute("FILES_DIR_FILESLIDE", saveslide);
        ctx.setAttribute("FONT_DIR", rootPath + File.separator + "webapps" + File.separator + font);
        ctx.setAttribute("TEMPPRODUCT_DIR", rootPath + File.separator + "webapps" + File.separator + productRelativePath);
        ctx.setAttribute("TEMPNEWS_DIR", rootPath + File.separator + "webapps" + File.separator + newsRelativePath);
        ctx.setAttribute("TEMPAVATAR_DIR", rootPath + File.separator + "webapps" + File.separator + avatarRelativePath);
        ctx.setAttribute("TEMPSLIDE_DIR", rootPath + File.separator + "webapps" + File.separator + slideRelativePath);
        ctx.setAttribute("FILEPRODUCT_DIR", realRootPath + File.separator + realProductPath);
        ctx.setAttribute("FILEPNEWS_DIR", realRootPath + File.separator + realNewsPath);
        ctx.setAttribute("FILEAVATAR_DIR", realRootPath + File.separator + realAvatarPath);
        ctx.setAttribute("FILESLIDE_DIR", realRootPath + File.separator + realSlidePath);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        /* This method is called when the servlet Context is undeployed or Application Server shuts down. */
    }

    @Override
    public void sessionCreated(HttpSessionEvent se) {
        /* Session is created. */
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        /* Session is destroyed. */
    }

    @Override
    public void attributeAdded(HttpSessionBindingEvent sbe) {
        /* This method is called when an attribute is added to a session. */
    }

    @Override
    public void attributeRemoved(HttpSessionBindingEvent sbe) {
        /* This method is called when an attribute is removed from a session. */
    }

    @Override
    public void attributeReplaced(HttpSessionBindingEvent sbe) {
        /* This method is called when an attribute is replaced in a session. */
    }
}
