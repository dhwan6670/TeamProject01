package party.dao;

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


public class PartyDAO {
	private static SqlSessionFactory factory;

	static {
		try {
			String resource = "mybatis/mybatis-config.xml";
			Reader reader = Resources.getResourceAsReader(resource);
			factory = new SqlSessionFactoryBuilder().build(reader);// default에 연결(environment id="dev")
		} catch (IOException e) {
		}
	}

	public int insertParty(Board ob) {
		SqlSession session = factory.openSession();
		int n = 0;

		try {
			n = session.insert("my.partyMapper.insertParty", ob);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return n;
	}

	public List<Board> getList(Map<String, Object> map) {
		SqlSession session = factory.openSession();
		List<Board> list = session.selectList("my.partyMapper.partylist",map);

		session.close();
		return list;
	}

	public Board viewParty(int num) {
		// 게시물 가져오기전에 조회수 업데이트---------------------------
		SqlSession session = factory.openSession();

		try {
			session.update("my.partyMapper.updateHit", num);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		// 게시물번호로 하나의 게시물 가져오는코드-------------------------
		session = factory.openSession();
		Board ob = session.selectOne("my.partyMapper.viewParty", num);
		session.close();
		return ob;

	}

	public int updateParty(Board ob) {
		SqlSession session = factory.openSession();
		int n = 0;

		try {
			n = session.update("my.partyMapper.updateParty", ob);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}

		return n;
	}

	public int deleteParty(int num) {
		//게시물 삭제시 리플과 추천테이블 정보도 같이 삭제
		SqlSession session = factory.openSession();
		int n = 0;

		try {
			n = session.delete("my.partyMapper.deleteParty", num);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		
		session = factory.openSession();

		try {
			session.delete("my.partyMapper.PartyRefDel", num);
			if(n > 0) {
				session.commit();
				System.out.println("게시물삭제(댓글정보)");
				}
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}

		session = factory.openSession();
		try {
			session.delete("my.partyMapper.PartyRecDel", num);
			if(n > 0) {
				session.commit();
				System.out.println("게시물삭제(추천정보)");
				}
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		
		return n;
	}

	public int updateReply(int pseq) {
		// 댓글삭제시 board_party의 reply수 1 감소후 업데이트
		SqlSession session = factory.openSession();
		int n = 0;

		try {
			n = session.update("my.partyMapper.minusPartyReply", pseq);
			session.commit();
			//System.out.println("리플수 1감소");
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return n;
	}
	//검색관련
	public List<Board> getSearchTitleList(String title) {
		SqlSession session = factory.openSession();
		List<Board> list = session.selectList("my.partyMapper.partySearchList", title);
		
		session.close();
		return list;
	}
	public List<Board> getSearchContentList(String title) {
		SqlSession session = factory.openSession();
		List<Board> list = session.selectList("my.partyMapper.partySearchContentList", title);
		
		session.close();
		return list;
	}
	public List<Board> getSearchTitleContentList(String title) {
		SqlSession session = factory.openSession();
		List<Board> list = session.selectList("my.partyMapper.partySearchTitleContentList", title);
		
		session.close();
		return list;
	}
	public List<Board> getSearchIdList(String title) {
		SqlSession session = factory.openSession();
		List<Board> list = session.selectList("my.partyMapper.partySearchIdList", title);
		
		session.close();
		return list;
	}
//댓글관련 쿼리문연결----------------------------------------------------------------

	public int insertRef(PartyRef ob) {
		// 댓글넣기
		SqlSession session = factory.openSession();
		int n = 0;
		try {
			n = session.insert("my.partyMapper.insertPartyRef", ob);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		// 댓글넣으면 board_party테이블의 reply수 1증가
		session = factory.openSession();
		n = 0;
		try {
			n = session.update("my.partyMapper.updatePartyReply", ob.getRef_pseq());
			session.commit();
			System.out.println("리플수 업데이트");
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}

		return n;
	}

	public List<PartyRef> getRefList(int num) {
		SqlSession session = factory.openSession();
		List<PartyRef> list = session.selectList("my.partyMapper.partyRefList",num);

		session.close();

		return list;
	}

	public int deleteRef(int num) {
		// 댓글 삭제
		SqlSession session = factory.openSession();
		int n = 0;

		try {
			n = session.delete("my.partyMapper.deletePartyRef", num);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}

		return n;
	}

	public PartyRef SearchRef(int num) {
		SqlSession session = factory.openSession();
		PartyRef ref = session.selectOne("my.partyMapper.searchPartyRef", num);

		session.close();

		return ref;
	}

	public int getUpdateRef(PartyRef ob) {
		SqlSession session = factory.openSession();
		int n = 0;

		try {
			n = session.update("my.partyMapper.updatePartyRef", ob);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return n;
	}
//게시물 추천관련----------------------------------------------------------------------------
	public int recCheck(Map<String, Object> map) {
		SqlSession session = factory.openSession();
		int n = 0;
		
		try {
			n = session.selectOne("my.partyMapper.recCheck", map);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		
		return n;
	}

	public void recUpdate(Map<String, Object> map) {
		SqlSession session = factory.openSession();
		
		try {
			session.update("my.partyMapper.recUpdate", map);
			session.commit();
			System.out.println("REC UPDATE");
		}catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		}finally {
			session.close();
		}
		//추천후 rec테이블에 정보입력
		session = factory.openSession();
		
		try {
			session.insert("my.partyMapper.recInsert", map);
			session.commit();
		}catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		}finally {
			session.close();
		}
		
	}

	public void recDelete(Map<String, Object> map) {
		//rec테이블 정보 삭제
		SqlSession session = factory.openSession();
		try {
			session.delete("my.partyMapper.recDelete", map);
			session.commit();
			System.out.println("REC DELETE");
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		
		//삭제후 board_party의 rec 1감소
		session = factory.openSession();
		try {
			session.update("my.partyMapper.recMinus", map);
			session.commit();
			System.out.println("REC -1");
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
	}

	public int recCount(int no) {
		SqlSession session = factory.openSession();
		int n = 0;
		
		try {
			n = session.selectOne("my.partyMapper.recCount", no);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		
		return n;
	}
//페이징처리----------------------------------------------------------------------------------
	public int getTotalArticle() {
		SqlSession session = factory.openSession();
		int n = 0;
		
		try {
			n = session.selectOne("my.partyMapper.partyPaging");
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		
		return n;
	}
}
