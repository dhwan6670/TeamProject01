package party.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import party.dao.PartyDAO;

@WebServlet(name = "PartyDelete", urlPatterns = { "/partyDelete" })
public class PartyDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("party_num"));
		int pg = Integer.parseInt(request.getParameter("pg"));

		PartyDAO dao = new PartyDAO();
		int n = dao.deleteParty(num);
		
		if(n > 0) {
			System.out.println("DELETE OK");
			response.sendRedirect("/TeamProject/partyList?pg="+pg);
		}
	}

}
