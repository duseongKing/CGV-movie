package com.spring_movie01.dto;

import lombok.Data;

@Data
public class ScheduleDto {

	private String scroom;
	private String scdate;
	private String scthcode;
	private String scmvcode;
	
	private String[] scRoomTime;
	
}
