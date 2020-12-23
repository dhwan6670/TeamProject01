package party.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dto.Board;
import party.dao.PartyDAO;

@WebServlet(name = "PartySearchList", urlPatterns = { "/partySearchList" })
public class PartySearchList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int pg = Integer.parseInt(request.getParameter("pg"));
		String title = "%"+request.getParameter("search")+"%";
		String combo = request.getParameter("combo");
		//System.out.println("combo : "+combo);
		
		PartyDAO dao = new PartyDAO();
		List<Board> list = null;
		if(combo.equals("title")) {
			list = dao.getSearchTitleList(title);
		}else if(combo.equals("content")){
			list = dao.getSearchContentList(title);
		}else if(combo.equals("titlecontent")) {
			list = dao.getSearchTitleContentList(title);
		}else if(combo.equals("id")) {
			list = dao.getSearchIdList(title);
		}
		if(list!=null) {
			System.out.println("검색 리스트 OK");
			request.setAttribute("list", list);
			request.setAttribute("pg", pg);
			RequestDispatcher rd = request.getRequestDispatcher("party_board/PartySearchList.jsp");
			rd.forward(request, response);
		}
	}
}
