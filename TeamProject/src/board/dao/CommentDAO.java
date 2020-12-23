package board.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import board.dto.CommentDTO;

public class CommentDAO {
	private static SqlSessionFactory factory;
	private static CommentDAO instance;
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
	
	public static CommentDAO getInstance() {
		if(instance==null) {
			synchronized(CommentDAO.class) {
				instance=new CommentDAO();
			}
		}
		return instance;
	}

	public int commentInsert(CommentDTO dto) {
		SqlSession session=factory.openSession();
		int n=0;
		try {
			n=session.insert("my.commentMapper.commentInsert",dto);
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

	public List<CommentDTO> getCommentList(int comment_boardnum) {
		SqlSession session=factory.openSession();
		List<CommentDTO> list=session.selectList("my.commentMapper.getCommentList",comment_boardnum);
		session.close();
		return list;
	}

	public void commentDelete(int comment_num) {
		SqlSession session=factory.openSession();
		int n=0;
		try {
			n=session.delete("my.commentMapper.boardCommentDelete",comment_num);
			if(n>0)
				session.commit();
		}catch(Exception e) {
			e.printStackTrace();
			session.rollback();
		}finally {
			session.close();
		}
	}

	public CommentDTO getComment(int comment_num) {
		SqlSession session=factory.openSession();
		CommentDTO dto=session.selectOne("my.commentMapper.getComment",comment_num);
		session.close();
		return dto;
	}

	public void commentUpdqte(CommentDTO dto) {
		SqlSession session=factory.openSession();
		int n=0;
		try {
			n=session.update("my.commentMapper.commentUpdate",dto);
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
}
