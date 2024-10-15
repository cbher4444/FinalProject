package com.kh.usTwo.album.model.service;

import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
import com.google.api.client.googleapis.auth.oauth2.GoogleClientSecrets;
import com.google.api.client.googleapis.auth.oauth2.GoogleTokenResponse;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.services.photoslibrary.v1.PhotosLibrary;
import com.google.api.services.photoslibrary.v1.PhotosLibrary.Albums;
import com.google.api.services.photoslibrary.v1.PhotosLibraryScopes;
import com.google.api.services.photoslibrary.v1.model.Album;
import com.kh.usTwo.album.model.vo.CoupleAlbum;
import com.google.api.services.photoslibrary.v1.model.ListAlbumsResponse;
import com.google.api.services.photoslibrary.v1.model.MediaItem;
import com.google.api.services.photoslibrary.v1.model.MediaMetadata;
import com.google.auth.http.HttpCredentialsAdapter;
import com.google.auth.oauth2.AccessToken;
import com.google.auth.oauth2.GoogleCredentials;

import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

@Configuration
@EnableWebSecurity
public class GooglePhotoService {
    
    private static final String CLIENT_SECRET_FILE = "/client_secret_813851433138-ch30k4r0gdo7g9e4u1n9ob32i8ocke80.apps.googleusercontent.com.json";
    private static final String CREATE_ALBUM_URL = "https://photoslibrary.googleapis.com/v1/albums";
    private static final OkHttpClient client = new OkHttpClient(); // Singleton client
    private static final String REDIRECT_URI = "http://localhost:8444/final/oauth2callback";
    private static final String APPLICATION_NAME = "UsTwo"; // 애플리케이션 이름

    private PhotosLibrary photosLibrary;

    public String getAccessToken(String code) throws Exception {
        GoogleClientSecrets clientSecrets = GoogleClientSecrets.load(
                JacksonFactory.getDefaultInstance(),
                new InputStreamReader(getClass().getResourceAsStream(CLIENT_SECRET_FILE))
        );

        GoogleAuthorizationCodeFlow flow = new GoogleAuthorizationCodeFlow.Builder(
                new NetHttpTransport(),
                JacksonFactory.getDefaultInstance(),
                clientSecrets,
                Collections.singleton(PhotosLibraryScopes.PHOTOSLIBRARY))
                .setAccessType("offline")
                .build();

        GoogleTokenResponse tokenResponse = flow.newTokenRequest(code)
                .setRedirectUri(REDIRECT_URI)
                .execute();

        return tokenResponse.getAccessToken();
    }

    public void createAlbum(String accessToken, String albumTitle) throws IOException {
        String json = "{ \"album\": { \"title\": \"" + albumTitle + "\" } }";
        RequestBody body = RequestBody.create(json, MediaType.get("application/json; charset=utf-8"));

        Request request = new Request.Builder()
                .url(CREATE_ALBUM_URL)
                .post(body)
                .addHeader("Authorization", "Bearer " + accessToken)
                .build();

        try (Response response = client.newCall(request).execute()) {
            if (!response.isSuccessful()) {
                throw new IOException("Unexpected code " + response);
            }
            System.out.println("Album created: " + response.body().string());
        }
    }

    public List<Album> listAlbums(String accessToken) throws IOException {
        GoogleCredentials credentials = GoogleCredentials.create(new AccessToken(accessToken, null));
        photosLibrary = new PhotosLibrary.Builder(new NetHttpTransport(), JacksonFactory.getDefaultInstance(), new HttpCredentialsAdapter(credentials))
                .setApplicationName(APPLICATION_NAME)
                .build();

        ListAlbumsResponse response = photosLibrary.albums().list().execute();
        Albums ab = photosLibrary.albums();
        if (response != null && response.getAlbums() != null) {
            return response.getAlbums();
        } else {
            throw new IOException("No albums found.");
        }
    }

