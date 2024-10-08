package com.kh.usTwo.gemini.model.dao;

import org.springframework.stereotype.Repository;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

@Repository
public class GeminiDao {
    private static final String API_KEY = "AIzaSyBpZ1NaMkkfmSIOHcMPs74kzGDAcnNHz6Q";
    private static final String MODEL_NAME = "gemini-pro";

    public String callGemini(String prompt) throws Exception {
        String urlString = "https://generativelanguage.googleapis.com/v1beta/models/" + MODEL_NAME + ":generateContent?key=" + API_KEY;
        URL url = new URL(urlString);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Content-Type", "application/json");
        conn.setDoOutput(true);

        // Create JSON request body
        JSONObject requestBody = createRequestBody(prompt);

        // Send the request
        try (OutputStream os = conn.getOutputStream()) {
            byte[] input = requestBody.toJSONString().getBytes("utf-8");
            os.write(input, 0, input.length);
        }

        int responseCode = conn.getResponseCode();
        if (responseCode == 200) {
            return getResponse(conn);
        } else {
            handleErrorResponse(conn, responseCode);
            return null;
        }
    }

    private JSONObject createRequestBody(String prompt) {
        JSONObject requestBody = new JSONObject();
        JSONArray contents = new JSONArray();
        JSONObject part = new JSONObject();
        part.put("text", prompt);
        JSONArray parts = new JSONArray();
        parts.add(part);

        JSONObject content = new JSONObject();
        content.put("parts", parts);
        contents.add(content);
        requestBody.put("contents", contents);
        return requestBody;
    }

    private String getResponse(HttpURLConnection conn) throws Exception {
        StringBuilder response = new StringBuilder();
        try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"))) {
            String responseLine;
            while ((responseLine = br.readLine()) != null) {
                response.append(responseLine.trim());
            }
        }

        // Parse JSON response
        JSONParser parser = new JSONParser();
        JSONObject jsonResponse = (JSONObject) parser.parse(response.toString());

        if (jsonResponse.containsKey("candidates")) {
            JSONArray candidates = (JSONArray) jsonResponse.get("candidates");
            StringBuilder message = new StringBuilder();
            for (Object candidate : candidates) {
                JSONObject content = (JSONObject) ((JSONObject) candidate).get("content");
                JSONArray parts = (JSONArray) content.get("parts");
                for (Object part : parts) {
                    message.append(((JSONObject) part).get("text")).append("\n");
                }
            }
            return message.toString().trim();
        } else {
            return "No candidates found in the response.";
        }
    }

    private void handleErrorResponse(HttpURLConnection conn, int responseCode) throws Exception {
        StringBuilder errorResponse = new StringBuilder();
        try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "utf-8"))) {
            String responseLine;
            while ((responseLine = br.readLine()) != null) {
                errorResponse.append(responseLine.trim());
            }
        }

        switch (responseCode) {
            case 401:
                throw new RuntimeException("Failed: HTTP error code: 401 Unauthorized. Please check your API key and permissions.");
            case 400:
                throw new RuntimeException("Failed: HTTP error code: 400 Bad Request. Response: " + errorResponse.toString());
            default:
                throw new RuntimeException("Failed: HTTP error code: " + responseCode);
        }
    }
}
