package kr.co.ezen.mapper;

import java.util.List;

import kr.co.ezen.entity.Board;
import kr.co.ezen.entity.Criteria;
import kr.co.ezen.entity.Member;

public interface BoardMapper {

	public List<Board> getList(Criteria cri);
	
	public void insert(Board vo);
	
	public void insertSelectKey(Board vo);
	
	public Member login(Member vo);
	
	public Board read(int idx);
			
	public void update(Board vo);
	
	public void delete(int idx);
	
	public void replyUpdate(Board pa);
	
	public void replyInsert(Board vo);
	
	public int totalCount(Criteria cri);
	
	public void cntUpdate(int idx);
}
