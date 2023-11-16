package kr.co.ezen.entity;

import lombok.Data;

//페이징 처리 생성하는 클래스
@Data
public class PageCre {

	private Criteria cri;
	private int totalCount;	//총게시글수
	private int startPage;	//시작페이지번호
	private int endPage;	//끝페이지번호
	private boolean prev;	//이전버튼
	private boolean next;	//다은버튼
	private int showPageNum=5;	//하단에 보여질 페이지
	
	//총게시글 수 메서드
	public void setTotalCount(int totalCount) {
		this.totalCount=totalCount;
		createPage();
	}
	
	public void createPage() {
		
		//1.화면에 보여질 마지막 페이지 번호
		endPage = (int)(Math.ceil(cri.getPage()/(double)showPageNum)*showPageNum);
		
		//2.시작 페이지 번호
		startPage = (endPage-showPageNum)+1;
		
		if(startPage<=0) startPage=1;
		
		//3. 전체 마지막 페이지 계산
		int tmpPage=(int)(Math.ceil((totalCount)/(double)cri.getPerPageNum()));
		
		//4. 화면에 보여질 마지막페이지 체크
		
		if(tmpPage<endPage) {
			endPage=tmpPage;
			//마지막 번호 9인데 10이 보이면 ...9를 마지막페이지로 설정해야함
		}
		
		//5. 이전페이지 버튼이 존재해야 하는지
		prev=(startPage==1)?false:true;		//인덱스가 1~10일경우 => startPage=1;
		
		//6. 다음페이지 버튼이 존재해야 하는지
		next=(endPage<tmpPage) ? true:false;	//내가 현재 보고있는 페이지의 마지막 페이지
			//tmpPage : 전체 게시글이 500개라고 가정하면 50
		
	}
	
}
