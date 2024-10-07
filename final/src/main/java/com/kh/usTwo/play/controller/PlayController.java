package com.kh.usTwo.play.controller;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class PlayController {
	

	@RequestMapping("play")
	public String play() {
		return "play/play";
	}
	
	@RequestMapping("movie")
	public String movie() {
		return "play/movie";
	}
	
	@ResponseBody
	@RequestMapping(value="discoverMovie", produces="application/json")
	public String discoverMovie(String genre) throws IOException, InterruptedException {
		
		HttpRequest request = HttpRequest.newBuilder()
			    .uri(URI.create("https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=ko-KR&page=1&sort_by=popularity.desc&with_genres=" + genre))
			    .header("accept", "application/json")
			    .header("Authorization", "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwYjI3MjU0NjIzZTEyNTZmMjU5YTBiMGFjOWQ4YWY5MyIsIm5iZiI6MTcyODI1OTc4Ny42MjEzLCJzdWIiOiI2NmYyNmFlNmE4MmIwMDU3MDMyNmNjZmYiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.TMODsVUJWpLfSV3DYVFb7uQr5JiQSwL8WtnMbobD2dU")
			    .method("GET", HttpRequest.BodyPublishers.noBody())
			    .build();
			HttpResponse<String> response = HttpClient.newHttpClient().send(request, HttpResponse.BodyHandlers.ofString());
			return response.body();
		
		
		
	}
	
	
}
