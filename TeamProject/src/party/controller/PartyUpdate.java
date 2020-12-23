package party.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dto.Board;
import party.dao.PartyDAO;

@WebServlet(name = "PartyUpdate", urlPatterns = { "/partyUpdate" })
public class PartyUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int num = Integer.parseInt(request.getParameter("party_num"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		Board ob = new Board();
		ob.setBoard_num(Integer.parseInt(request.getParameter("party_num")));
		ob.setBoard_title(request.getParameter("party_title"));
		ob.setBoard_content(request.getParameter("party_content"));
		
		PartyDAO dao = new PartyDAO();
		int n = dao.updateParty(ob);
		
		if(n > 0) {
			System.out.println("UPDATE OK");
			response.sendRedirect("/TeamProject/partyView?num="+num+"&pg="+pg);
		}
	}

}
