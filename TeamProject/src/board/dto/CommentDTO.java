package board.dto;

import java.util.Date;

public class CommentDTO {
	private int comment_num;
	private int comment_boardnum;
	private String comment_id;
	private Date comment_date; 
	private int comment_parent;
	private String comment_content;
	private int comment_level;
	
	public CommentDTO() {
		super();
	}

	public CommentDTO(int comment_num, int comment_boardnum, String comment_id, Date comment_date, int comment_parent,
			String comment_content, int comment_level) {
		super();
		this.comment_num = comment_num;
		this.comment_boardnum = comment_boardnum;
		this.comment_id = comment_id;
		this.comment_date = comment_date;
		this.comment_parent = comment_parent;
		this.comment_content = comment_content;
		this.comment_level = comment_level;
	}

	public int getComment_num() {
		return comment_num;
	}

	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}

	public int getComment_boardnum() {
		return comment_boardnum;
	}

	public void setComment_boardnum(int comment_boardnum) {
		this.comment_boardnum = comment_boardnum;
	}

	public String getComment_id() {
		return comment_id;
	}

	public void setComment_id(String comment_id) {
		this.comment_id = comment_id;
	}

	public Date getComment_date() {
		return comment_date;
	}

	public void setComment_date(Date comment_date) {
		this.comment_date = comment_date;
	}

	public int getComment_parent() {
		return comment_parent;
	}

	public void setComment_parent(int comment_parent) {
		this.comment_parent = comment_parent;
	}

	public String getComment_content() {
		return comment_content;
	}

	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}

	public int getComment_level() {
		return comment_level;
	}

	public void setComment_level(int comment_level) {
		this.comment_level = comment_level;
	}
	
	
}
