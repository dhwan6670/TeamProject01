package party.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import party.dao.PartyDAO;

@WebServlet(name = "PartyRecCount", urlPatterns = { "/partyRecCount" })
public class PartyRecCount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter print = response.getWriter();
		System.out.println("recCount num : "+request.getParameter("no"));
		int num = Integer.parseInt(request.getParameter("no"));
		
		PartyDAO dao = new PartyDAO();
		int count = dao.recCount(num);
		System.out.println("추천수 :"+count);
		
		print.println(count);
		print.close();
		
	}

}
