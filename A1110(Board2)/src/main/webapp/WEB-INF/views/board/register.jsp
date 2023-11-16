<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<c:set var="root" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>우리반 화이팅</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
  <h2>화이팅♥</h2>
    <div class="panel-heading">1402호</div>
    <div class="panel-body">
       <form action="${root }/board/register" method="post">
       <input type="hidden" name="memberID" value="${mem.memberID }">
        
          <div class="form-group">
             <label>제목</label>
             <input type="text" name="title" class="form-control"/>
           </div>
           
           <div class="form-group">
             <label>내용</label>
             <textarea rows="10" name="content" class="form-control"></textarea>
           </div>
           
           <div class="form-group">
             <label>작성자</label>
             <input type="text" readonly="readonly" name="writer" class="form-control" value="${mem.memberName }"/>
           </div>
           
           
           <button type="submit" class="btn btn-default btn-md">등록</button>
           <button type="reset" class="btn btn-default btn-md">취소</button>
       
       </form>
      
    </div>
</div>
</body>
</html>