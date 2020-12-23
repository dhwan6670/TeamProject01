package pic.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import board.dto.Board;
import board.dto.PartyRef;
import board.dto.PicCommDTO;


public class PicDAO {
	private static SqlSessionFactory factory;

	static {
		try {
			String resource = "mybatis/mybatis-config.xml";
			Reader reader = Resources.getResourceAsReader(resource);
			factory = new SqlSessionFactoryBuilder().build(reader);// default에 연결(environment id="dev")
		} catch (IOException e) {
		}
	}
	//글 등록
	public int insertPic(Board ob) {
		SqlSession session = factory.openSession();
		int n = 0;

		try {
			n = session.insert("my.picMapper.insertPic", ob);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return n;
	}
	//글 리스트 호출
	public List<Board> getList(Map<String, Object> map) {
		SqlSession session = factory.openSession();
		List<Board> list = session.selectList("my.picMapper.piclist",map);

		session.close();
		return list;
	}
	//글 상세 호출
	public Board selectPic(int board_num) {
		SqlSession session = factory.openSession();
		Board board = session.selectOne("my.picMapper.selectPic", board_num);
		session.close();
		return board;
	}

//페이징처리----------------------------------------------------------------------------------
	public int getTotalArticle() {
		SqlSession session = factory.openSession();
		int n = 0;
		 
		try {
			n = session.selectOne("my.picMapper.picPaging");
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		
		return n;
	}
//댓글관련
	public int insertComment(PicCommDTO picCom) {
		// 댓글넣기
		SqlSession session = factory.openSession();
		int n = 0;
		try {
			n = session.insert("my.picMapper.insertPicCom", picCom);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		
		return n;
	}
	//댓글 리스트에 불러오기
	public List<PicCommDTO> selectPicCom(int board_num) {
		SqlSession session = factory.openSession();
		List<PicCommDTO> list = session.selectList("my.picMapper.selectPicCom",board_num);

		session.close();
		
		return list;
	}

	
}
