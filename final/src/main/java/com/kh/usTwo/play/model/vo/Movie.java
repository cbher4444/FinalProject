package com.kh.usTwo.play.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Getter
@Setter
public class Movie {
	
	private int id;
	private String title;
	private String overview;
	private String posterPath;
	private String releaseDate;
	private String voteAvg;
	private int[] genreId;
}
