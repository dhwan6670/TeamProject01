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
import board.dto.PartyRef;
import party.dao.PartyDAO;

@WebServlet(name = "PartyView", urlPatterns = { "/partyView" })
public class PartyView extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int num = Integer.parseInt(request.getParameter("num"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		System.out.println("num : " + num);
		
		PartyDAO dao = new PartyDAO();
		Board entity= dao.viewParty(num);
		//댓글뽑아오기-----------------------------------------------------------
		List<PartyRef> list = dao.getRefList(num);
		
		if(entity != null) {
			System.out.println("OK");
			request.setAttribute("ob", entity);
			request.setAttribute("ref", list);
			request.setAttribute("pg", pg);
			RequestDispatcher rd = request.getRequestDispatcher("party_board/PartyView.jsp");
			rd.forward(request, response);
		}
	}

}
