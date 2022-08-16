package com.spring_movie01.service;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.spring_movie01.dao.MovieDao;
import com.spring_movie01.dto.MovieDto;
import com.spring_movie01.dto.ReservationDto;
import com.spring_movie01.dto.ReserveInfoDto;
import com.spring_movie01.dto.ReviewDto;
import com.spring_movie01.dto.ScheduleDto;
import com.spring_movie01.dto.TheaterDto;

@Service
public class MovieService {
	
	@Autowired
	private MovieDao mvdao;
	
	@Autowired
	private HttpSession session;


	public ModelAndView getCgvScheduleList(RedirectAttributes ra) throws IOException {
		String cgvMovieUrl = "http://section.cgv.co.kr/theater/popup/r_TimeTable.aspx?code=0325";
		Document doc = Jsoup.connect(cgvMovieUrl).post();
		System.out.println(doc);
		
		
		return null;
	}
	
	public ModelAndView getCgvMovieList(RedirectAttributes ra) throws IOException {
		System.out.println("MovieService.getCgvMovieList() 호출");
		ModelAndView mav = new ModelAndView();
		
		String cgvMovieUrl = "http://www.cgv.co.kr/movies/?lt=1&ft=0";
		Document doc = Jsoup.connect(cgvMovieUrl).get();
		Elements movieList_div = doc.select("div.sect-movie-chart");
		Elements movieList_ol = movieList_div.eq(0).select("ol");
		
		ArrayList<MovieDto> cgvMvList = new ArrayList<MovieDto>();
		
		for(int i = 0; i < movieList_ol.select("li").size(); i++) {
			MovieDto mv = new MovieDto();
			String detailUrl = "http://www.cgv.co.kr" + movieList_ol.select("li").eq(i).select("div.box-image a").eq(0).attr("href");
			Document detailDoc = Jsoup.connect(detailUrl).get();
			Elements baseMovie = detailDoc.select("div.sect-base-movie");
			String movieTitle = baseMovie.select("div.box-contents div.title strong").text();
			//System.out.println(" movieTitle : " + movieTitle);
			mv.setMvname(movieTitle);
			
			String posterUrl = baseMovie.select("div.box-image span.thumb-image img").attr("src");
			//System.out.println(" posterUrl : " + posterUrl);
			mv.setMvposter(posterUrl);
			
			String movieDirector = baseMovie.select("div.box-contents div.spec dd").eq(0).text();
			//System.out.println(" movieDirector : " + movieDirector);
			mv.setMvpd(movieDirector);
			
			String movieActors = baseMovie.select("div.box-contents div.spec dd.on").eq(0).text();
			//System.out.println(" movieActors : " + movieActors);
			mv.setMvactor(movieActors);
			
			String movieGenre = baseMovie.select("div.box-contents div.spec dd.on").eq(0).next().text().replace("장르 :", "").replaceFirst(" ", "");
			//System.out.println(" movieGenre : " + movieGenre);
			mv.setMvgenre(movieGenre);
			
			String movieGrade =  baseMovie.select("div.box-contents div.spec dd.on").eq(1).text().split(", ")[0];
			//System.out.println(" movieGrade : " + movieGrade);
			mv.setMvage(movieGrade);
			
			String movieTime = baseMovie.select("div.box-contents div.spec dd.on").eq(1).text().split(", ")[1].replaceFirst(",", "");
			//System.out.println(" movieTime : " + movieTime);
			mv.setMvtime(movieTime);
			
			String movieOpen = baseMovie.select("div.box-contents div.spec dd.on").eq(2).text().replace("(재개봉)", "");
			//System.out.println(" movieOpen : " + movieOpen);
			mv.setMvopen(movieOpen);
			
			cgvMvList.add(mv);
		}
		int insertCount = 0;
		for(int i = 0; i < cgvMvList.size(); i++) {
			int mvCheck 
			 = mvdao.selectMvCheck(cgvMvList.get(i).getMvname(), cgvMvList.get(i).getMvopen() );
			if( mvCheck == 0 ) {
				//1. 영화코드 생성 (select )
				String mvcode = "MV";
				String maxMvCode = mvdao.selectMaxMvCode();
				if(maxMvCode == null) {
					mvcode = mvcode + "001";
				} else {
					//maxMvCode = maxMvCode.split("MV")[1];
					maxMvCode = maxMvCode.substring(2); // 'MV002' >> '002' 
					int codeNum = Integer.parseInt(maxMvCode) + 1;
					if( codeNum < 10) {
						mvcode = mvcode + "00" + codeNum;
					} else if(codeNum < 100) {
						mvcode = mvcode + "0" + codeNum;
					} else {
						mvcode = mvcode + codeNum;
					}
				}
				cgvMvList.get(i).setMvcode(mvcode);
				//2. 영화정보 insert
				mvdao.insertMovieInfo(cgvMvList.get(i));
				insertCount++;
			}
		}
		if(insertCount > 0) {
			ra.addFlashAttribute("msg", "영화 정보가 추가되었습니다.");
		}
		mav.setViewName("redirect:/movieMain");
		return mav;
	}


	

