package com.spring_movie01.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring_movie01.dto.MemberDto;
import com.spring_movie01.dto.MovieDto;
import com.spring_movie01.dto.ScheduleDto;
import com.spring_movie01.dto.TheaterDto;

public interface AdminDao {

	ArrayList<MovieDto> selectMovieList();

	int updateMvState(@Param("mvcode") String mvcode, @Param("mvstate") int mvstate);

	MovieDto selectMvInfo(String mvcode);

	ArrayList<TheaterDto> selectTheaterList();

	int updateThState(@Param("thcode") String thcode, @Param("thstate")int thstate);

	TheaterDto selectThInfo(String thcode);

	int updateTheaterInfo(TheaterDto theater);

	ArrayList<ScheduleDto> selectScRoomTime(@Param("thcode")String thcode, @Param("scdate") String scdate);

	void insertSchedule(ScheduleDto registSc);

	ArrayList<MemberDto> selectMemberList();

	int updateMemberState(@Param("mid") String mid, @Param("mstate") int mstate);

	MemberDto selectMemberInfo(String mid);

}
