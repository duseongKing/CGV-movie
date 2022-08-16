package com.spring_movie01.service;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring_movie01.dao.MemberDao;
import com.spring_movie01.dto.MemberDto;

@Service
public class MemberService {
	
	@Autowired
	private MemberDao mdao;
	
	@Autowired
	private HttpServletRequest request;
	
	@Autowired
	private HttpSession session;
	
	//2. 저장경로 설정
	private String savePath = "D:\\workspace-spring-tool-suite-4-4.14.1.RELEASE\\spring_movie01\\src\\main\\webapp\\resources\\mprofileUpLoad";

	public ModelAndView memberJoin(MemberDto member) throws IllegalStateException, IOException {
		ModelAndView mav = new ModelAndView();
		System.out.println("MemberService.memberJoin()");
		
		MultipartFile mfile = member.getMfile();
		String mprofile = "";
		
		if( !mfile.isEmpty() ) {
			System.out.println("첨부파일 있음");
			UUID uuid = UUID.randomUUID();
			//1. 파일명 생성
			mprofile = uuid.toString()+"_"+mfile.getOriginalFilename();
			//프로필 이미지 파일 저장
			mfile.transferTo(  new File(savePath, mprofile)   );
		} 
		System.out.println("mprofile : " + mprofile);
		
		member.setMprofile(mprofile);
		
		// 주소 처리
		member.setMaddress( member.getMpostcode()+"_"+member.getMaddr()
		               +"_"+member.getMdetailAddr()+"_"+member.getMextraAddr()  );
		
		//회원가입 처리 (dao  - insert문)
		int joinResult = mdao.insertMember(member);
		
		//mav.setViewName("Main"); 
		
		mav.setViewName("redirect:/movieMain");
		
		
		return mav;
	}
	
	// 아이디 중복 확인 
	public String memberIdCheck(String inputId) {
		System.out.println("MemberService.memberIdCheck() 호출");
		String idCheckResult = mdao.selectCheckMid(inputId);
		System.out.println(idCheckResult);
		if(idCheckResult == null) {
			return "OK";
		}else {
			return "NO";
		}
	}
	
	//로그인 기능
	public ModelAndView memberLogin(String mid, String mpw, RedirectAttributes ra) {
		System.out.println("MemberService.memberLogin() 호출");
		System.out.println("입력한 아이디 : " + mid);
		System.out.println("입력한 비밀번호 : " + mpw);
		
		ModelAndView mav = new ModelAndView();
		
		MemberDto loginMember = mdao.selectMemberLogin(mid, mpw);
		System.out.println(loginMember);
		
		if( loginMember != null) {
			if(loginMember.getMstate() == 0) {
				ra.addFlashAttribute("msg", "이용 정지 된 계정 입니다.");
				mav.setViewName("redirect:/memberLoginForm");				
			} else {
				//로그인 성공
				String contextPath = request.getContextPath();
				session.setAttribute("loginId", loginMember.getMid());
				session.setAttribute("loginProfile", contextPath+"/resources/mprofileUpLoad/"+loginMember.getMprofile());
				mav.setViewName("redirect:/movieMain");
			}
			
		} else {
			//로그인 실패
			ra.addFlashAttribute("msg", "아이디 또는 비밀번호가 일치 하지 않습니다!.");
			mav.setViewName("redirect:/memberLoginForm");
			//mav.addObject("msg", "아이디 또는 비밀번호가 일치 하지 않습니다!.");
			//mav.setViewName("member/MemberLoginForm");
		}
		
		return mav;
	}
	
	//로그아웃 기능
	public ModelAndView memberLogout(RedirectAttributes ra) {
		System.out.println("MemberService.memberLogout() 호출");
		session.invalidate();
		ra.addFlashAttribute("msg", "로그아웃 되었습니다.");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/movieMain");
		return mav;
	}

	//회원 정보 조회
	public ModelAndView memberView() {
		ModelAndView mav = new ModelAndView();
		System.out.println("MemberService.memberView() 호출");
		String loginId = (String) session.getAttribute("loginId");
		System.out.println("로그인 된 아이디 : " + loginId);
		
		MemberDto memberInfo = mdao.selectMemberInfo(loginId);
		
		//주소 분리 (우편번호, 주소, 상세주소, 참고주소)
		String maddress = memberInfo.getMaddress();
		
		if( maddress != null) {
			String[] maddress_arr = maddress.split("_");
			System.out.println(maddress_arr.length);
			if( maddress_arr.length >= 4 ) {
				memberInfo.setMpostcode(maddress_arr[0]);
				memberInfo.setMaddr(maddress_arr[1]);
				memberInfo.setMdetailAddr(maddress_arr[2]);
				memberInfo.setMextraAddr(maddress_arr[3]);
			}
		}
		
		mav.addObject("memberInfo", memberInfo);
		mav.setViewName("member/MemberView");
		
		return mav;
	}

	public ModelAndView memberKakaoLogin(MemberDto member, RedirectAttributes ra) {
		System.out.println("MemberService.memberKakaoLogin() 호출");
		ModelAndView mav = new ModelAndView();
		
		MemberDto kakaoMember = mdao.selectMemberKakao(member.getMid());
		System.out.println(kakaoMember);
		if( kakaoMember != null ) {
			//로그인 처리
			session.setAttribute("loginId", kakaoMember.getMid());
			session.setAttribute("loginProfile", kakaoMember.getMprofile());
			ra.addFlashAttribute("msg", "카카오 계정으로 로그인 되었습니다.");
			mav.setViewName("redirect:/movieMain");
			
		} else {
			//회원가입 처리
			member.setMpw("1234");
			mdao.insertMemberKakao(member);
			ra.addFlashAttribute("msg", "회원정보가 등록 되었습니다. 다시 로그인 해주세요!");
			mav.setViewName("redirect:/memberLoginForm");
		}
		
		return mav;
	}

	
	
	
	
}



















