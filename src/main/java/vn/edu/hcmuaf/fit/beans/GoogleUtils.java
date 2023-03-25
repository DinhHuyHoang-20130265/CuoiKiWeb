package vn.edu.hcmuaf.fit.beans;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import org.apache.hc.client5.http.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;

import java.io.IOException;
import java.nio.charset.Charset;

public class GoogleUtils {
    public static String getToken(final String code) throws ClientProtocolException, IOException {
        String response = Request.Post(Constants.GOOGLE_LINK_GET_TOKEN).bodyForm(Form.form().add("client_id", Constants.GOOGLE_CLIENT_ID).add("client_secret", Constants.GOOGLE_CLIENT_SECRET).add("redirect_uri", Constants.GOOGLE_REDIRECT_URI).add("code", code).add("grant_type", Constants.GOOGLE_GRANT_TYPE).build()).execute().returnContent().asString();
        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }

    public static GooglePojo getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = Constants.GOOGLE_LINK_GET_USER_INFO1 + accessToken;
        String response = Request.Get(link).execute().returnContent().asString(Charset.forName("UTF-8"));
        GooglePojo googlePojo = new Gson().fromJson(response, GooglePojo.class);
        return googlePojo;
    }
}
