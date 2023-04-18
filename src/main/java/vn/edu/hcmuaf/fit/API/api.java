package vn.edu.hcmuaf.fit.API;

import vn.edu.hcmuaf.fit.services.AccountService;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;

public class api {
    public static final String EMAIL = "20130265@st.hcmuaf.edu.vn";
    public static final String PASSWORD = "20130265";
    private static api api;

    public static api getInstance() {
        if (api == null)
            api = new api();
        return api;
    }

    public String login() throws IOException {
        URL url = new URL("http://140.238.54.136/api/auth/login ");
        HttpURLConnection con = (HttpURLConnection) url.openConnection();
        con.setRequestMethod("POST");
        con.setRequestProperty("Content-Type", "application/json");
        con.setRequestProperty("Accept", "application/json");
        con.setDoOutput(true);
        String jsonInputString =
                "    {"
                        + "      \"email\": \"" + EMAIL + "\","
                        + "      \"password\" : \"" + PASSWORD + "\""
                        + "    }";
        try (OutputStream os = con.getOutputStream()) {
            byte[] input = jsonInputString.getBytes(StandardCharsets.UTF_8);
            os.write(input, 0, input.length);
        }
        StringBuilder response = new StringBuilder();
        try (BufferedReader br = new BufferedReader(
                new InputStreamReader(con.getInputStream(), StandardCharsets.UTF_8))) {
            String responseLine;
            while ((responseLine = br.readLine()) != null) {
                response.append(responseLine.trim());
            }
        }
        return response.toString();
    }

    public static void main(String[] args) throws IOException {
        System.out.println(getInstance().login());
    }

}