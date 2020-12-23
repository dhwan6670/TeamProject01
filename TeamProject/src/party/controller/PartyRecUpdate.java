package party.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import party.dao.PartyDAO;

@WebServlet(name = "PartyRecUpdate", urlPatterns = { "/partyRecUpdate" })
public class PartyRecUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("no", Integer.parseInt(request.getParameter("no")));
		map.put("id", request.getParameter("id"));
		
		PartyDAO dao = new PartyDAO();
		//게시글 추천여부 0 or 1로 확인
		int check = dao.recCheck(map);
		System.out.println("추천체크 : "+check);
		
		if(check == 0) {
			//추천을 안한경우 board_party테이블의 rec+1
			System.out.println("체크안함");
			dao.recUpdate(map);
		}else {
			//이미 추천을 한경우 board_party테이블의 rec-1
			System.out.println("체크함");
			dao.recDelete(map);
		}
	}
}
