<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
	<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<!-- websocket -->
	
	<script src="https://cdn.jsdelivr.net/sockjs/1/sockjs.min.js"></script>
	<script type="text/javascript">
	 
	$(document).ready(function(){
	
		$("#messageForm").submit(function(event) {

	     sock.send($("#n_receiver").val());
	     
		});

		var sock = new SockJS("<c:url value="main.do"/>");
		 sock.onopen = function() {
			 sock.send($("#session").val());
		     console.log('open');
		 };
	
		 sock.onmessage = function(evt) {
			 $('#count').text(evt.data);
		 };
	
		 sock.onclose = function() {
		     console.log('close');
		 };
	
	 });

	</script>

</head>
<body>
 	<input id="session" type="hidden" value="${sessionScope.member.nickname}" >
	<!-- 세션이 있을 때만 = 로그인되어있을 때만  -->
	<c:if test="${sessionScope.member!=null}">
		<span>${sessionScope.member.nickname} 님 환영합니다</span>
		<span id="count" class="badge bg-theme" data-toggle="modal" data-target="#myModal" >message</span>
		<a href="signout.do">로그아웃</a>
		<a href="mypage.do">마이페이지</a>
	</c:if>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
      </div>
      <div class="modal-body">
          <iframe src="getMessageList.do?n_receiver=${sessionScope.member.nickname}" width="600" height="380" frameborder="0" allowtransparency="true"></iframe>  
      </div>
    
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
</body>
</html>