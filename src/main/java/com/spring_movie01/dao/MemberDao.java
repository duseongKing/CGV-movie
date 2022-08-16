package com.spring_movie01.dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.spring_movie01.dto.MemberDto;

public interface MemberDao {

	@Insert("INSERT INTO MEMBERS(MID, MPW, MNAME, MBIRTH, MEMAIL, MADDRESS, MPROFILE, MSTATE ) "
			+ "VALUES(#{mid}, #{mpw}, #{mname}, TO_DATE(#{mbirth},'YYYY-MM-DD'), #{memail}, #{maddress}, #{mprofile}, 1 )")
	int insertMember(MemberDto member);
	
	@Select("SELECT MID FROM MEMBERS WHERE MID = #{inputId}")
	String selectCheckMid(String inputId);
	
	@Select("SELECT MID, MPROFILE, MSTATE FROM MEMBERS WHERE MID = #{mid} AND MPW = #{mpw}")
	MemberDto selectMemberLogin(@Param("mid") String mid, @Param("mpw") String mpw);
	
	@Select("SELECT MID, MPW, MNAME, TO_CHAR(MBIRTH,'YYYY-MM-DD') AS MBIRTH , MEMAIL, MADDRESS, MPROFILE FROM MEMBERS WHERE MID = #{loginId}")
	MemberDto selectMemberInfo(String loginId);
	
	@Select("SELECT MID, MPROFILE FROM MEMBERS WHERE MID = #{mid}")
	MemberDto selectMemberKakao(String mid);

	@Insert("INSERT INTO MEMBERS(MID, MPW, MNAME, MEMAIL, MPROFILE, MSTATE ) "
			+ "VALUES(#{mid}, #{mpw}, #{mname}, #{memail}, #{mprofile}, 2 )")
	void insertMemberKakao(MemberDto member);
	
	
	
}
