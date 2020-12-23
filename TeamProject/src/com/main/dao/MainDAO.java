package com.main.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import board.dto.Board;

public class MainDAO {
	private static SqlSessionFactory factory;

	static {
		try {
			String resource = "mybatis/mybatis-config.xml";
			Reader reader = Resources.getResourceAsReader(resource);
			factory = new SqlSessionFactoryBuilder().build(reader);// default에 연결(environment id="dev")
		} catch (IOException e) {}
	}

	public List<Board> getBestBoard() {
		SqlSession session = factory.openSession();
		List<Board> list = session.selectList("my.mainMapper.getBestList");
		
		session.close();
		return list;
	}

}