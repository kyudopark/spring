package kr.co.ezen.service;

import java.util.List;

import kr.co.ezen.entity.Board;
import kr.co.ezen.entity.Criteria;
import kr.co.ezen.entity.Member;

public interface BoardService {

	 public List<Board> getList(Criteria cri);
	 public Member login(Member vo);
	 public void register(Board vo);
	 public Board get(int idx);
	 public void remove(int idx);
	 public void modify(Board vo);
	 public void replyPro(Board vo);
	 public int totalCount(Criteria cri);	//전체 페이지수
	 public void cntUpdate(int idx);
	 
}
