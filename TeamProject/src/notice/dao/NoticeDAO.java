package notice.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import board.dto.Board;

public class NoticeDAO {
	private static SqlSessionFactory factory;

	static {
		try {
			String resource = "mybatis/mybatis-config.xml";
			Reader reader = Resources.getResourceAsReader(resource);
			factory = new SqlSessionFactoryBuilder().build(reader);// default에 연결(environment id="dev")
		} catch (IOException e) {}
	}

	public List<Board> getNoticeList() {
		SqlSession session = factory.openSession();
		List<Board> list = session.selectList("my.noticeMapper.getNoticeList");
		
		session.close();
		return list;
	}

	public int insertNotice(Board ob) {
		SqlSession session  = factory.openSession();
		int n = 0;
		
		try {
			n = session.insert("my.noticeMapper.insertNotice", ob);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return n;
	}

	public Board searchNotice(int num) {
		SqlSession session = factory.openSession();
		Board ob = session.selectOne("my.noticeMapper.searchNotice", num);
		
		session.close();
		return ob;
	}

	public int updateNotice(Board ob) {
		SqlSession session = factory.openSession();
		int n = 0;
		
		try {
			n =session.insert("my.noticeMapper.updateNotice", ob);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return n;
	}

	public void noticeHitUpdate(int num) {
		SqlSession session = factory.openSession();
		
		try {
			session.update("my.noticeMapper.noticeHitUpdate", num);
			System.out.println("notice hit update OK");
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
	}

	public int noticeDelete(int num) {
		SqlSession session = factory.openSession();
		int n = 0;
		
		try {
			n = session.delete("my.noticeMapper.noticeDelete", num);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return n;
	}

	public int getNoticeCount() {
		SqlSession session = factory.openSession();
		int count = session.selectOne("my.noticeMapper.getNoticeCount");
		
		session.close();
		return count;
	}
	
	
}