    public String getAuthorizationUrl() {
        try {
            GoogleClientSecrets clientSecrets = GoogleClientSecrets.load(
                    JacksonFactory.getDefaultInstance(),
                    new InputStreamReader(getClass().getResourceAsStream(CLIENT_SECRET_FILE))
            );

            GoogleAuthorizationCodeFlow flow = new GoogleAuthorizationCodeFlow.Builder(
                    new NetHttpTransport(),
                    JacksonFactory.getDefaultInstance(),
                    clientSecrets,
                    Collections.singleton(PhotosLibraryScopes.PHOTOSLIBRARY))
                    .setAccessType("offline")
                    .build();
            return flow.newAuthorizationUrl().setRedirectUri(REDIRECT_URI).build();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public List<MediaItem> fetchMediaItems(String accessToken) throws IOException { // json객체로 응답받는 메소드
    	
    	System.out.println(accessToken);
    	OkHttpClient client = new OkHttpClient();

        Request request = new Request.Builder()
                .url("https://photoslibrary.googleapis.com/v1/mediaItems")
                .addHeader("Authorization", "Bearer " + accessToken)
                .build();

        try (Response response = client.newCall(request).execute()) {
            if (!response.isSuccessful()) {
                throw new IOException("Unexpected code " + response);
            }
            
            // JSON 응답을 MediaItem 객체로 파싱
            String jsonData = response.body().string();
            
            List<MediaItem> list = parseMediaItems(jsonData);
            ArrayList<CoupleAlbum> albumArr = new ArrayList<CoupleAlbum>();
            for(MediaItem item : list) {
            	albumArr.add(new CoupleAlbum(item.getId(),item.getBaseUrl(), item.getMediaMetadata().getCreationTime()));
            }
            

            return list;
        }
    }

    public List<MediaItem> parseMediaItems(String jsonData) throws IOException { // 응답받은 데이터(json)을 mediaItem으로 파싱하는 메소드
    	List<MediaItem> mediaItems = new ArrayList<>();
        ObjectMapper objectMapper = new ObjectMapper();
        JsonNode rootNode = objectMapper.readTree(jsonData);

        if (rootNode.has("mediaItems")) {
            for (JsonNode itemNode : rootNode.get("mediaItems")) {
                MediaItem item = new MediaItem();
                item.setId(itemNode.get("id").asText());
                item.setBaseUrl(itemNode.get("baseUrl").asText());

                MediaMetadata mediaMetadata = new MediaMetadata();
                mediaMetadata.setCreationTime(itemNode.get("mediaMetadata").get("creationTime").asText());
                // 필요한 다른 필드들도 설정합니다.

                item.setMediaMetadata(mediaMetadata);
                mediaItems.add(item);
            }
        } else {
            System.out.println("No media items found.");
        }

        return mediaItems;
    }
    
    public String uploadMediaItem(String accessToken, String mediaItemPath) throws IOException {
    	// Upload media item
        File mediaFile = new File(mediaItemPath);
        if (!mediaFile.exists()) {
            throw new IOException("Media file not found: " + mediaItemPath);
        }

        RequestBody requestBody = RequestBody.create(MediaType.parse("application/octet-stream"), mediaFile);
        String encodedFileName = URLEncoder.encode(mediaFile.getName(), "UTF-8");

        Request request = new Request.Builder()
                .url("https://photoslibrary.googleapis.com/v1/uploads")
                .post(requestBody)
                .addHeader("Authorization", "Bearer " + accessToken)
                .addHeader("Content-Type", "application/octet-stream")
                .addHeader("X-Goog-Upload-File-Name", encodedFileName)
                .addHeader("X-Goog-Upload-Protocol", "raw")
                .build();

        try (Response response = client.newCall(request).execute()) {
            if (!response.isSuccessful()) {
            	System.out.println("업로드 실패");
                System.out.println("Response Code: " + response.code());
                System.out.println("Response Body: " + response.body().string());
                throw new IOException("Unexpected code " + response);
            }
            
            // 응답은 단순한 문자열 (media item ID)
            String mediaItemId = response.body().string();
            System.out.println("Response Code: " + response.code());
            System.out.println("Upload Response: " + mediaItemId);
            return mediaItemId; // media item ID
        }
    }

    
    
    public void addMediaItemToAlbum(String accessToken, String albumId, String mediaItemId) throws IOException { // 업로드 한 사진을 앨범에 추가하는 메소드
    	String json = "{ \"mediaItemIds\": [\"" + mediaItemId + "\"] }"; // 올바른 JSON 형식
    	
    	System.out.println(accessToken);
        RequestBody body = RequestBody.create(json, MediaType.get("application/json; charset=utf-8"));

        Request request = new Request.Builder()
                .url("https://photoslibrary.googleapis.com/v1/albums/" + albumId + ":batchAddMediaItems")
                .post(body)
                .addHeader("Authorization", "Bearer " + accessToken)
                .addHeader("Content-Type", "application/json")
                .build();

        try (Response response = client.newCall(request).execute()) {
            if (!response.isSuccessful()) {
            	System.out.println("추가 실패");
                System.out.println("Response Code: " + response.code());
                System.out.println("Response Body: " + response.body().string());
                throw new IOException("Unexpected code " + response);
            }
            System.out.println("Added media item to album: " + response.body().string());
        }
    }
    
    public void uploadAndAddToAlbum(String accessToken, String albumId, String mediaItemPath) throws IOException {
        String mediaItemId = uploadMediaItem(accessToken, mediaItemPath);
        addMediaItemToAlbum(accessToken, albumId, mediaItemId);
    }
    
    

    
}
