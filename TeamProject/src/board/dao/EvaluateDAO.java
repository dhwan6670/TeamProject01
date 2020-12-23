package board.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import board.dto.EvaluateDTO;

public class EvaluateDAO {
	private static SqlSessionFactory factory;
	private static EvaluateDAO instance;
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
	
	public static EvaluateDAO getInstance() {
		if(instance==null) {
			synchronized (EvaluateDAO.class) {
				instance=new EvaluateDAO();
			}
		}
		return instance;
	}

	public EvaluateDTO getInfo(String game) {
		SqlSession session=factory.openSession();
		EvaluateDTO dto=session.selectOne("my.evalMapper.getInfo",game);
		session.close();
		return dto;
	}

	public List<EvaluateDTO> getEvaluate(String game) {
		SqlSession session=factory.openSession();
		List<EvaluateDTO> list=session.selectList("my.evalMapper.getEvaluate",game);
		return list;
	}

	public int evalInsert(EvaluateDTO dto) {
		SqlSession session=factory.openSession();
		int n=0;
		try {
			n=session.insert("my.evalMapper.evalInsert",dto);
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

	public EvaluateDTO getComment(int eval_num) {
		SqlSession session=factory.openSession();
		EvaluateDTO dto=session.selectOne("my.evalMapper.getComment",eval_num);
		session.close();
		return dto;
	}

	public void evalUpdate(EvaluateDTO dto) {
		SqlSession session=factory.openSession();
		int n=0;
		try {
			n=session.update("my.evalMapper.evalUpdate",dto);
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

	public void evalDelete(int eval_num) {
		SqlSession session=factory.openSession();
		int n=0;
		try {
			n=session.delete("my.evalMapper.evalDelete",eval_num);
			if(n>0)
				session.commit();
		}catch(Exception e) {
			e.printStackTrace();
			session.rollback();
		}finally {
			session.close();
		}
	}
}
