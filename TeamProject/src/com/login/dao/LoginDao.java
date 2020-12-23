package com.login.dao;

import java.io.IOException;
import java.io.Reader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.login.dto.LoginDto;

public class LoginDao {
	private static SqlSessionFactory factory;

	static {
		try {
			String resource = "mybatis/mybatis-config.xml";
			Reader reader = Resources.getResourceAsReader(resource);
			factory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
		}
	}

	// 로그인
	public LoginDto getLoginUser(String member_id, String member_password) {
		SqlSession session = factory.openSession();
		LoginDto dto = new LoginDto(member_id, member_password, "", "", "", "", 0, "", "");
		LoginDto entity = session.selectOne("mybatis.LoginMapper.getLoginUser", dto);
		session.close();
		return entity;

	}

	// 회원 가입
	public int registerUser(LoginDto dto) {
		System.out.println(dto.getMember_id());
		SqlSession session = factory.openSession();
		int n = 0;
		try {
			n = session.insert("mybatis.LoginMapper.registerUser", dto);
			if (n > 0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return n;
	}

	// 회원정보 수정
	public void userUpdate(LoginDto dto) {
		SqlSession session = factory.openSession();
		int n = 0;
		try {
			n = session.update("mybatis.LoginMapper.userUpdate", dto);
			if (n > 0) {
				session.commit();
				System.out.println("회원정보수정n: " + n);
			}
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
	}

	// 회원 탈퇴
	public int userDelete(String id) {
		SqlSession session = factory.openSession();
		int n = 0;
		try {
			n = session.delete("mybatis.LoginMapper.userDelete", id);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return n;
	}

	// 아이디중복체크
	public int userIdCheck(String member_id) {
		SqlSession session = factory.openSession();
		int n = 0;
		try {
			n = session.selectOne("mybatis.LoginMapper.userIdCheck", member_id);
			if (n > 0)
				session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return n;

	}

	// 수정후에 마이페이지 갱신전 해당 아이디에 대한 정보 찾기
	public LoginDto userSearch(LoginDto dto) {
		SqlSession session = factory.openSession();
		LoginDto ob = new LoginDto();
		ob = session.selectOne("mybatis.LoginMapper.userSearch", dto);

		session.close();
		return ob;
	}

	public LoginDto getUserPage(String id) {
		SqlSession session = factory.openSession();
		LoginDto ob = new LoginDto();
		ob = session.selectOne("mybatis.LoginMapper.getUserPage", id);

		session.close();
		return ob;
	}

	//아이디 찾기
	public LoginDto idSearch(LoginDto ob) {
		SqlSession session = factory.openSession();
		LoginDto dto = new LoginDto();
		dto = session.selectOne("mybatis.LoginMapper.idSearch", ob);
		
		session.close();
		return dto;
	}
	//비밀번호 찾기
	public LoginDto pwdSearch(LoginDto to) {
		SqlSession session = factory.openSession();
		LoginDto dto = new LoginDto();
		dto = session.selectOne("mybatis.LoginMapper.pwdSearch", to);
		
		session.close();
		return dto;
	}

}
