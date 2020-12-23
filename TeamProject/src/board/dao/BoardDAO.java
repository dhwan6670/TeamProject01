package board.dao;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class BoardDAO {
	//오류수정용 주석
	private static SqlSessionFactory factory;
	private static BoardDAO instance;
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
	
	public static BoardDAO getInstance() {
		if(instance==null) {
			synchronized(BoardDAO.class) {
				instance=new BoardDAO();
			}
		}
		return instance;
	}
	
	public String getCode(int num) {
		SqlSession session=factory.openSession();
		String dto=session.selectOne("my.boardMapper.getCode", num);
		session.close();
		return dto;
	}

}
