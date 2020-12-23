package board.dto;

import java.util.Date;

public class PartyRef {
	private int ref_num;
	private String ref_id;
	private String ref_name;
	private String ref_content;
	private Date ref_date;
	private int ref_step;
	private int ref_lev;
	private int ref_pseq;
	
	public PartyRef() {
		// TODO Auto-generated constructor stub
	}

	public PartyRef(int ref_num, String ref_id, String ref_name, String ref_content, Date ref_date, int ref_step,
			int ref_lev, int ref_pseq) {
		super();
		this.ref_num = ref_num;
		this.ref_id = ref_id;
		this.ref_name = ref_name;
		this.ref_content = ref_content;
		this.ref_date = ref_date;
		this.ref_step = ref_step;
		this.ref_lev = ref_lev;
		this.ref_pseq = ref_pseq;
	}

	public int getRef_num() {
		return ref_num;
	}

	public void setRef_num(int ref_num) {
		this.ref_num = ref_num;
	}

	public String getRef_id() {
		return ref_id;
	}

	public void setRef_id(String ref_id) {
		this.ref_id = ref_id;
	}

	public String getRef_name() {
		return ref_name;
	}

	public void setRef_name(String ref_name) {
		this.ref_name = ref_name;
	}

	public String getRef_content() {
		return ref_content;
	}

	public void setRef_content(String ref_content) {
		this.ref_content = ref_content;
	}

	public Date getRef_date() {
		return ref_date;
	}

	public void setRef_date(Date ref_date) {
		this.ref_date = ref_date;
	}

	public int getRef_step() {
		return ref_step;
	}

	public void setRef_step(int ref_step) {
		this.ref_step = ref_step;
	}

	public int getRef_lev() {
		return ref_lev;
	}

	public void setRef_lev(int ref_lev) {
		this.ref_lev = ref_lev;
	}

	public int getRef_pseq() {
		return ref_pseq;
	}

	public void setRef_pseq(int ref_pseq) {
		this.ref_pseq = ref_pseq;
	}
	
	
}
