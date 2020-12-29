<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "vo.MemberBean" %>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="javax.naming.*"%>

<% 
	String id=null;
	if (session.getAttribute("id") != null)
	id = (String) session.getAttribute("id");
	
	Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try{
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/shinna");
			con = ds.getConnection();
			
// 			pstmt=con.prepareStatement("SELECT * from reservation");
			pstmt=con.prepareStatement("select member.*, reservation.* from member inner join reservation on member.id=reservation.id order by chkin asc, name asc");
			rs=pstmt.executeQuery();
			
		}catch(Exception e){
			e.printStackTrace();
		}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no" />
<title>SHINNA</title>
<link href = "images/logo1.png" rel = "icon" type="image/x-icon">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" />
<link rel="stylesheet" href="css/reset.css" />
<link rel="stylesheet" href="css/index.css" />
<style>
body{
	min-width:480px;
}
.login-color1{
		background:#F2CB61;
		color:black;
	}
	
.list {
	position: relative;
	margin-top:230px;
	margin-bottom :300px;
}

td {
	vertical-align: center;

}
</style>
</head>
<body oncontextmenu="return false" ondragstart="return false">
<!-- nav -->
	<div class="container pb-5 mb-5 clearfix">
		<nav class="navbar navbar-expand-sm navbar-light bg-white fixed-top">
			<a href="index.do"><img class="hei pl-4 ml-4" src="images/logo1.png" /></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse ani" id="navbarSupportedContent">
				<ul class="navbar-nav">
					<li class="menu"><a href="#">신나호텔</a>
						<ul class="sub">
							<li><a href="introduce.do">호텔소개</a></li>
							<li><a href="hotelmap.do">호텔안내</a></li>
						</ul>
					</li>
					<li class="menu"><a href="#">호텔객실</a>
						<ul class="sub pb-2">
							<li><a href="standard.do">스탠다드</a></li>
							<li><a href="suite.do">스위트</a></li>
							<li><a href="grand.do">그랜드</a></li>
							<li><a href="event.do">이벤트</a></li>
							<li><a href="promotion.do">프로모션</a></li>
						</ul>
					</li>
					<li class="menu"><a href="#">고객문의</a>
						<ul class="sub">
							<li><a href="reviewList.do">게시판</a></li>
						</ul>
					</li>
					<li class="menu"><a href="#">부대시설</a>
						<ul class="sub">
							<li><a href="fa_ca.do">카페</a></li>
							<li><a href="fa_lo.do">라운지</a></li>
							<li><a href="fa_re.do">레스토랑</a></li>
							<li><a href="fa_sa.do">샤워장</a></li>
							<li><a href="fa_sw.do">수영장</a></li>
							<li><a href="fa_fi.do">휘트니스</a></li>
						</ul>
					</li>
				</ul>
			</div>
				
			<div class="collapse navbar-collapse anis" id="navbarSupportedContent">
				<div class="navbar-nav drs">
					<div class="dropdown mb-4 dr">
						<button class="btn btn-white dropdown-toggle" type="button"
							id="dropdownMenuButton" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false">신나호텔</button>
						<div class="dropdown-menu drr" aria-labelledby="dropdownMenuButton" style="min-width: 100%;">
							<a class="dropdown-item pt-2 pb-3" href="introduce.do">호텔소개</a>
							<a class="dropdown-item pt-3 pb-2" href="hotelmap.do">호텔안내</a>
						</div>
					</div>
					<div class="dropdown mb-4 dr">
						<button class="btn btn-white dropdown-toggle" type="button"
							id="dropdownMenuButton" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false">호텔객실</button>
						<div class="dropdown-menu drr" aria-labelledby="dropdownMenuButton" style="min-width: 100%;">
							<a class="dropdown-item pt-2 pb-3" href="standard.do">스탠다드</a>
							<a class="dropdown-item pt-3 pb-3" href="suite.do">스위트</a>
							<a class="dropdown-item pt-3 pb-3" href="grand.do">그랜드</a>
							<a class="dropdown-item pt-3 pb-3" href="event.do">이벤트</a>
							<a class="dropdown-item pt-3 pb-2" href="promotion.do">프로모션</a>
						</div>
					</div>
					<div class="dropdown mb-4 dr">
						<button class="btn btn-white dropdown-toggle" type="button"
							id="dropdownMenuButton" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false">고객문의</button>
						<div class="dropdown-menu drr" aria-labelledby="dropdownMenuButton" style="min-width: 100%;">
							<a class="dropdown-item pt-2 pb-2" href="reviewList.do">게시판</a>
						</div>
					</div>
					<div class="dropdown mb-2 dr">
						<button class="btn btn-white dropdown-toggle" type="button"
							id="dropdownMenuButton" data-toggle="dropdown" 
							aria-haspopup="true" aria-expanded="false">부대시설</button>
						<div class="dropdown-menu drr" aria-labelledby="dropdownMenuButton" style="min-width: 100%;">
							<a class="dropdown-item pt-2 pb-3" href="fa_ca.do">카페</a>
							<a class="dropdown-item pt-2 pb-3" href="fa_lo.do">라운지</a>
							<a class="dropdown-item pt-3 pb-3" href="fa_re.do">레스토랑</a>
							<a class="dropdown-item pt-3 pb-3" href="fa_sa.do">샤워장</a>
							<a class="dropdown-item pt-3 pb-2" href="fa_sw.do">수영장</a>
							<a class="dropdown-item pt-3 pb-3" href="fa_fi.do">휘트니스</a>
						</div>
					</div>
				</div>
			</div>
			<!-- 로그인 탭 -->
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ml-auto rig">
				
					<li class="nav-item " style="width:100%; ">
						<div class="dropdown lang">
	    					<button class="text-left btn btn-white dropdown-toggle" type="button"
									id="dropdownMenuButton" data-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false" style="width:100%; "><img src="images/dia.png" style="width:27px; height:27px;"><%=id %>님 </button>
	    					<div class="dropdown-menu langs" aria-labelledby="dropdownMenuButton" style="width: 100%; min-width: 100%;">
	   	 						<a class="dropdown-item" href="Logout.do">로그아웃</a>
	   	 						<%
	   	 			if(session.getAttribute("id").toString().equals("shinna604")) {
	   	 				out.println("<a class='dropdown-item' href='checkMemberList.do'>예약관리</a>");
	   	 				out.println("<a class='dropdown-item' href='memberList.do'>회원관리</a>");
	   	 			} else {
	   	 				out.println("<a class='dropdown-item' href='check.do'>예약확인</a>");
	   	 				out.println("<a class='dropdown-item' href='JoinDelete.do'>회원탈퇴</a>");
	   	 			}
	   	 		%>
	    					</div>
		    			</div>
	    			</li>
					<li class="nav-item" style="width: 100%;">
						<div class="dropdown lang mt-2 ml-1">
							<button class="text-left btn btn-white dropdown-toggle" type="button"
								id="dropdownMenuButton" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false" style="width: 100%;"><img src="images/ji.png" class="mr-1" style="width:20px; height:20px;">&nbsp;한국어</button>
							<div class="dropdown-menu langs" aria-labelledby="dropdownMenuButton" style="width: 100%; min-width: 100%;">
								<a class="dropdown-item" href="#">English</a>
								<a class="dropdown-item" href="#">日本語</a> 
								<a class="dropdown-item" href="#">简体中文</a> 
							</div>
						</div>
					</li>
				</ul>
			</div>
		</nav>
	</div>
	
	
