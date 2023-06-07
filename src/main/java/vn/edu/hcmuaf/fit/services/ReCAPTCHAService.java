package vn.edu.hcmuaf.fit.services;

import vn.edu.hcmuaf.fit.beans.ReCAPTCHAConfiguration;

import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

public class ReCAPTCHAService {

    private static ReCAPTCHAService reCAPTCHA;

    public static ReCAPTCHAService getInstance() {

        if (reCAPTCHA == null) {
            reCAPTCHA = new ReCAPTCHAService();
        }
        return reCAPTCHA;
    }

    public boolean verify(String input) throws IOException {
        if (input == null || "".equals(input)) {
            return false;
        }
        try {
            URL verifyUrl = new URL(ReCAPTCHAConfiguration.SITE_VERIFY_URL);

            HttpURLConnection conn = (HttpURLConnection) verifyUrl.openConnection();

            conn.setRequestMethod("POST");
            conn.setRequestProperty("User-Agent", "Mozilla/5.0");
            conn.setRequestProperty("Accept-Language", "en_US,en;q=0.5");

            String postParams = "secret=" + ReCAPTCHAConfiguration.SECRET_KEY + "&response=" + input;

            conn.setDoOutput(true);

            OutputStream outStream = conn.getOutputStream();
            outStream.write(postParams.getBytes());

            outStream.flush();
            outStream.close();

            int responseCode = conn.getResponseCode();
            System.out.println("ResponseCode: " + responseCode);

            InputStream is = conn.getInputStream();

            JsonReader jsonReader = Json.createReader(is);
            JsonObject jsonObject = jsonReader.readObject();
            jsonReader.close();
            return jsonObject.getBoolean("success");
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

}
