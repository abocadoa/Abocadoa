package com.edu.springboot.jdbc;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

/*
 컨트롤러와 매퍼(XML파일) 사이에서 매개역할을 하는 서비스 인터페이스.
 JdbcTemplate에서는 @Service를 사용했지만
 마이바티스에서는 @Mapper를 사용한다.
 */
@Mapper
public interface IMemberService {
	//회원 목록
		public List<MemberDTO> select();
		//회원 입력
		public int insert(MemberDTO memberDTO);
		//회원 조회
		public MemberDTO selectOne(MemberDTO memberDTO);
		//회원정보 수정
		public int update(MemberDTO memberDTO);
		//회원정보 삭제
		public int delete(MemberDTO memberDTO);
		
		public MemberDTO login(String id, String pass);
}
