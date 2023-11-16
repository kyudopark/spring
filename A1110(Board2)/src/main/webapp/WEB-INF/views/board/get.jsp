<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
<title>게시글 상세 정보</title>
<meta charset="utf-8">
<meta name="viewport" content="widtd=device-widtd, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
<script type="text/javascript">
	$(document).ready(function(){
		$('button').on('click',function(e){
			var fData=$("#fr");
			var btn=$(this).data('btn');	//내가 현재 클릭한 버튼 -> data-btn
			
			if(btn=='reply'){
				fData.attr("action", "${root}/board/reply");
			}
			else if(btn=='modify'){
				fData.attr("action", "${root}/board/modify");
			}
			else if(btn=='list'){
				fData.find("#idx").remove();
				fData.attr("action", "${root}/board/list");
			}
			fData.submit();
		});
	})

	

</script>	

</head>
<body>
	<div class="container">
		<h2>게시글 상세 정보</h2>
		<div class="panel-body">
			<table class="table table-bordered ">
				<tr>
					<td>번호</td>
					<td><input type="text" class="form-control" name="idx" readonly="readonly" value="${vo.idx }"></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" class="form-control" name="title" readonly="readonly" value="<c:out value='${vo.title }'/>"/></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea rows="10" class="form-control" name="content"
							readonly="readonly"> <c:out value='${vo.content }'/></textarea></td>
				</tr>
				<tr>
					<td>작성자</td>
					<td><input type="text" class="form-control" name="writer" readonly="readonly" value="${vo.writer }"></td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center">
					<c:if test="${!empty mem }">
						<button data-btn="reply" class="btn btn-lg btn-primary">답글</button>
						<button data-btn="modify" class="btn btn-lg btn-info" >수정</button>
					</c:if>
					<c:if test="${empty mem }">
						<button onclick="${root }/board/list" class="btn btn-lg btn-primary" disabled="disabled">답글</button>
						<button onclick="location.href='${root }/board/modify?idx=${vo.idx}'" class="btn btn-lg btn-info" disabled="disabled">수정</button>
						
					</c:if>
						<button data-btn="list" class="btn btn-lg btn-success">목록</button>
					</td>
					

				</tr>
			</table>
			
			<form id="fr" method="get">
				<input type="hidden" id="idx" name="idx" value="<c:out value='${vo.idx }'/>"/>
				<input type="hidden" id="page" name="page" value="<c:out value='${cri.page }'/>"/>
				<input type="hidden" id="perPageNum" name="perPageNum" value="<c:out value='${cri.perPageNum }'/>"/>
				<input type="hidden" id="type" name="type" value="${cri.type }" /> 
		<input type="hidden" id="keyword" name="keyword" value="${cri.keyword }" />
			</form>

		</div>
	</div>
</body>
</html>
