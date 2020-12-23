package party.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dto.Board;
import party.dao.PartyDAO;

@WebServlet(name = "PartyInsert", urlPatterns = { "/partyInsert" })
public class PartyInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		Board ob = new Board();
		ob.setBoard_id(request.getParameter("id"));
		ob.setBoard_name(request.getParameter("name"));
		ob.setBoard_title(request.getParameter("party_title"));
		ob.setBoard_content(request.getParameter("party_content"));
		
		PartyDAO dao = new PartyDAO();
		int n = dao.insertParty(ob);
		
		if(n > 0) {
			System.out.println("OK");
			response.sendRedirect("/TeamProject/partyList?pg=1");
		}else {
			System.out.println("NO");
		}
	}

}
