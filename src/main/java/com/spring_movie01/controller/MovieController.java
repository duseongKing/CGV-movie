package com.spring_movie01.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring_movie01.dto.ReservationDto;
import com.spring_movie01.dto.ReviewDto;
import com.spring_movie01.service.MovieService;

@Controller
public class MovieController {
	
	@Autowired
	private MovieService mvsvc;
	
	@RequestMapping(value = "/getCgvMovieList")
	public ModelAndView getCgvMovieList(RedirectAttributes ra) throws IOException {
		ModelAndView mav = mvsvc.getCgvMovieList(ra);
		return mav;
	}
	
	@RequestMapping(value = "/getCgvScheduleList")
	public ModelAndView getCgvScheduleList(RedirectAttributes ra) throws IOException {
		ModelAndView mav = mvsvc.getCgvScheduleList(ra);
		return mav;
	}
	
	@RequestMapping(value = "/movieList")
	public ModelAndView movieList() {
		System.out.println("영화목록 페이지 이동요청");
		ModelAndView mav = mvsvc.movieList();
		return mav; 
	}
	
	@RequestMapping(value = "/movieView")
	public ModelAndView movieView(String mvcode) {
		System.out.println("영화 상세 페이지 이동요청");
		
		ModelAndView mav = mvsvc.movieInfoView(mvcode);
		
		return mav;
	}
	
	@RequestMapping(value = "/movieReservationPage")
	public ModelAndView movieReservationPage() {
		System.out.println("영화 예매 페이지 이동요청");
		
		ModelAndView mav = mvsvc.movieReservationPage();
		
		return mav;
		
	}

	@RequestMapping(value = "/getThList")
	public @ResponseBody String getThList(String mvcode) {
		System.out.println("예매_극장목록 조회 요청");
		
		String reThList = mvsvc.getThList(mvcode);
		
		return reThList;
		
	}
	@RequestMapping(value = "/getScDateList")
	public @ResponseBody String getScDateList(String mvcode, String thcode) {
		System.out.println("예매_날짜목록 조회 요청");
		String reScDateList = mvsvc.getScDateList(mvcode, thcode);
		return reScDateList;
	}
	
	@RequestMapping(value = "/getScRoomTimeList")
	public @ResponseBody String getScRoomTimeList(String mvcode, String thcode, String scdate) {
		System.out.println("예매_ 상영관 및 시간 조회 요청");
		
		String reScRoomTimeList = mvsvc.getScRoomTimeList(mvcode, thcode, scdate);
		return reScRoomTimeList;
		
	}
	
	@RequestMapping(value = "/movieReservation")
	public ModelAndView movieReservation(RedirectAttributes ra, ReservationDto reInfo) {
		System.out.println("예매정보 입력 요청");
		ModelAndView mav = mvsvc.movieReservation(ra, reInfo);
		return mav;
	}
	
	@RequestMapping(value = "/movieReservationList")
	public ModelAndView movieReservationList(RedirectAttributes ra) {
		System.out.println("예매내역 페이지 이동요청");
		ModelAndView mav = mvsvc.movieReservationList(ra);
		return mav;
	}
	
	@RequestMapping(value = "/reservationCancel")
	public ModelAndView reservationCancel(RedirectAttributes ra, String recode) {
		ModelAndView mav = mvsvc.reservationCancel(ra, recode);
		return mav;
	}
	
	@RequestMapping(value = "/reviewWrite")
	public ModelAndView reviewWrite(RedirectAttributes ra, ReviewDto review) {
		ModelAndView mav = mvsvc.reviewWrite(ra, review);
		return mav;
	}
	

	
	@RequestMapping(value = "/movieSearch")
	public ModelAndView movieSearch(String searchText) {
		System.out.println("검색요청");
		ModelAndView mav = mvsvc.movieSearch(searchText);
		return mav;
	}
	
	
	
	
	
	
	
}
