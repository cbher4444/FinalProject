package com.kh.usTwo.album.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.google.api.services.photoslibrary.v1.model.Album;
import com.google.api.services.photoslibrary.v1.model.MediaItem;
import com.kh.usTwo.album.model.service.AlbumServiceImpl;
import com.kh.usTwo.album.model.service.GooglePhotoService;
import com.kh.usTwo.album.model.vo.Story;

@Controller
public class AlbumController {
    

	@Autowired
    private AlbumServiceImpl aService;

    @Autowired
    private GooglePhotoService gps;

    @RequestMapping("story")
    public String story() {
        ArrayList<Story> list = aService.selectStory();
        return "album/story";
    }

    @RequestMapping("album")
    public String album() {
        return "album/album";
    }

    @GetMapping("/create-album")
    public String createAlbum(@RequestParam String authCode) {
        try {
            String accessToken = gps.getAccessToken(authCode);
            gps.createAlbum(accessToken, "My New Album");
            return "redirect:album";
        } catch (Exception e) {
            e.printStackTrace();
            return "album/album"; // 적절한 오류 페이지로 리다이렉트
        }
    }

    @GetMapping("/albums")
    public String getAlbums(HttpSession session, Model model) {
        String accessToken = (String) session.getAttribute("accessToken");
        if (!isUserAuthenticated(accessToken, model)) {
            return "album/album";
        }

        try {
            List<Album> albums = gps.listAlbums(accessToken);
            model.addAttribute("albums", albums);

            // 각 앨범의 미디어 아이템을 가져옵니다.
            model.addAttribute("json",gps.fetchMediaItems(accessToken));
            return "album/album";
        } catch (IOException e) {
            model.addAttribute("error", "Failed to retrieve albums: " + e.getMessage());
            return "album/album";
        }
    }

    private boolean isUserAuthenticated(String accessToken, Model model) {
        if (accessToken == null) {
            model.addAttribute("error", "User not authenticated.");
            return false;
        }
        return true;
    }

    @GetMapping("/authorize")
    public void authorize(HttpServletResponse response) throws IOException {
        String authorizationUrl = gps.getAuthorizationUrl();
        response.sendRedirect(authorizationUrl);
    }

    @GetMapping("/oauth2callback")
    public String oauth2Callback(@RequestParam String code, HttpSession session, Model model) {
        try {
            String accessToken = gps.getAccessToken(code);
            session.setAttribute("accessToken", accessToken);
            List<Album> albums = gps.listAlbums(accessToken);
            model.addAttribute("albums", albums);
            return "album/album";
        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", "Error during authentication: " + e.getMessage());
            return "album/album";
        }
    }
    
    
    @RequestMapping("add-photo-to-album")
    public String addPhotoToAlbum(String albumId, MultipartFile file, HttpSession session, Model model) {
        System.out.println("HERE" + albumId);
    	String accessToken = (String) session.getAttribute("accessToken");
        if (!isUserAuthenticated(accessToken, model)) {
            return "album/album";
        }

        try {
            // 임시 파일로 저장
            File tempFile = File.createTempFile("upload_", file.getOriginalFilename());
            file.transferTo(tempFile);

            // 사진 업로드 및 앨범에 추가
            gps.uploadAndAddToAlbum(accessToken, albumId, tempFile.getAbsolutePath());
            
            // 임시 파일 삭제
            tempFile.delete();
            
            return "redirect:/albums"; // 앨범 목록으로 리다이렉트
        } catch (IOException e) {
            e.printStackTrace();
            model.addAttribute("error", "Failed to add photo to album: " + e.getMessage());
            return "album/album";
        }
    }


    
}
