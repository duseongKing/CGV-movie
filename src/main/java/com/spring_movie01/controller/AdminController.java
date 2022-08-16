package com.spring_movie01.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring_movie01.dto.MovieDto;
import com.spring_movie01.dto.ScheduleDto;
import com.spring_movie01.dto.TheaterDto;
import com.spring_movie01.service.AdminService;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService adsvc;

	@RequestMapping(value = "/adminMovieList")
	public ModelAndView adminMovieList() {
		System.out.println("관리자 영화 페이지 이동요청");
		ModelAndView mav = adsvc.adminMovieList();
		return mav;
	}
	
	
	@RequestMapping(value = "/adminModifyMvState1")
	public ModelAndView adminModifyMvState1(String mvcode, int mvstate) {
		System.out.println("관리자 영화 상태 변경 요청1");
		ModelAndView mav = adsvc.adminModifyMvState1(mvcode, mvstate);
		
		return mav;
	}
	
	
	@RequestMapping(value = "/adminModifyMvState2")
	public @ResponseBody String adminModifyMvState2(String mvcode, int mvstate) {
		System.out.println("관리자 영화 상태 변경 요청2");
		
		String updateResult = adsvc.adminModifyMvState2(mvcode, mvstate);
		
		return updateResult;
	}
	
	@RequestMapping(value = "/adminModifyMovie")
	public ModelAndView adminModifyMovie(MovieDto movie) {
		System.out.println("관리자 영화 정보 수정 요청");
		
		ModelAndView mav = adsvc.adminModifyMovie(movie);
		return mav;
		
	}
	
	@RequestMapping(value = "/adminGetMvInfo")
	public @ResponseBody String adminGetMvInfo(String mvcode) {
		System.out.println("관리자 영화정보 조회 요청");
		String mvInfo = adsvc.getAdminMvInfo(mvcode);
		
		return mvInfo;
	}
	
	
	@RequestMapping(value = "/adminTheaterList")
	public ModelAndView adminTheaterList() {
		System.out.println("관리자 극장 페이지 이동요청");
		ModelAndView mav = adsvc.adminTheaterList();
		return mav;
	}
	
	
	@RequestMapping(value = "/adminModifyThState")
	public @ResponseBody String adminModifyThState(String thcode, int thstate) {
		System.out.println("관리자 극장 상태 변경 요청");
		
		String updateResult = adsvc.adminModifyThState(thcode, thstate);
		
		return updateResult;
	}
	
	@RequestMapping(value = "/adminGetThInfo")
	public @ResponseBody String adminGetThInfo(String thcode) {
		System.out.println("관리자 극장 정보 조회 요청");
		
		String thInfo = adsvc.adminGetThInfo(thcode);
		
		return thInfo;
		
	}
	
	@RequestMapping(value = "/adminModifyThInfo")
	public @ResponseBody String adminModifyThInfo(TheaterDto theater) {
		System.out.println("관리자 극장 정보 수정 요청");
		
		String result = adsvc.adminModifyThInfo(theater);
		
		return result;
		
	}
	
	@RequestMapping(value = "/adminRegistSchedulePage")
	public ModelAndView adminRegistSchedulePage() {
		System.out.println("관리자 스케쥴 등록 페이지 이동 요청");
		ModelAndView mav = adsvc.adminRegistSchedulePage();
		return mav;
	}
	
	
	
	@RequestMapping(value = "/adminRegistSchedule")
	public ModelAndView adminRegistSchedule(ScheduleDto schedule, RedirectAttributes ra) {
		System.out.println("관리자 스케쥴 등록 요청");
		
		ModelAndView mav = adsvc.adminRegistSchedule(schedule, ra);
		
		return mav;
	}
	
	@RequestMapping(value = "/adminScRoomTimeList")
	public @ResponseBody String adminScRoomTimeList(String thcode, String scdate) {
		System.out.println("관리자 스케쥴_상영관 및 시간목록 조회 요청");
		
		String roomTimeList = adsvc.adminScRoomTimeList(thcode, scdate);
		return roomTimeList;
	}
	@RequestMapping(value = "/adminMemberList")
	public ModelAndView adminMemberList() {
		System.out.println("관리자 회원목록 페이지 이동 요청");
		ModelAndView mav = adsvc.adminMemberList();
		return mav;
		
	}
	
	@RequestMapping(value = "/adminModifyMemberState")
	public @ResponseBody String adminModifyMemberState(String mid, int mstate) {
		System.out.println("관리자 회원상태 변경 요청");
		String updateResult = adsvc.adminModifyMemberState(mid, mstate);
		return updateResult;
	}
	
	@RequestMapping(value = "/adminGetMemberInfo")
	public @ResponseBody String adminGetMemberInfo(String mid) {
		System.out.println("관리자 회원정보 조회 요청");
		String memberInfo = adsvc.adminGetMemberInfo(mid);
		return memberInfo;
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
