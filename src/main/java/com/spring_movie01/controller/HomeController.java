package com.spring_movie01.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private HttpServletRequest request;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		//
		String connectIp = getClientIp();
		System.out.println(connectIp);
		return "Main";
	}
	

	@RequestMapping(value = "/movieMain", method = RequestMethod.GET)
	public String movieMain() {
		//
		return "MovieMain";
	}
	
	
	
	@RequestMapping(value = "/adminMainPage")
	public String adminMainPage() {
		return "AdminMain";
	}
	
	@RequestMapping(value = "/adminMain", method = RequestMethod.GET)
	public String adminMain(String inputPw, RedirectAttributes ra ) {
		String pw = "1234";
		if( pw.equals(inputPw) ) {
			
			return "AdminMain";
		} else {
			ra.addFlashAttribute("msg", "관리자 비밀번호가 일치하지 않습니다.");
			return "redirect:/";
		}
		
	}
	
	@RequestMapping(value = "/testPage")
	public String TestPage() {
		System.out.println("테스트 페이지 이동요청");
		
		
				
		return "TestPage";
	}
	
	@RequestMapping(value = "/chatPage")
	public String chatPage() {
		System.out.println("채팅 페이지 이동요청");
		return "ChatPage";
	}
	
	
	
	
	
	
	
	
	private String getClientIp() {
		String ip = request.getHeader("X-Forwarded-For");
		
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_CLIENT_IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("HTTP_X_FORWARDED_FOR");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("X-Real-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("X-RealIP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("REMOTE_ADDR");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		return ip;
	}
	
}

