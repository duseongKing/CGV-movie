package com.spring_movie01.dto;

import lombok.Data;

@Data
public class MovieDto {
	
	private String mvcode;		//영화코드
	private String mvname;		//영화제목
	private String mvpd;		//영화감독
	private String mvactor;		//배우
	private String mvgenre;		//장르
	private String mvage;		//관람연령
	private String mvtime;		//시간
	private String mvopen;		//개봉일
	
	private String mvposter;	//포스터
	
	private int mvstate;        //영화 상태  (1:사용,  0:중지)
	
	
	private int goodRecommend;  //추천수
	private int badRecommend;   //비추천수
	
	private double reservationRatio; // 예매율
	

}
