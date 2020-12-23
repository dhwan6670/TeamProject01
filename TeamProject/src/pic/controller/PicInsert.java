package pic.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import board.dto.Board;
import pic.dao.PicDAO;

@WebServlet(name = "picInsert", urlPatterns = { "/picInsert" })
public class PicInsert extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		System.out.println(request);
		System.out.println("picInsert 진입");
		Board board = new Board();
		board.setBoard_id(request.getParameter("board_id"));
		System.out.println(board.getBoard_id());
		board.setBoard_name(request.getParameter("board_name"));
		System.out.println(board.getBoard_name());
		board.setBoard_title(request.getParameter("board_title"));
		System.out.println(board.getBoard_title());
		board.setBoard_content(request.getParameter("board_content"));
		System.out.println(board.getBoard_content()); 
		board.setBoard_content2(request.getParameter("board_content2"));
		System.out.println(board.getBoard_content2());
		//board.setUpload((File)request.getAttribute("board_content2"));
		//MultipartFile mf = request.get
		
		
		System.out.println("board에 담긴것 : " + board);
		PicDAO dao = new PicDAO();
		int n = dao.insertPic(board);
		
		if(n > 0) {
			System.out.println("OK");
			response.sendRedirect("/TeamProject/picList?pg=1");
		}else {
			System.out.println("NO");
		}
	}
}
