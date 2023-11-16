package kr.co.ezen.entity;

import java.util.Date;

import lombok.Data;

@Data
public class Board {

	private int idx;		//게시글 번호
	private String memberID;	//회원 id
	private String title;	//제목
	private String content;	//내용
	private String writer;	//작성자
	private Date indate;	//작성일자
	private int count;	//조회수
	private int boGroup;	//부모글과 답글 묶는 변수
	private int boSequence;	//답글 순서
	private int boLevel;	//답글 레벨
	private int boUsable;	//삭제된 글인지 아닌지 여부
	
	
}
