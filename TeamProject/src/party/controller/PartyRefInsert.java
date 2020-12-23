package party.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dto.PartyRef;
import party.dao.PartyDAO;

@WebServlet(name = "PartyRefInsert", urlPatterns = { "/partyRefInsert" })
public class PartyRefInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		PartyRef ob = new PartyRef();
		ob.setRef_pseq(Integer.parseInt(request.getParameter("ref_num")));
		ob.setRef_id(request.getParameter("ref_id"));
		ob.setRef_name(request.getParameter("ref_name"));
		ob.setRef_content(request.getParameter("ref_content"));
		
		//System.out.println("리플ref_num " + request.getParameter("ref_num"));
		int num = Integer.parseInt(request.getParameter("ref_num"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		System.out.println("리플인설트 : " + num +" "+ pg);
		
		PartyDAO dao = new PartyDAO();
		int n = dao.insertRef(ob);
		
		if(n > 0) {
			System.out.println("REF SUCCESS");
			response.sendRedirect("/TeamProject/partyView?num="+num+"&pg="+pg);
		}
	}

}