	public ModelAndView movieList() {
		System.out.println("MovieService.movieList() 호출");
		ModelAndView mav = new ModelAndView();
		
		//1. 영화목록 조회
		ArrayList<MovieDto> mvList = mvdao.selectMovieList();
		
		for(int i = 0; i < mvList.size(); i++) {
			String mvcode = mvList.get(i).getMvcode();
			//관람평 목록 조회
			
			
			ArrayList<ReviewDto> reviewList = mvdao.selectReviewList(mvcode);
			int goodCount = 0;
			int badCount = 0;
			for(int j = 0 ; j < reviewList.size(); j++) {
				if(reviewList.get(j).getRvrecommend() == 1) {
					goodCount++;
				} else {
					badCount++;
				}
			}
			mvList.get(i).setGoodRecommend(goodCount);
			mvList.get(i).setBadRecommend(badCount);
		}
		
		System.out.println(mvList);
		mav.addObject("mvList", mvList);
		
		//2. 영화목록 페이지
		mav.setViewName("movie/MovieList");
		return mav;
	}


	public ModelAndView movieInfoView(String mvcode) {
		System.out.println("MovieService.movieInfoView() 호출");
		ModelAndView mav = new ModelAndView();
		
		// 영화 정보 조회
		System.out.println("영화코드 : " + mvcode);
		MovieDto movieInfo = mvdao.selectMovieInfo(mvcode);
		System.out.println(movieInfo);
		
		//관람평 목록 조회
		ArrayList<ReviewDto> reviewList = mvdao.selectReviewList(mvcode);
		int goodCount = 0;
		int badCount = 0;
		for(int i = 0 ; i < reviewList.size(); i++) {
			String rvcomment = reviewList.get(i).getRvcomment();
			rvcomment = rvcomment.replace(" ", "&nbsp;");
			rvcomment = rvcomment.replace("\r\n", "<br>");
			reviewList.get(i).setRvcomment(rvcomment);
			
			if(reviewList.get(i).getRvrecommend() == 1) {
				goodCount++;
			} else {
				badCount++;
			}
		}
		movieInfo.setGoodRecommend(goodCount);
		movieInfo.setBadRecommend(badCount);
		System.out.println(reviewList);
		
		//전체예매수 조회
		int totalReservation = mvdao.selectCountReservation();
		System.out.println("totalReservation : " + totalReservation);
		
		//영화예매수 조회
		int mvCountReservation = mvdao.selectMvCountReservation(mvcode);
		System.out.println("mvCountReservation : " + mvCountReservation);
		
		double reservationRatio = (double)mvCountReservation/totalReservation * 100;
		System.out.println("reservationRatio : " + Math.round(reservationRatio*100)/100.0);
		movieInfo.setReservationRatio( Math.round(reservationRatio*100)/100.0 );
		
		mav.addObject("reviewList", reviewList);
		mav.addObject("mvInfo", movieInfo);
		mav.setViewName("movie/MovieView");
		return mav;
	}

	//
	public ModelAndView movieReservationPage() {
		System.out.println("MovieService.movieReservationPage() 호출");
		ModelAndView mav = new ModelAndView();
		
		//1. 영화목록 조회 (예매가능한 영화)
		ArrayList<MovieDto> reMvList = mvdao.selectReserveMvList();
		System.out.println(reMvList);
		
		mav.addObject("reMvList", reMvList);
		
		mav.setViewName("movie/MovieReservationPage");
		return mav;
	}

	// 예매_극장 목록 조회
	public String getThList(String mvcode) {
		System.out.println("MovieService.getThList() 호출");
		System.out.println("선택한 영화 코드 : " + mvcode);
		ArrayList<TheaterDto> thList = mvdao.selectReserveThList(mvcode);
		
		Gson gson = new Gson();
		String thList_json = gson.toJson(thList);
		System.out.println(thList_json);
		
		return thList_json;
	}




	public String getScDateList(String mvcode, String thcode) {
		System.out.println("MovieService.getScDateList() 호출");
		System.out.println("선택한 영화 코드 : " + mvcode);
		System.out.println("선택한 극장 코드 : " + thcode);
		ArrayList<ScheduleDto> scDateList = mvdao.selectReserveScDateList(mvcode, thcode);
		Gson gson = new Gson();
		String scDateList_json = gson.toJson(scDateList);
		System.out.println(scDateList_json);
		return scDateList_json;
	}