<!-- member list -->
<div class="list mx-auto " style="width:1300px;">
	<span class="text-center" style="font-size:2em; ">객실정보</span>
	<table class="table table-striped mt-4" style="width:1300px">
	  <thead>
	    <tr class="text-center font-weight-bold" style="font-size:15px; ">
	      <th scope="col">id</th>
	      <th scope="col">예약자</th>
	      <th scope="col">F_name</th>
	      <th scope="col">L_name</th>
	      <th scope="col">객실이름</th>
	      <th scope="col">chk-in</th>
	      <th scope="col">chk-out</th>
	      <th scope="col">객실</th>
	      <th scope="col">성인</th>
	      <th scope="col">어린이</th>
	      <th scope="col">아기</th>
	      <th scope="col">전화번호</th>
	      <th scope="col">이메일</th>
	      <th scope="col">삭제</th>
	    </tr>
	  </thead>
	  <tbody style="font-size:14px;">
	  	<%while(rs.next()){ %>
			<tr>
				<td><%=rs.getString("id") %></td>
				<td class="mt-1"><%=rs.getString("name") %></td>
				<td><%=rs.getString("F_name") %></td>
				<td><%=rs.getString("L_name") %></td>
				<td><%=rs.getString("type") %></td>
				<td><%=rs.getString("chkin") %></td>
				<td><%=rs.getString("chkout") %></td>
				<td class="text-center"><%=rs.getString("room") %></td>
				<td class="text-center"><%=rs.getString("adult") %></td>
				<td class="text-center"><%=rs.getString("child") %></td>
				<td class="text-center"><%=rs.getString("baby") %></td>
				<td>(<%=rs.getString("tel_1") %>) <%=rs.getString("tel_2") %></td>
				<td><%=rs.getString("e_mail") %>@<%=rs.getString("e_mail2") %></td>
				<td class="text-center"><a href="checkMemberDelete.do?id=<%=rs.getString("id") %>" 
				onclick="return confirm('삭제를 진행하시겠습니까?')">삭제</a> </td>
			</tr>
		<%} %>	
	  </tbody>
	</table>
