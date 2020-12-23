package party.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dto.PartyRef;
import party.dao.PartyDAO;

@WebServlet(name = "PartyRefSearch", urlPatterns = { "/partyRefSearch" })
public class PartySearchRef extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		
		PartyDAO dao= new PartyDAO();
		PartyRef ref = dao.SearchRef(num);
		
		if(ref != null) {
			System.out.println("SEARCH OK");
			request.setAttribute("rf", ref);
			RequestDispatcher rd = request.getRequestDispatcher("party_board/PartyUpdateRef.jsp");
			rd.forward(request, response);
		}
	}


}
