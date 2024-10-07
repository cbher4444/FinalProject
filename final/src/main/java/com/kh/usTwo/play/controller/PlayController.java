package com.kh.usTwo.play.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
