<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="root" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
<title>우리반 화이팅</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		var result = '${result}';
		check(result); //result=vo.getIdx();

		$("#registerBtn").click(function() {
			location.href = "${root}/board/register";
		});

		//페이지 번호 클릭 할때 이동하기
		var pageFrm = $("#pageFrm");
		$(".paginate_button a").on("click", function(e) {
			//현재 a태그를 클릭(버튼)하면 이벤트가 e로 넘어옴
			e.preventDefault(); //a 태그 기능을 막는다 -> 이동을 막아야함 -> 서버에 전송되면안되요

			var page = $(this).attr("href");
			//페이지 번호를 가져온다

			pageFrm.find("#page").val(page);
			//form에 id가 page인것을 찾아 page값 넣어준다

			pageFrm.submit();
		});

		//상세보기 get
		$(".moving").on("click", function(e) {
			e.preventDefault();
			var idx = $(this).attr("href"); //idx
			var tag = "<input type='hidden' name='idx' value='"+idx+"' /> ";
			pageFrm.append(tag); //폼에 태그 추가함
			pageFrm.attr("action", "${root}/board/get");
			pageFrm.attr("method", "get");
			pageFrm.submit();
		});

	});

	function check(result) {
		if (result == '') {
			return;
		}
		if (parseInt(result) > 0) {
			$(".modal-body").html(parseInt(result) + " 번 게시글이 등록되었습니다.");
		}
		$("#myModal").modal("toggle");
	}
	function del() {
		alert('삭제된 게시물입니다');
	}
</script>
</head>
<body>

	<div class="container">
		<h2>화이팅♥</h2>
		<c:if test="${empty mem }">
			<form class="form-inline" action="${root }/login/loginPro"
				method="post">
				<div class="form-group">
					<label for="memberID">ID:</label> <input type="text"
						class="form-control" id="memberID" name="memberID">
				</div>
				<div class="form-group">
					<label for="memberPwd">Password:</label> <input type="password"
						class="form-control" id="memberPwd" name="memberPwd">
				</div>
				<button type="submit" class="btn btn-default">Login</button>
			</form>
		</c:if>
		<c:if test="${!empty mem }">
			<!-- 로그인이 되어있는 상태라면 -->
			<form class="form-inline" action="${root }/login/logoutPro"
				method="post">
				<div class="form-group">
					<label>${mem.memberName }님 환영합니다</label>
				</div>
				<button type="submit" class="btn btn-default">LogOut</button>
			</form>
		</c:if>
		<div class="panel-body">
			<table class="table table-bordered table-hover">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
				</thead>
				<c:forEach items="${li }" var="kd">
					<tr>
						<td>${kd.idx }</td>
						<td><c:if test="${kd.boLevel>0 }">
								<c:forEach begin="1" end="${kd.boLevel }">
									<span style="padding-left: 15px"></span>
								</c:forEach>
							</c:if> <c:if test="${kd.boLevel>0 }">
								<c:if test="${kd.boUsable==1 }">
									<a class="moving" href="${kd.idx}"><c:out
											value="[RE] ${kd.title }" /></a>
								</c:if>
								<c:if test="${kd.boUsable==0 }">
									<a href="javascript:del()">[RE:삭제된 게시물입니다]</a>
								</c:if>
							</c:if> <c:if test="${kd.boLevel==0 }">
								<c:if test="${kd.boUsable==1 }">
									<a class="moving" href="${kd.idx}"><c:out
											value="${kd.title }" /></a>
								</c:if>
								<c:if test="${kd.boUsable==0 }">
									<a href="javascript:del()">[삭제된 게시물입니다]</a>
								</c:if>
							</c:if></td>

						<td>${kd.writer }</td>
						<td><fmt:formatDate value="${kd.indate }"
								pattern="yyyy-MM-dd" /></td>
						<td>${kd.count }</td>
					</tr>
				</c:forEach>
				<c:if test="${!empty mem}">
					<tr>
						<td colspan="5">
							<button id="registerBtn" class="btn btn-md pull-right">글쓰기</button>
						</td>
					</tr>
				</c:if>
			</table>

			<div style="text-align: center">
				<form class="form-inline" action="${root }/board/list" method="post">
					<div class="form-group">
						<select name="type" class="form-control">
							<option value="writer" ${pageCre.cri.type=='writer' ? 'selected' : '' }>작성자</option>
							<option value="title" ${pageCre.cri.type=='title' ? 'selected' : '' }>제목</option>
							<option value="content" ${pageCre.cri.type=='content' ? 'selected' : '' }>내용</option>
							
						</select>
						<input type="text" class="form-control" name="keyword" id="keyword" value="${pageCre.cri.keyword }" placeholder="Search">
						
							<button class="btn btn-default" type="submit">
								<i class="glyphicon glyphicon-search"></i>
							</button>
						
					</div>


					
				</form>
			</div>

			<!-- 페이지 시작 -->
			<div style="text-align: center">
				<ul class="pagination">
					<!-- 이전버튼 처리 -->
					<c:if test="${pageCre.prev }">
						<li class="paginate_button previous"><a
							href="${pageCre.startPage-1}">이전</a></li>
					</c:if>

					<!-- 페이지번호 처리 -->
					<c:forEach var="pageNum" begin="${pageCre.startPage }"
						end="${pageCre.endPage }">
						<li
							class="paginate_button ${pageCre.cri.page==pageNum ? 'active':''  }">
							<a href="${pageNum}">${pageNum }</a>
						</li>
					</c:forEach>


					<!-- 다음버튼 처리 -->
					<c:if test="${pageCre.next }">
						<li class="paginate_button next"><a
							href="${pageCre.endPage+1}">다음</a></li>
					</c:if>
				</ul>
			</div>

			<!-- 마지막 -->
			<form id="pageFrm" action="${root }/board/list" method="post">
				<input type="hidden" id="page" name="page" value="${pageCre.cri.page }" /> 
				<input type="hidden" id="perPageNum" name="perPageNum" value="${pageCre.cri.perPageNum }" />
				<input type="hidden" id="type" name="type" value="${pageCre.cri.type }" /> 
				<input type="hidden" id="keyword" name="keyword" value="${pageCre.cri.keyword }" />
				


			</form>




			<!-- Modal -->
			<div id="myModal" class="modal fade" role="dialog">
				<div class="modal-dialog lg">

					<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Modal Header</h4>
						</div>
						<div class="modal-body"></div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>
					</div>

				</div>
			</div>



		</div>
	</div>

</body>
</html>