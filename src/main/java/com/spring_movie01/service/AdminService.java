package com.spring_movie01.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.spring_movie01.dao.AdminDao;
import com.spring_movie01.dto.MemberDto;
import com.spring_movie01.dto.MovieDto;
import com.spring_movie01.dto.ScheduleDto;
import com.spring_movie01.dto.TheaterDto;

@Service
public class AdminService {
	
	@Autowired
	private AdminDao addao;

	public ModelAndView adminMovieList() {
		System.out.println("AdminService.adminMovieList() 호출");
		ModelAndView mav = new ModelAndView();
		//전체 영화 목록
		ArrayList<MovieDto> movieList = addao.selectMovieList();
		mav.addObject("mvList", movieList);
		mav.setViewName("admin/AdminMovieList");
		return mav;
	}
	
	public ModelAndView adminModifyMvState1(String mvcode, int mvstate) {
		System.out.println("AdminService.adminMovieList1() 호출");
		ModelAndView mav = new ModelAndView();
		System.out.println("mvcode : " + mvcode);
		System.out.println("mvstate : " + mvstate);
		
		int updateResult = addao.updateMvState(mvcode, mvstate);
		System.out.println("updateResult : " + updateResult);
		
		mav.setViewName("redirect:/adminMovieList");
		return mav;
	}
	

	public String adminModifyMvState2(String mvcode, int mvstate) {
		System.out.println("AdminService.adminMovieList2() 호출");
		System.out.println("mvcode : " + mvcode);
		System.out.println("mvstate : " + mvstate);
		
		int updateResult = addao.updateMvState(mvcode, mvstate);
		System.out.println("updateResult : " + updateResult);
		return updateResult+"";
	}

	public ModelAndView adminModifyMovie(MovieDto movie) {
		System.out.println("AdminService.adminModifyMovie() 호출");
		ModelAndView mav = new ModelAndView();
		
		System.out.println("수정할 영화 정보");
		System.out.println(movie);
		
		
		
		mav.setViewName("redirect:/adminMovieList");
		return mav;
	}

	public String getAdminMvInfo(String mvcode) {
		System.out.println("AdminService.getAdminMvInfo() 호출");
		MovieDto movie = addao.selectMvInfo(mvcode);
		Gson gson = new Gson();
		String mvInfo_Json = gson.toJson(movie);
		System.out.println(mvInfo_Json);
		return mvInfo_Json;
	}
	
	//전체 극장 목록 조회
	public ModelAndView adminTheaterList() {
		System.out.println("AdminService.adminTheaterList() 호출");
		ModelAndView mav = new ModelAndView();
		ArrayList<TheaterDto> thList = addao.selectTheaterList();
		
		mav.addObject("thList", thList);
		mav.setViewName("admin/AdminTheaterList");
		return mav;
	}
	

	public String adminModifyThState(String thcode, int thstate) {
		System.out.println("AdminService.adminModifyThState() 호출");
		System.out.println("thcode : " + thcode);
		System.out.println("thstate : " + thstate);
		
		int updateResult = addao.updateThState(thcode, thstate);
		System.out.println("updateResult : " + updateResult);
		return updateResult+"";
	}

	public String adminGetThInfo(String thcode) {
		System.out.println("AdminService.adminGetThInfo() 호출");
		System.out.println("조회할 극장 코드 : " + thcode);
		TheaterDto theater = addao.selectThInfo(thcode);
		
		Gson gson = new Gson();
		String theater_json = gson.toJson(theater);
		System.out.println(theater_json);
		return theater_json;
	}

	public String adminModifyThInfo(TheaterDto theater) {
		System.out.println("AdminService.adminModifyThInfo() 호출");
		System.out.println("수정할 극장 정보");
		
		System.out.println(theater);
		
		
		int updateResult = addao.updateTheaterInfo(theater);
		
		
		System.out.println("updateResult : " + updateResult);
		return updateResult+"";
	}

	public ModelAndView adminRegistSchedulePage() {
		System.out.println("AdminService.adminRegistSchedulePage() 호출");
		ModelAndView mav = new ModelAndView();
		ArrayList<MovieDto> mvList = addao.selectMovieList();
		ArrayList<TheaterDto> thList = addao.selectTheaterList();
		
		mav.addObject("mvList", mvList);
		mav.addObject("thList", thList);
		
		mav.setViewName("admin/AdminRegistSchedule");
		return mav;
	}

	public ModelAndView adminRegistSchedule(ScheduleDto schedule, RedirectAttributes ra) {
		System.out.println("AdminService.adminRegistSchedule() 호출");
		ModelAndView mav = new ModelAndView();
		
		System.out.println(schedule);
		
		for(int i = 0; i < schedule.getScRoomTime().length; i++ ) {
			ScheduleDto registSc = new ScheduleDto();
			registSc.setScthcode(schedule.getScthcode());
			registSc.setScmvcode(schedule.getScmvcode());
			
			String[] roomTime = schedule.getScRoomTime()[i].split(" ");
			registSc.setScroom(roomTime[0]);
			registSc.setScdate( schedule.getScdate()+" "+roomTime[1] );
			System.out.println(registSc);
			addao.insertSchedule(registSc);
		}
		
		ra.addFlashAttribute("msg", schedule.getScdate()+" "+schedule.getScRoomTime().length+"개 스케쥴이 등록되었습니다.");
		mav.setViewName("redirect:/adminRegistSchedulePage");
		return mav;
	}

	
	
	public String adminScRoomTimeList(String thcode, String scdate) {
		System.out.println("AdminService.getScRoomTimeList()");
		
		ArrayList<ScheduleDto> roomTimeList = addao.selectScRoomTime(thcode, scdate);
		Gson gson = new Gson();
		String roomTimeList_json = gson.toJson(roomTimeList);
		System.out.println(roomTimeList_json);
		
		return roomTimeList_json;
	}

	public ModelAndView adminMemberList() {
		System.out.println("AdminService.adminMemberList()");
		ModelAndView mav = new ModelAndView();
		ArrayList<MemberDto> memberList = addao.selectMemberList();
		System.out.println(memberList);
		mav.addObject("memberList", memberList);
		mav.setViewName("admin/AdminMemberList");
		return mav;
	}

	public String adminModifyMemberState(String mid, int mstate) {
		System.out.println("AdminService.adminModifyMemberState() 호출");
		System.out.println("mid : " + mid);
		System.out.println("mstate : " + mstate);
		
		int updateResult = addao.updateMemberState(mid, mstate);
		System.out.println("updateResult : " + updateResult);
		return updateResult+"";
	}

	public String adminGetMemberInfo(String mid) {
		System.out.println("AdminService.adminGetMemberInfo() 호출");
		MemberDto memInfo = addao.selectMemberInfo(mid);
		Gson gson = new Gson();
		String memInfo_Json = gson.toJson(memInfo);
		return memInfo_Json;
	}
	
	
	
	
	
	
	
	
	
	
	
	

}
