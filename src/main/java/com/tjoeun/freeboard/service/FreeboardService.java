package com.tjoeun.freeboard.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.tjoeun.freeboard.dao.FreeboardDAO;
import com.tjoeun.freeboard.mybatis.MySession;
import com.tjoeun.freeboard.vo.FreeboardList;
import com.tjoeun.freeboard.vo.FreeboardVO;

public class FreeboardService {

	
	private static FreeboardService instance = new FreeboardService();
	
	private FreeboardService() {
	}
	
	public static FreeboardService getInstance() {
		return instance;
	}
	
	
//	insertOK.jsp에서 호출되는 메인글이 저장된 객체를 넘겨받고 mapper를 얻어온 후 메인글을 저장하는
//	FreeboardDAO 클래스의 insert sql 명령을 실행하는 메소드를 호출하는 메소드
	public void insert (FreeboardVO vo) {
		System.out.println("FreeboardService 클래스의 insert() 메소드 실행");
		SqlSession mapper = MySession.getSession();
		
		FreeboardDAO.getInstance().insert(mapper, vo);
		
		mapper.commit();
		mapper.close();
		
	}
	
//	list.jsp에서 호출되는 브라우저에 출력할 페이지 번호를 넘겨받고 mapper를 얻어온 후 1페이지 분량의
//	메인글 목록을 얻어오는 FreeboardDAO 클래스의 select sql 명령을 실행하는 메소드를 호출하는 메소드
	public FreeboardList selectList(int currentPage) {
		System.out.println("FreeboardService 클래스의 selectList() 메소드 실행");
		SqlSession mapper = MySession.getSession();
		
		int pageSize = 10;
		int totalCount = FreeboardDAO.getInstance().selectCount(mapper); 
//		System.out.println(totalCount);
		
		FreeboardList freeboardList = new FreeboardList(pageSize, totalCount, currentPage);
//		System.out.println(freeboardList);
		
		HashMap<String, Integer> hmap = new HashMap<String, Integer>();
		hmap.put("startNo", freeboardList.getStartNo());
		hmap.put("endNo", freeboardList.getEndNo());
		freeboardList.setList(FreeboardDAO.getInstance().selectList(mapper, hmap));
		
		mapper.close();
		return freeboardList;
	}
	
//	increment.jsp에서 호출되는 조회수를 증가시킬 글번호를 넘겨받고, mapper를 얻어온 후 메인글의 조회수를 증가시키는
//	FreeboardDAO 클래스의 update sql 명령을 실행하는 메소드를 호출하는 메소드
	public void increment(int idx) {
		System.out.println("FreeboardService 클래스의 increment() 메소드 실행");
		SqlSession mapper = MySession.getSession();
		
		FreeboardDAO.getInstance().increment(mapper, idx);
		
		mapper.commit();
		mapper.close();
	}
	
//	selectByIdx.jsp에서 호출되는 조회수를 증가시킨 글번호를 넘겨받고 mapper를 얻어온 후 메인글
//	1건을 얻어오는 FreeboardDAO 클래스의 select sql 명령을 실행하는 메소드를 호출하는 메소드
	public FreeboardVO selectByIdx (int idx) {
		System.out.println("FreeboardService 클래스의 selectByIdx() 메소드 실행");
		
		SqlSession mapper = MySession.getSession();
		
		FreeboardVO vo = FreeboardDAO.getInstance().selectByIdx(mapper, idx);
		
		mapper.commit();
		mapper.close();
		return vo;
		
	}
	
//	deleteOK.jsp에서 호출되는 삭제할 글번호를 넘겨받고 mapper를 얻어온 후 메인글 1건을 삭제하는
//	FreeboardDAO 클래스의 delete sql 명령을 실행하는 메소드를 호출하는 메소드
	public void delete(int idx) {
		System.out.println("FreeboardService 클래스의 delete() 메소드 실행");
		SqlSession mapper = MySession.getSession();
		
		FreeboardDAO.getInstance().delete(mapper, idx);
		
		mapper.commit();
		mapper.close();
		
	}
	
	
	
//	updateOK.jsp에서 호출되는 수정할 정보가 저장된 객체를 넘겨받고 mapper를 얻어온 후 메인글 1건을 수정하는
//	FreeboardDAO 클래스의 update sql 명령을 실행하는 메소드를 호출하는 메소드
	public void update (FreeboardVO vo) {
		System.out.println("FreeboardService 클래스의 update() 메소드 실행");
		SqlSession mapper = MySession.getSession();
		
		
		FreeboardDAO.getInstance().update(mapper, vo);
		mapper.commit();
		mapper.close();
	}
	
	
//	 list.jsp에서 호출되는 mapper를 얻어온 후 공지글 얻어오는 FreeboardDAO 클래스의 select sql 명령을
//	실행하는 메소드를 호출하는 메소드
	public ArrayList<FreeboardVO> selectNotice() {
		System.out.println("FreeboardService 클래스의 selectNotice() 메소드 실행");
		SqlSession mapper = MySession.getSession();
		
		ArrayList<FreeboardVO> notice = FreeboardDAO.getInstance().selectNotice(mapper);
		System.out.println(notice);
		mapper.commit();
		mapper.close();
		return notice;
	}
	
	
	
	
	
	
	
	
}
