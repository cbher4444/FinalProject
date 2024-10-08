package com.kh.usTwo.play.controller;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.annotation.RequestScope;


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
	
	@RequestMapping("movieDetail")
	public String movieDetail(int id, Model model) throws IOException, InterruptedException {
		
		HttpRequest request = HttpRequest.newBuilder()
			    .uri(URI.create("https://api.themoviedb.org/3/movie/"+ id +"?language=ko-KR"))
			    .header("accept", "application/json")
			    .header("Authorization", "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwYjI3MjU0NjIzZTEyNTZmMjU5YTBiMGFjOWQ4YWY5MyIsIm5iZiI6MTcyODI1OTc4Ny42MjEzLCJzdWIiOiI2NmYyNmFlNmE4MmIwMDU3MDMyNmNjZmYiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.TMODsVUJWpLfSV3DYVFb7uQr5JiQSwL8WtnMbobD2dU")
			    .method("GET", HttpRequest.BodyPublishers.noBody())
			    .build();
			HttpResponse<String> response = HttpClient.newHttpClient().send(request, HttpResponse.BodyHandlers.ofString());
			
		HttpRequest request2 = HttpRequest.newBuilder()
			    .uri(URI.create("https://api.themoviedb.org/3/movie/"+ id +"/credits?language=ko"))
			    .header("accept", "application/json")
			    .header("Authorization", "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwYjI3MjU0NjIzZTEyNTZmMjU5YTBiMGFjOWQ4YWY5MyIsIm5iZiI6MTcyODM1MzM2Ny40MjE1MjksInN1YiI6IjY2ZjI2YWU2YTgyYjAwNTcwMzI2Y2NmZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.YooNx68pHwTbLmCGiGpKofZvG4zieyXeJp6i0SkfjSs")
			    .method("GET", HttpRequest.BodyPublishers.noBody())
			    .build();
			HttpResponse<String> credit = HttpClient.newHttpClient().send(request2, HttpResponse.BodyHandlers.ofString());

			model.addAttribute("response", response.body());
			model.addAttribute("credit", credit.body());
		
		return "play/movieDetailView";
	}
	
	@ResponseBody
	@RequestMapping(value="discoverTv", produces="application/json; charset=utf-8")
	public String discoverTv(String genre) throws IOException, InterruptedException {
		
		HttpRequest request = HttpRequest.newBuilder()
			    .uri(URI.create("https://api.themoviedb.org/3/discover/tv?include_adult=true&include_null_first_air_dates=false&language=ko&sort_by=first_air_date.desc&vote_average.gte=8&with_genres="+ genre +"&with_original_language=ko"))
			    .header("accept", "application/json")
			    .header("Authorization", "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwYjI3MjU0NjIzZTEyNTZmMjU5YTBiMGFjOWQ4YWY5MyIsIm5iZiI6MTcyODM1MzM2Ny40MjE1MjksInN1YiI6IjY2ZjI2YWU2YTgyYjAwNTcwMzI2Y2NmZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.YooNx68pHwTbLmCGiGpKofZvG4zieyXeJp6i0SkfjSs")
			    .method("GET", HttpRequest.BodyPublishers.noBody())
			    .build();
			HttpResponse<String> response = HttpClient.newHttpClient().send(request, HttpResponse.BodyHandlers.ofString());
			return response.body();
	}
	
	@RequestMapping("tvDetail")
	public String tvDetail(int id, Model model) throws IOException, InterruptedException {
		
		HttpRequest request = HttpRequest.newBuilder()
			    .uri(URI.create("https://api.themoviedb.org/3/tv/"+ id +"?language=ko"))
			    .header("accept", "application/json")
			    .header("Authorization", "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwYjI3MjU0NjIzZTEyNTZmMjU5YTBiMGFjOWQ4YWY5MyIsIm5iZiI6MTcyODM1MzM2Ny40MjE1MjksInN1YiI6IjY2ZjI2YWU2YTgyYjAwNTcwMzI2Y2NmZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.YooNx68pHwTbLmCGiGpKofZvG4zieyXeJp6i0SkfjSs")
			    .method("GET", HttpRequest.BodyPublishers.noBody())
			    .build();
			HttpResponse<String> detail = HttpClient.newHttpClient().send(request, HttpResponse.BodyHandlers.ofString());
		
		HttpRequest requestC = HttpRequest.newBuilder()
			    .uri(URI.create("https://api.themoviedb.org/3/tv/"+ id +"/credits?language=ko"))
			    .header("accept", "application/json")
			    .header("Authorization", "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwYjI3MjU0NjIzZTEyNTZmMjU5YTBiMGFjOWQ4YWY5MyIsIm5iZiI6MTcyODM1MzM2Ny40MjE1MjksInN1YiI6IjY2ZjI2YWU2YTgyYjAwNTcwMzI2Y2NmZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.YooNx68pHwTbLmCGiGpKofZvG4zieyXeJp6i0SkfjSs")
			    .method("GET", HttpRequest.BodyPublishers.noBody())
			    .build();
			HttpResponse<String> credit = HttpClient.newHttpClient().send(requestC, HttpResponse.BodyHandlers.ofString());
			
			model.addAttribute("credit", credit.body());
			model.addAttribute("detail", detail.body());
		
		return "play/tvDetail";
	}
	
	
}
