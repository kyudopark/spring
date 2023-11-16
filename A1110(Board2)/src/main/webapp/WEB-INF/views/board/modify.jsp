<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
<title>게시글 수정</title>
<meta charset="utf-8">
<meta name="viewport" content="widtd=device-widtd, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
<script type="text/javascript">
$(document).ready(function() {
	
	$('button').on('click',function(e){
		var fData=$("#frm");
		var btn=$(this).data('btn');	//내가 현재 클릭한 버튼 -> data-btn
		
		if(btn=='remove'){
			fData.find("#title").remove();
			fData.find("#content").remove();
			fData.find("#writer").remove();
			
			fData.attr("action", "${root}/board/remove");
			fData.attr("method", "get");
		}
		else if(btn=='modify'){
			fData.attr("action", "${root}/board/modify");
		}
		else if(btn=='list'){
			fData.find("#idx").remove();
			fData.find("#title").remove();
			fData.find("#content").remove();
			fData.find("#writer").remove();
			
			fData.attr("action", "${root}/board/list");
			fData.attr("method", "get");
		}
		fData.submit();
	});
});

</script>	
</head>
<body>
	<div class="container">
		<h2>게시글 수정</h2>
		<div class="panel-body">
			<form id="frm" method="post">
			<table class="table table-bordered ">
				<tr>
					<td>번호</td>
					<td><input type="text" class="form-control" id="idx" name="idx" readonly="readonly" value="${vo.idx }"></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" class="form-control" id="title" name="title"  value="<c:out value='${vo.title }'/>"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea rows="10" class="form-control" id="content" name="content"><c:out value='${vo.content }'/></textarea></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td><input type="text" class="form-control" name="writer" id="writer" readonly="readonly" value="${vo.writer }"></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center">
					<c:if test="${!empty mem && mem.memberID eq vo.memberID }">
						<button type="button" data-btn="modify" class="btn btn-lg btn-info">수정</button>
						<button type="button" data-btn="remove" class="btn btn-lg btn-danger">삭제</button>
					</c:if>
					<c:if test="${empty mem || mem.memberID ne vo.memberID }">
						<button type="buutton" class="btn btn-lg btn-info" disabled="disabled">수정</button>
						<button type="button"  class="btn btn-lg btn-danger" disabled="disabled">삭제</button>
					</c:if>
						<button type="button" data-btn="list" class="btn btn-lg btn-success">목록</button>
					</td>
				</tr>
			</table>
		
		
		<input type="hidden" name="page" value="<c:out value='${cri.page }'/> "/>
		<input type="hidden" name="perPageNum" value="<c:out value='${cri.perPageNum }'/> "/>
		<input type="hidden" id="type" name="type" value="${cri.type }" /> 
		<input type="hidden" id="keyword" name="keyword" value="${cri.keyword }" />
		
		
		</form>
		
			
		
		
		</div>
	</div>
</body>
</html>
