package party.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dto.PartyRef;
import party.dao.PartyDAO;

@WebServlet(name = "PartyRefUpdate", urlPatterns = { "/partyRefUpdate" })
public class PartyUpdateRef extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		PartyRef ob = new PartyRef();
		ob.setRef_num(Integer.parseInt(request.getParameter("num")));
		ob.setRef_content(request.getParameter("content"));
		ob.setRef_pseq(Integer.parseInt(request.getParameter("pseq")));
		
		//System.out.println(ob.getRef_num() + " " + ob.getRef_content() + " " + ob.getRef_pseq());
		
		PartyDAO dao = new PartyDAO();
		int n = dao.getUpdateRef(ob);
		
		if(n > 0) {
			System.out.println("REF UPDATE OK");
		}
	}

}