	public String getScRoomTimeList(String mvcode, String thcode, String scdate) {
		System.out.println("MovieService.getScDateList() 호출");
		System.out.println("선택한 영화 코드 : " + mvcode);
		System.out.println("선택한 극장 코드 : " + thcode);
		System.out.println("선택한 날짜 : " + scdate);
		ArrayList<ScheduleDto> scRoomTimeList = mvdao.selectReserveScRoomTimeList(mvcode, thcode, scdate);
		Gson gson = new Gson();
		String scRoomTimeList_json = gson.toJson(scRoomTimeList);
		System.out.println(scRoomTimeList_json);
		return scRoomTimeList_json;
	}




	public ModelAndView movieReservation(RedirectAttributes ra, ReservationDto reInfo) {
		System.out.println("movieReservation.getScDateList() 호출");
		ModelAndView mav = new ModelAndView();
		
		//예매코드 생성
		String recode = "RE";
		String maxRecode = mvdao.getMaxRecode();
		if(maxRecode == null) {
			recode = recode + "01";
		} else {
			maxRecode = maxRecode.substring(2); // 'RE02' >> '02' 
			int codeNum = Integer.parseInt(maxRecode) + 1;
			if( codeNum < 10) {
				recode = recode + "0" + codeNum;
			}  else {
				recode = recode + codeNum;
			}
		}
		reInfo.setRecode(recode);
		System.out.println("예매정보");
		System.out.println(reInfo);
		
		mvdao.insertReservationInfo(reInfo);
		
		ReserveInfoDto reserveInfo = mvdao.selectResevationInfo(recode);
		
		ra.addFlashAttribute("reserveInfo", reserveInfo);
		mav.setViewName("redirect:/movieMain");
		
		
		return mav;
	}
	
	//예매내역 조회
	public ModelAndView movieReservationList(RedirectAttributes ra) {
		System.out.println("movieReservation.getScDateList() 호출");
		ModelAndView mav = new ModelAndView();
		//예매자 아이디 
		String remid = (String)session.getAttribute("loginId");
		System.out.println(remid);
		
		if( remid == null) {
			ra.addFlashAttribute("msg", "로그인 후 이용 가능 합니다.");
			mav.setViewName("redirect:/movieMain");
		} else {
			ArrayList<ReserveInfoDto> reservList = mvdao.selectReservationList(remid);
			for(int i = 0; i < reservList.size(); i++) {
				
				ReviewDto review = mvdao.selectReviewInfo( reservList.get(i).getRecode());
				if(review != null) {
					String rvcomment = review.getRvcomment();
					rvcomment = rvcomment.replace("\r\n", "<br>");
					rvcomment = rvcomment.replace(" ", "&nbsp;");
					review.setRvcomment(rvcomment);
				}
				reservList.get(i).setReview(review);
			}
			System.out.println(reservList);
			mav.addObject("reservList", reservList);
			mav.setViewName("movie/ReservationList");
		}
		
		return mav;
	}




	public ModelAndView reservationCancel(RedirectAttributes ra, String recode) {
		System.out.println("movieReservation.reservationCancel() 호출");
		ModelAndView mav = new ModelAndView();
		
		System.out.println("취소할 예매코드 : " + recode);
		
		mvdao.deleteReservation(recode);
		
		ra.addFlashAttribute("msg", "예매가 취소 되었습니다.");
		
		mav.setViewName("redirect:/movieReservationList");
		
		return mav;
	}

	public ModelAndView reviewWrite(RedirectAttributes ra, ReviewDto review) {
		System.out.println("movieReservation.reviewWrite() 호출");
		ModelAndView mav = new ModelAndView();
		System.out.println("관람평 정보 : " + review);
		mvdao.insertReview(review);
		
		ra.addFlashAttribute("msg", "관람평이 작성 되었습니다.");
		mav.setViewName("redirect:/movieReservationList");
		
		return mav;
	}

	public ModelAndView movieSearch(String searchText) {
		System.out.println("movieReservation.movieSearch() 호출");
		ModelAndView mav = new ModelAndView();
		System.out.println("입력한 검색어 : " + searchText);
		
		//영화 검색 목록
		ArrayList<MovieDto> searchMvList = mvdao.selectSearchMvList(searchText,"movie");
		System.out.println(searchMvList);
		
		//예매가능한 영화 검색 목록
		ArrayList<MovieDto> searchReMvList = mvdao.selectSearchMvList(searchText, "schedule");
		System.out.println(searchReMvList);
		
		mav.addObject("searchMvList", searchMvList);
		mav.addObject("searchReMvList", searchReMvList);
		mav.setViewName("movie/MovieSearchResult");
		return mav;
	}










}















