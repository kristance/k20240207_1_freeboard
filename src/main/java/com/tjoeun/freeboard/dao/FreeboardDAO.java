package com.tjoeun.freeboard.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.tjoeun.freeboard.vo.FreeboardVO;

public class FreeboardDAO {

	private static FreeboardDAO instance = new FreeboardDAO();
	private FreeboardDAO() {
	}
	public static FreeboardDAO getInstance() {
		return instance;
	}
	
	
	
//	FreeboardService 클래스에서 호출되는 mapper와 메인글이 저장된 객체를 넘겨받고 메인글을 저장하는
//	freeboard xml 파일의 insert sql 명령을 실행하는 메소드
	public void insert(SqlSession mapper, FreeboardVO vo) {
		System.out.println("FreeboardDAO 클래스의 insert() 메소드 실행");
		mapper.insert("insert", vo);
		
	}
	
//	FreeboardService 클래스에서 호출되는 mapper를 넘겨받고 메인글 전체 갯수를 얻어오는
//	freeboard xml 파일의	select sql 명령을 실행하는 메소드
	public int selectCount(SqlSession mapper) {
		System.out.println("FreeboardDAO 클래스의 selectCount() 메소드 실행");
		return (int) mapper.selectOne("selectCount");
	}
	
	
//	FreeboardService 클래스에서 호출되는 mapper와 1페이지 분량의 시작 인덱스, 끝 인덱스가 저장된
//	HashMap 객체를 넘겨받고 1페이지 분량의 메인글 목록을 얻어오는 freeboard.xml 파일의 select sql
//	명령을 실행하는 메소드
	public ArrayList<FreeboardVO> selectList(SqlSession mapper, HashMap<String, Integer> hmap) {
		System.out.println("FreeboardDAO 클래스의 selectList() 메소드 실행");

		return (ArrayList<FreeboardVO>) mapper.selectList("selectList", hmap);
	}
	
	
//	FreeboardService 클래스에서 호출되는 mapper와 조회수를 증가시킬 글번호를 넘겨받고, 조회수를
//	증가시키는 freeboard.xml 파일의 update sql 명령을 실행하는 메소드
	public void increment(SqlSession mapper, int idx) {
		System.out.println("FreeboardDAO 클래스의 increment() 메소드 실행");
		mapper.update("increment", idx);
	}
	
	
//	FreeboardService 클래스에서 호출되는 mapper와 조회수를 증가시킨 글번호를 넘겨받고,
//	메인글 1건을 얻어오는 freeboard.xml 파일의 select sql 명령을 실행하는 메소드
	public FreeboardVO selectByIdx(SqlSession mapper, int idx) {
		System.out.println("FreeboardDAO 클래스의 selectByIdx() 메소드 실행");
		return (FreeboardVO) mapper.selectOne("selectByIdx", idx); // 글 1건을 얻어오는거라 selectOne을 사용; selectList가 아님
	}
	
	
//	FreeboardService 클래스에서 호출되는 mapper와 삭제할 글번호를 넘겨받고 메인글 1건을 삭제하는
//	freeboard.xml 파일의 delete sql 명령을 실행하는 메소드
	public void delete(SqlSession mapper, int idx) {
		System.out.println("FreeboardDAO 클래스의 delete() 메소드 실행");
		mapper.delete("delete", idx);
		
	}
	
	
	
//	FreeboardService 클래스에서 호출되는 mapper와 수정할 정보가 저장된 객체를 넘겨받고 메인글 1건을 수정하는
//	freeboard.xml 파일의 update sql 명령을 실행하는 메소드
	public void update(SqlSession mapper, FreeboardVO vo) {
		System.out.println("FreeboardDAO 클래스의 update() 메소드 실행");
		mapper.update("update", vo);
		
		
	}
	
	
//	FreeboardService 클래스에서 호출되는 mapper를 넘겨받고 공지글 목록을 얻어오는 freeboard.xml
//	select xml 명령을 실행하는 메소드
	public ArrayList<FreeboardVO> selectNotice(SqlSession mapper) {
		System.out.println("FreeboardDAO 클래스의 selectNotice() 메소드 실행");
		return (ArrayList<FreeboardVO>) mapper.selectList("selectNotice");
	}
	
	
	
	
	
}
