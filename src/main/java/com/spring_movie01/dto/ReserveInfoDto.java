package com.spring_movie01.dto;

import lombok.Data;

@Data
public class ReserveInfoDto {
	
	private String mvcode;   //영화코드
	private String mvname;   //영화제목
	private String mvposter; //포스터
	
	private String thname;   //극장이름
	private String scroom;   //상영관
	private String scdate;   //날짜 및 시간
	
	private String recode;   //예매코드
	private String reamount; //예매인원
	
	
	private ReviewDto review; // 관람평 정보

	
	

}
