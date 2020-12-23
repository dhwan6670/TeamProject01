package board.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import board.dto.Board;

public class FreeDAO {
	private static SqlSessionFactory factory;
	private static FreeDAO instance;
	static {
		try {
			String resource="mybatis/mybatis-config.xml";
			Reader reader=Resources.getResourceAsReader(resource);
			factory=new SqlSessionFactoryBuilder().build(reader);		//default에 연결
			//factory=new SqlSessionFactoryBuilder().build(reader,"env"); env에 연결
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public static FreeDAO getInstance() {
		if(instance==null) {
			synchronized(FreeDAO.class) {
				instance=new FreeDAO();
			}
		}
		return instance;
	}

	public int getTotalArticle() {
		SqlSession session=factory.openSession();
		int n=session.selectOne("my.freeMapper.getTotalArticle");
		session.close();
		return n;
	}

	public List<Board> getBoardList(Map<String, Integer> map) {
		SqlSession session=factory.openSession();
		List<Board> list=session.selectList("my.freeMapper.getBoardList",map);
		session.close();
		return list;
	}

	public int boardInsert(Board dto) {
		SqlSession session=factory.openSession();
		int n=0;
		try {
			n=session.insert("my.freeMapper.boardInsert",dto);
			if(n>0) {
				session.commit();
			}
		}catch(Exception e) {
			e.printStackTrace();
			session.rollback();
		}finally {
			session.close();
		}
		return n;
	}

	public void updateHit(int num) {
		SqlSession session=factory.openSession();
		int n=0;
		try {
			n=session.update("my.freeMapper.updateHit",num);
			if(n>0) {
				session.commit();
			}
		}catch(Exception e) {
			e.printStackTrace();
			session.rollback();
		}finally {
			session.close();
		}
	}

	public Board getBoard(int num) {
		SqlSession session=factory.openSession();
		Board dto=session.selectOne("my.freeMapper.getBoard", num);
		session.close();
		return dto;
	}

	public void boardUpdate(Board dto) {
		SqlSession session=factory.openSession();
		int n=0;
		try {
			n=session.update("my.freeMapper.boardUpdate",dto);
			if(n>0) {
				session.commit();
			}
		}catch(Exception e) {
			e.printStackTrace();
			session.rollback();
		}finally {
			session.close();
		}
	}

	public void boardDelete(int num) {
		SqlSession session=factory.openSession();
		int n=0;
	    try{
	       n=session.delete("my.freeMapper.boardDelete",num);
	       if(n > 0)
	          session.commit();
	    }catch(Exception e) {
	       e.printStackTrace();
	       session.rollback();
	    }finally {
	       session.close();
	    }
	}

	
}
