package com.spring_movie01.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring_movie01.dto.MemberDto;
import com.spring_movie01.service.MemberService;

@Controller
public class MemberController {
	
	private ModelAndView mav;

	@Autowired 
	private MemberService msvc;
	//MemberService mscv = new MemberService();
	
	@RequestMapping(value = "/memberJoinForm")
	public String memberJoinForm(  ) {
		System.out.println("회원가입 페이지 이동요청");
		
		return "member/MemberJoinForm";
	}
	
	@RequestMapping(value = "/memberJoin")
	public ModelAndView memberJoin(MemberDto member) throws IllegalStateException, IOException {
		System.out.println("회원가입 요청");
		System.out.println(member);
		
		mav = msvc.memberJoin(member);
		return mav;
	}
	
	@RequestMapping(value = "/memberIdCheck")
	public @ResponseBody String memberIdCheck(String inputId) {
		System.out.println("아이디 중복 확인 요청");
		System.out.println("입력한 아이디 : " + inputId);
		String idCheckResult = msvc.memberIdCheck(inputId);
		return idCheckResult;  
	}
	
	@RequestMapping(value = "/memberLoginForm")
	public String memberLoginForm() {
		System.out.println("로그인 페이지 이동요청");
		
		return "member/MemberLoginForm";
		
	}
	
	@RequestMapping(value = "/memberLogin")
	public ModelAndView memberLogin(String mid, String mpw, RedirectAttributes ra) {
		System.out.println("로그인 요청");
		
		mav = msvc.memberLogin(mid, mpw, ra);
		
		return mav;
	}
	
	@RequestMapping(value = "/memberLogout")
	public ModelAndView memberLogout(RedirectAttributes ra) {
		System.out.println("로그아웃 요청");
		
		mav = msvc.memberLogout(ra);
		return mav;
	}
	
	@RequestMapping(value = "/memberView")
	public ModelAndView memberView() {
		System.out.println("회원정보 페이지 이동요청");
		/*
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/MemberView");
		MemberDto memberInfo = msvc.getMemberInfo();
		mav.addObject("memberInfo", memberInfo); 
		*/
		mav = msvc.memberView();
		
		return mav;
		
	}
	
	
	@RequestMapping(value = "/memberKakaoLogin")
	public ModelAndView memberKakaoLogin(MemberDto member, RedirectAttributes ra) {
		System.out.println("카카오로 로그인 요청");
		System.out.println(member);
		
		ModelAndView mav = msvc.memberKakaoLogin(member, ra);
		
		return mav;
	}
	
	
	
	
}










