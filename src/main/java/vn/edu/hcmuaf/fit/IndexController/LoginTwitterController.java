package vn.edu.hcmuaf.fit.IndexController;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Properties;

import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.conf.ConfigurationBuilder;
import twitter4j.auth.RequestToken;

@WebServlet(name = "LoginTwitterController", value = "/login-twitter")
public class LoginTwitterController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ConfigurationBuilder cb = new ConfigurationBuilder();

        Properties props = new Properties();
//        props.setProperty("twitterConsumerKey", )
        cb.setDebugEnabled(true)
                .setOAuthConsumerKey((String) props.get("twitterConsumerKey"))
                .setOAuthConsumerSecret((String) props.get("twitterConsumerSecret"))
                .setOAuthRequestTokenURL((String) props.get("twitterRequestTokenURL"))
                .setOAuthAuthorizationURL((String) props.get("twitterAuthorizeURL"))
                .setOAuthAccessTokenURL((String) props.get("twitterAccessTokenURL"));
        TwitterFactory tf = new TwitterFactory(cb.build());
        Twitter twitter = tf.getInstance();
        request.getSession().setAttribute("twitter", twitter);
        try {
            StringBuffer callbackURL = request.getRequestURL();
            System.out.println("TwitterLoginServlet:callbackURL:" + callbackURL);
            int index = callbackURL.lastIndexOf("/");
            callbackURL.replace(index, callbackURL.length(), "").append("/twitter-callback");

            RequestToken requestToken = twitter.getOAuthRequestToken(callbackURL.toString());
            request.getSession().setAttribute("requestToken", requestToken);
            System.out.println("requestToken.getAuthenticationURL():" + requestToken.getAuthenticationURL());
            response.sendRedirect(requestToken.getAuthenticationURL());

        } catch (TwitterException e) {
            throw new ServletException(e);
        }
    }
}