</div>




<!-- footer -->
	<footer class="footer">
		<div class="footer-above" style="background: #F1E3C4;">
			<div class="container pt-4">
				<div class="row">
					<div class="col-4 mb-5 text-center">
						<h3 style="font-size: 1.5rem; color: #D45751;">SINNA</h3><br>
						<h6 style="font-size: 1rem; color: #BB5954;">HOTELS &amp; RESORTS</h6>
					</div>
					<div class="col-4 mb-5 text-left">
						<h5 style="color: #BB5954; font-size: 1rem;">
							<span style="color: #D45751; font-size: 1.1rem;">TEL.</span> 064-123-4567 
							<span style="color: #D45751; font-size: 1.1rem;">FAX.</span> 064-987-6543
						</h5><br>
						<h5 style="color: #BB5954; font-size: 1rem;">
							<span style="color: #D45751; font-size: 1.1rem;">주소.</span> 제주특별자치도 서귀포시 중문관광로 72번길 75 (우) 63535
						</h5><br>
						<h5 style="color: #BB5954; font-size: 1rem;">
							<span style="color: #D45751; font-size: 1.1rem;">사업자등록번호.</span> 203-81-43363
						</h5>
					</div>
					<div class="col-4 mb-5 text-center">
						<h3 style="color:#BB5954; font-size: 1rem;">SNS</h3><br>
						<a href="#"><img src="images/face.jpg" style="width: 30px;"/></a>
						<a href="#"><img src="images/ins.jpg" style="width: 30px;"/></a>
						<a href="#"><img src="images/you.jpg" style="width: 30px;"/></a>
					</div>
				</div>
			</div>
		</div>	
		<div class="footer-below pt-2 pb-3" style="background: #332B20;">
			<div class="container text-center">
				<div style="color: #9AB1B0; font-size: 1rem;">Copyright &copy; 2020. All rights reserved</div>
			</div>
		</div>
	</footer>
<script src="js/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js"></script>
<script src="js/index.js"></script>
<script src="js/join.js"></script>

</body>
</html>