package board.dto;

import java.io.File;
import java.io.IOException;
import java.sql.Date;

public class Board {
	private int board_num;
	private String board_id;
	private String board_name;
	private String board_code;
	private String board_title;
	private String board_content;
	private String board_content2; 
	private String img_name;
	private int board_hit;
	private Date board_date;
	private int board_rec;
	private int board_ref;
	private int board_reply;
	private int board_step;  

	public Board() {
		super();
	}

	public Board(int board_num, String board_id, String board_name,String board_code ,String board_title, String board_content,
			String board_content2, int board_hit, Date board_date, int board_rec, int board_ref, int board_reply,
			int board_step) {
		super();
		this.board_num = board_num;
		this.board_id = board_id;
		this.board_name = board_name;
		this.board_code = board_code;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_content2 = board_content2;
		this.board_hit = board_hit;
		this.board_date = board_date;
		this.board_rec = board_rec;
		this.board_ref = board_ref;
		this.board_reply = board_reply;
		this.board_step = board_step;
	}
	

	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}

	public String getBoard_id() {
		return board_id;
	}

	public void setBoard_id(String board_id) {
		this.board_id = board_id;
	}

	public String getBoard_name() {
		return board_name;
	}

	public void setBoard_name(String board_name) {
		this.board_name = board_name;
	}
	
	
	public String getBoard_code() {
		return board_code;
	}

	public void setBoard_code(String board_code) {
		this.board_code = board_code;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_content() {
		return board_content;
	}
	
	
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public String getBoard_content2() {
		return board_content2;
	}

	public void setBoard_content2(String board_content2) {
		this.board_content2 = board_content2;
	}

	public int getBoard_hit() {
		return board_hit;
	}

	public void setBoard_hit(int board_hit) {
		this.board_hit = board_hit;
	}

	public Date getBoard_date() {
		return board_date;
	}

	public void setBoard_date(Date board_date) {
		this.board_date = board_date;
	}

	public int getBoard_rec() {
		return board_rec;
	}

	public void setBoard_rec(int board_rec) {
		this.board_rec = board_rec;
	}

	public int getBoard_ref() {
		return board_ref;
	}

	public void setBoard_ref(int board_ref) {
		this.board_ref = board_ref;
	}

	public int getBoard_reply() {
		return board_reply;
	}

	public void setBoard_reply(int board_reply) {
		this.board_reply = board_reply;
	}

	@Override
	public String toString() {
		return "Board [board_num=" + board_num + ", board_id=" + board_id + ", board_name=" + board_name
				+ ", board_code=" + board_code + ", board_title=" + board_title + ", board_content=" + board_content
				+ ", board_content2=" + board_content2 + ", img_name=" + img_name + ", board_hit=" + board_hit
				+ ", board_date=" + board_date + ", board_rec=" + board_rec + ", board_ref=" + board_ref
				+ ", board_reply=" + board_reply + ", board_step=" + board_step + "]";
	}

	public int getBoard_step() {
		return board_step;
	}

	public void setBoard_step(int board_step) {
		this.board_step = board_step;
	}

	public String getImg_name() {
		return img_name;
	}

	public void setImg_name(String img_name) {
		this.img_name = img_name;
	}
	
	
	
}
