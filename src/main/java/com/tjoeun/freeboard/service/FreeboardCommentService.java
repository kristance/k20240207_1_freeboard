package com.tjoeun.freeboard.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

import com.tjoeun.freeboard.dao.FreeboardCommentDAO;
import com.tjoeun.freeboard.mybatis.MySession;
import com.tjoeun.freeboard.vo.FreeboardCommentList;
import com.tjoeun.freeboard.vo.FreeboardCommentVO;

public class FreeboardCommentService {

	private static FreeboardCommentService instance = new FreeboardCommentService();
	private FreeboardCommentService() {
	}
	public static FreeboardCommentService getInstance () {
		return instance;
	}
	
	
//	commentOK.jsp에서 호출되는 댓글로 저장할 정보가 저장된 객체를 넘겨받고 mapper를 얻어온 후
//	FreeboardCommentDAO 클래스의 댓글을 저장하는 insert sql 명령을 실행하는 메소드를 호출하는 메소드
	
	public boolean insertComment(FreeboardCommentVO co) {
		System.out.println("FreeboardCommentService 클래스의 insertComment() 메소드 실행");
		SqlSession mapper = MySession.getSession();
		
		int result = FreeboardCommentDAO.getInstance().insertComment(mapper, co);
		System.out.println("result : " + result);
		if (result == 1) {
			mapper.commit();
			mapper.close();
			return true;
		} else {
			mapper.close();
			return false;
		}
		
	}
	
	
//	list.jsp에서 호출되는 공지글 또는 메인글의 글번호를 넘겨받고 mapper를 얻어온 후
//	FreeboardCommentDAO 클래스의 공지글 또는 메인글의 댓글 갯수를 얻어오는 select sql
//	명령을 실행하는 메소드를 호출하는 메소드
	public int commentCount (int idx) {
		System.out.println("FreeboardCommentService 클래스의 commentCount() 메소드 실행");
		SqlSession mapper = MySession.getSession();
		
		int commentCount = FreeboardCommentDAO.getInstance().commentCount(mapper, idx);
		
		mapper.commit();
		mapper.close();
		return commentCount;
	}
	
	
//	selectByIdx.jsp에서 호출되는 댓글 목록을 얻어올 공지글 또는 메인글의 글번호를 넘겨받고
//	mapper를 얻어온 후 FreeboardCommentDAO 클래스의 공지글 또는 메인글의 댓글을 얻어오는
//	select sql 명령을 실행하는 메소드를 호출하는 메소드
	public FreeboardCommentList selectCommentList (int idx) {
		System.out.println("FreeboardCommentService 클래스의 selectCommentList() 메소드 실행");
		SqlSession mapper = MySession.getSession();
		
		FreeboardCommentList freeboardCommentList = new FreeboardCommentList();
		freeboardCommentList.setList(FreeboardCommentDAO.getInstance().selectCommentList(mapper, idx));
		
		mapper.commit();
		mapper.close();
		return freeboardCommentList;
	}
	
	
//	commentOK.jsp에서 호출되는 댓글을 수정할 정보가 저장된 객체를 넘겨받고 mapper를 얻어온 후
//	FreeboardCommentDAO 클래스의 댓글을 수정하는 update sql 명령을 실행하는 메소드를 호출하는 메소드 
	public boolean updateComment (FreeboardCommentVO co) {
		System.out.println("FreeboardCommentService 클래스의 updateComment() 메소드 실행");
		SqlSession mapper = MySession.getSession();
		
//		댓글을 수정하기 위해서 입력한 비밀번호와 수정할 댓글의 비밀번호를 비교하기 위해서 수정할
//		댓글을 얻어온다.
		
		FreeboardCommentVO original = 
			FreeboardCommentDAO.getInstance().selectCommentByIdx(mapper, co.getIdx());
//		System.out.println(original);
		if ( original.getPassword().trim().equals(co.getPassword().trim()) ) {
			FreeboardCommentDAO.getInstance().updateComment(mapper, co);
			mapper.commit();
			mapper.close();
			return true;
		} else {
			mapper.close();
			return false;
		}
		
	}
	

//	commentOK.jsp에서 호출되는 댓글을 삭제할 정보가 저장된 객체를 넘겨받고 mapper를 얻어온 후
//	FreeboardCommentDAO 클래스의 댓글을 삭제하는 delete sql 명령을 실행하는 메소드를 호출하는 메소드 
	public boolean deleteComment (FreeboardCommentVO co) {
		System.out.println("FreeboardCommentService 클래스의 deleteComment() 메소드 실행");
		SqlSession mapper = MySession.getSession();
		
		FreeboardCommentVO original = 
				FreeboardCommentDAO.getInstance().selectCommentByIdx(mapper, co.getIdx());
//		System.out.println(original);
		if ( original.getPassword().trim().equals(co.getPassword().trim()) ) {
			FreeboardCommentDAO.getInstance().deleteComment(mapper, co);
			mapper.commit();
			mapper.close();
			return true;
		} else {
			mapper.close();
			return false;
		}
		
		
		
	}
	
	
	
	
}
