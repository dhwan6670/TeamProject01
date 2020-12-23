package com.main.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.main.dao.MainDAO;

import board.dto.Board;
import notice.dao.NoticeDAO;



@WebServlet(name = "BestBoard", urlPatterns = { "/bestBoard" })
public class MainBestBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MainDAO dao = new MainDAO();
		List<Board> list = dao.getBestBoard();
		
		NoticeDAO nDao = new NoticeDAO();
		List<Board> nList = nDao.getNoticeList();
		
		if(list != null) {
			//System.out.println("객체받음");
			request.setAttribute("list", list);
			request.setAttribute("nList", nList);
			RequestDispatcher rd = request.getRequestDispatcher("main.jsp");
			rd.forward(request, response);
		}
		
	}

}