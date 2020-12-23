package board.dto;

import party.dao.PartyDAO;

public class PartyPaging {
	int currentPage; // 현재페이지
	int pageBlock; // [이전][1][2][3][다음]
	int pageSize; // 1페이지당 5개씩 글 뿌리기
	StringBuffer pagingHTML;

	public PartyPaging(int currentPage, int pageBlock, int pageSize) {
		this.currentPage = currentPage;
		this.pageBlock = pageBlock;
		this.pageSize = pageSize;
	}

	public void makePagingHTML() {
		pagingHTML = new StringBuffer();

		PartyDAO dao = new PartyDAO();
		int totalA = dao.getTotalArticle();// 총글수
		System.out.println("총 글수"+totalA);
		int totalP = (totalA + pageSize - 1) / pageSize;// 총페이지수

		int startPage = ((int) ((currentPage - 1) / pageBlock)) * pageBlock + 1;
		int endPage = startPage + pageBlock - 1;

		if (endPage > totalP) {
			endPage = totalP;
		}

		// ----------------------------------------------------------------
		if (startPage > pageBlock) {
			pagingHTML.append("<a href='/TeamProject/partyList?pg=" + (startPage - pageBlock) + "'>[" + "이전]</a>");
		}

		for (int i = startPage; i <= endPage; i++) {
			if (currentPage == i) {
				pagingHTML.append("<a href='/TeamProject/partyList?pg=" + i + "'><font color=red>[" + i + "]</font></a>");

			} else {
				pagingHTML.append("<a href='/TeamProject/partyList?pg=" + i + "'>[" + i + "]</a>");
			}
		}

		if (endPage < totalP) {
			pagingHTML.append("<a href='/TeamProject/partyList?pg=" + (startPage + pageBlock) + "'>[" + "다음]</a>");
		}
	}

	public String getPagingHTML() {
		return pagingHTML.toString();
	}
}
