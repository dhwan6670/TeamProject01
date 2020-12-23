package pic.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.dto.PicCommDTO;
import pic.dao.PicDAO;

@WebServlet(name = "picCommInsert", urlPatterns = { "/picCommInsert" })
public class PicCommInsert extends HttpServlet {
	private static final long serialVersionUID = 1L; 
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		System.out.println("댓글 등록 진입");
		PicCommDTO picComm = new PicCommDTO();
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		System.out.println("board_num : " + board_num);
		picComm.setBoard_num(board_num);
		System.out.println("댓글내용 : " + request.getParameter("pic_comment"));

		picComm.setPic_comment(request.getParameter("pic_comment"));
		System.out.println("pg : " + request.getParameter("pg"));
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		PicDAO dao = new PicDAO();
		System.out.println("댓글등록 전 dto 에 담긴 내용 : " + picComm);
		int n = dao.insertComment(picComm);
		
		if(n > 0) {
			System.out.println("댓글 등록 성공");
			response.sendRedirect("/TeamProject/picView?board_num="+board_num+"&pg="+pg);
		}
	}
}
