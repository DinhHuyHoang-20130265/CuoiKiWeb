package vn.edu.hcmuaf.fit.APIController;


import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import vn.edu.hcmuaf.fit.beans.Transport;
import vn.edu.hcmuaf.fit.beans.TransportWrap;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

public class api {
    public static final String EMAIL = "20130265@st.hcmuaf.edu.vn";
    public static final String PASSWORD = "20130265";
    public static final String Province_id = "202";
    public static final String District_id = "3695";
    public static final String Ward_id = "90737";
    private static api api;

    public static api getInstance() {
        if (api == null)
            api = new api();
        return api;
    }

    public String login() throws IOException {
        URL url = new URL("http://140.238.54.136/api/auth/login");
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

    public String Province(String access_token) throws IOException {
        String urlString = "http://140.238.54.136/api/province?token=" + access_token;
        URL url = new URL(urlString);
        HttpURLConnection con = (HttpURLConnection) url.openConnection();
        con.setRequestMethod("GET");
        con.setRequestProperty("Content-Type", "application/json");
        con.setRequestProperty("Accept", "application/json");
        con.setDoOutput(true);
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

    public String District(String accessToken, String provinceCode) throws IOException {
        String urlString = "http://140.238.54.136/api/district?token=" + accessToken + "&provinceID=" + provinceCode;
        URL url = new URL(urlString);
        HttpURLConnection con = (HttpURLConnection) url.openConnection();
        con.setRequestMethod("GET");
        con.setRequestProperty("Content-Type", "application/json");
        con.setRequestProperty("Accept", "application/json");
        con.setDoOutput(true);
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

    public String Ward(String accessToken, String districtCode) throws IOException {
        String urlString = "http://140.238.54.136/api/ward?token=" + accessToken + "&districtID=" + districtCode;
        URL url = new URL(urlString);
        HttpURLConnection con = (HttpURLConnection) url.openConnection();
        con.setRequestMethod("GET");
        con.setRequestProperty("Content-Type", "application/json");
        con.setRequestProperty("Accept", "application/json");
        con.setDoOutput(true);
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

    public String fee(String token, String to_district_id, String to_ward_id) throws IOException {
        URL url = new URL("http://140.238.54.136/api/calculateFee");
        HttpURLConnection con = (HttpURLConnection) url.openConnection();
        con.setRequestMethod("POST");
        con.setRequestProperty("Content-Type", "application/json");
        con.setRequestProperty("Accept", "application/json");
        con.setDoOutput(true);
        String jsonInputString =
                "    {\n" +
                        "  \"token\": \"" + token + "\",\n" +
                        "  \"from_district_id\":\"" + District_id + "\",\n" +
                        "  \"from_ward_id\":\"" + Ward_id + "\",\n" +
                        "  \"to_district_id\":\"" + to_district_id + "\",\n" +
                        "  \"to_ward_id\":\"" + to_ward_id + "\",\n" +
                        "  \"height\":\"100\",\n" +
                        "  \"length\":\"100\",\n" +
                        "  \"width\":\"100\",\n" +
                        "  \"weight\":\"100\"\n" +
                        "}";
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

    public String time(String token, String to_district_id, String to_ward_id) throws IOException {
        URL url = new URL("http://140.238.54.136/api/leadTime");
        HttpURLConnection con = (HttpURLConnection) url.openConnection();
        con.setRequestMethod("POST");
        con.setRequestProperty("Content-Type", "application/json");
        con.setRequestProperty("Accept", "application/json");
        con.setDoOutput(true);
        String jsonInputString =
                "    {\n" +
                        "  \"token\": \"" + token + "\",\n" +
                        "  \"from_district_id\":\"" + District_id + "\",\n" +
                        "  \"from_ward_id\":\"" + Ward_id + "\",\n" +
                        "  \"to_district_id\":\"" + to_district_id + "\",\n" +
                        "  \"to_ward_id\":\"" + to_ward_id + "\",\n" +
                        "  \"height\":\"100\",\n" +
                        "  \"length\":\"100\",\n" +
                        "  \"width\":\"100\",\n" +
                        "  \"weight\":\"100\"\n" +
                        "}";
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

    public Transport registerTransport(String token, String to_district_id, String to_ward_id) throws IOException {
        HttpClient client = HttpClientBuilder.create().build();
        String url = "http://140.238.54.136/api/registerTransport";
        HttpPost request = new HttpPost(url);
        request.setHeader("Authorization", "Bearer " + token);
        List<NameValuePair> params = new ArrayList<>();
        params.add(new BasicNameValuePair("from_district_id", District_id));
        params.add(new BasicNameValuePair("from_ward_id", Ward_id));
        params.add(new BasicNameValuePair("to_district_id", to_district_id));
        params.add(new BasicNameValuePair("to_ward_id", to_ward_id));
        params.add(new BasicNameValuePair("height", "100"));
        params.add(new BasicNameValuePair("length", "100"));
        params.add(new BasicNameValuePair("width", "100"));
        params.add(new BasicNameValuePair("weight", "100"));
        request.setEntity(new UrlEncodedFormEntity(params));
        HttpResponse response = client.execute(request);
        String jsonResponse = EntityUtils.toString(response.getEntity());
        ObjectMapper objectMapper = new ObjectMapper();
        TransportWrap transportWrap = objectMapper.readValue(jsonResponse, TransportWrap.class);
        return transportWrap.getTransport();
    }

    public String allTransports(String token) throws IOException {
        String urlString = "http://140.238.54.136/api/allTransports?token=" + token;
        URL url = new URL(urlString);
        HttpURLConnection con = (HttpURLConnection) url.openConnection();
        con.setRequestMethod("GET");
        con.setRequestProperty("Content-Type", "application/json");
        con.setRequestProperty("Accept", "application/json");
        con.setDoOutput(true);
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
        System.out.println(getInstance().time("eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTQwLjIzOC41NC4xMzYvYXBpL2F1dGgvbG9naW4iLCJpYXQiOjE2ODMxMjE1OTcsImV4cCI6MTY4MzEyMjE5NywibmJmIjoxNjgzMTIxNTk3LCJqdGkiOiIwN0VCNlZMWDFYTGhEVmd1Iiwic3ViIjoiNTFiYzUwZmMwNDJjNDBlOTkxMzdiYjc0NDQ5M2U2MjMiLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.EdJyceux_y5IiWSCEiDG7gSGzEeOSJ7meYHA7rO5cqk", "2270", "231013"));
    }
}
