<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>cosmetic</title>
<style>
	html {
    	overflow-y: scroll !important;
	}
	
	/* 이메일 입력 필드에 포커스가 있을 때 테두리 색상 변경 */
	#input_email:focus {
	    border-color: #3D3D3D !important;
	    outline: none;
	    box-shadow: none !important;
	}
	
	/* 비밀번호 입력 필드에 포커스가 있을 때 테두리 색상 변경 */
	#input_pw:focus {
	    border-color: #3D3D3D !important;
	    outline: none;
	    box-shadow: none !important;
	}
	
	a {
	    text-decoration: none !important; /* 밑줄 제거 */
	    color: inherit !important; /* 기본 글씨 색상으로 변경 (상위 요소의 색상 따름) */
	}
	
	a:hover {
	    text-decoration: none !important; /* hover 시에도 밑줄 제거 */
	    color: inherit !important; /* hover 시에도 글씨 색상 변화 없음 */
	}
	
    #notice_write {
    	font-size: 18px;
    	background-color: white;
    	border: none;
    }
</style>
</head>
<body>
    <div class="container-fluid" style="padding: 0;">
        <header style="height: 153px;">
  			<jsp:include page="/WEB-INF/inc/header.jsp"></jsp:include>
        </header>
        <div id="categori_zone" style="height: 60vh; display: none;">
			<jsp:include page="/WEB-INF/views/category_menu.jsp"></jsp:include>
        </div>
        <main>
            <div style="width: 50%; margin: 0 auto; padding-top: 30px;">
                <div class="d-flex">
                    <h5 style="font-weight: bold;">'${keyword}'</h5>
                    <h5>에 대한 검색입니다.</h5>
                </div>
                <div class="d-flex justify-content-between" style="margin-top: 25px;">
                	<div>
	                	<span>화장품 검색 결과 </span><span style="color: #3B87CD; font-weight: bold;">${cosSize}</span><span>개</span>
                	</div>
                	<div>
	                	<span>더보기 ></span>
                	</div>
                </div>
				<table class="table table-hover">
					<c:forEach items="${cosList}" var="cos">
						<tr>
							<td>
								<a href="<c:url value="/products?cosNo=${cos.cosmeticNo}" />">
	                                <div class="d-flex" style="padding: 25px;">
	                                	<div class="justify-content-center" style="margin-right: 20px;">
			                                <c:if test="${cos.cosImage == null || fn:length(cos.cosImage) == 0}">
			                                    <img src="${pageContext.request.contextPath}/assets/img/none.jpg" style="height: 50px;">
			                                </c:if>
			                                <c:if test="${cos.cosImage != null && fn:length(cos.cosImage) > 0}">
			                                    <img src="${pageContext.request.contextPath}${cos.cosImage}" style="height: 120px;">
			                                </c:if>
	                                	</div>
	                                    <div class="d-flex flex-column justify-content-center">
	                                        <div class="d-flex" style="margin-bottom: 6px;">
	                                            <span style="color: #A6A6A6; margin-right: 6px; font-size: 20px">${cos.companyName}</span>
	                                            <span style="font-size: 20px;">${cos.name}</span>
	                                        </div>
	                                        <div>
	                                            <img src="${pageContext.request.contextPath}/assets/img/star_full.png" style="width: 20px; height: 20px;">
	                                            <span style="font-size: 17px;">${cos.starScore}</span>
	                                            <span style="color: #A6A6A6; font-size: 17px;">(${cos.reviewCount})</span>
	                                        </div>
	                                    </div>
	                                    <div class="d-flex flex-column justify-content-center" style="margin-left: auto; margin-right: 30px">
<%-- 												<img src="${pageContext.request.contextPath}/assets/img/love_empty.png" style="width: 25px; height: 25px;">									 --%>
	                                    </div>
	                                </div>
								</a>
							</td>
						</tr>
					</c:forEach>
				</table>
            </div>
            
	        <form name="search" action="<c:url value="/search" />" method="post">
		        <input type="hidden" name="curPage" id="curPage" value="${searchVO.curPage }">
		        <input type="hidden" name="rowSizePerPage" value="${searchVO.rowSizePerPage}">
	        </form>
			<div style="margin-bottom: 50px;">
				<div style="width: 54%; margin: 0 auto;">
	                <div class="d-flex justify-content-start" style="margin-left: 30px; margin-top: 45px;">
	                	<div>
		                	<span>게시물 검색 결과 </span><span style="color: #3B87CD; font-weight: bold;">16</span><span>개</span>
	                	</div>
	                </div>
					<table class="table table-hover" style="margin-top: 20px;">
						 <colgroup>
						 	<col width="17%" />
						 	<col width="40%" />
						 	<col width="17%" />
						 	<col width="14%" />
						 	<col width="12%" />
						 </colgroup>
						 <thead style="text-align: center;">
							 <tr>
							 	<th>분류</th><th>제목</th><th>작성자</th><th>등록일</th><th>조회수</th>
							 </tr>
						 </thead>
						 <tbody style="text-align: center;">
						 	<c:forEach items="${boList}" var="free">
						 	<tr>
						 		<td>${free.boCategory }</td>
						 		<td><a class="notice_list" href="freeView?boNo=${free.boNo}">${free.boTitle }</a></td>
						 		<td>${free.boWriter }</td>
						 		<td>${free.boRegDate}</td>
						 		<td>${free.boHit }</td>
						 	</tr>
						 	</c:forEach>
						 </tbody>
					</table>
					
					<!-- 게시물 기록 버튼 -->
					<div class="d-flex justify-content-end" style="margin-top: 15px;">
						<form action="noticeWrite" method="post">
							<button type="submit" id="notice_write" style="margin-right: 25px;">
								<img src="${pageContext.request.contextPath}/assets/img/pencil.png" style="width: 20px; height: 20px; margin-right: 10px;">
								게시물 작성하기
							</button>
						</form>
					</div>
					
					<!-- START : 페이지네이션  -->
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
						<!-- prev -->
						<c:if test="${searchVO.firstPage !=1 }">
							<li class="page-item">
								<a class="page-link" aria-lable="Previous"
								   href="#" data-page="${searchVO.firstPage-1}" >
									<span aria-hidden="true" >&laquo;</span>
								</a>
							</li>
						</c:if>
						<!-- prev -->
						<!-- paging -->
							<c:forEach begin="${searchVO.firstPage}" end="${searchVO.lastPage }" var="i">
							
								<c:if test="${searchVO.curPage != i}">
									<li class="page-item">
										<a class="page-link" href="#" data-page="${i}" >${i}</a>
									</li>
								</c:if>
								<c:if test="${searchVO.curPage == i}">
									<li class="page-item active">
										<a class="page-link" href="#" data-page="${i}">${i}</a>
									</li>
								</c:if>
							</c:forEach>					
						<!-- paging -->
						<!-- next -->
						<c:if test="${searchVO.lastPage != searchVO.totalPageCount }">
							<li class="page-item" >
								<a class="page-link" aria-lable="Next" 
								   href="#" data-page="${searchVO.lastPage+1}">
									<span aria-hidden="true">&raquo;</span>
								</a>
							</li>
						</c:if>
						<!-- next -->
						</ul>
					</nav>
					<!-- END : 페이지네이션  -->
				</div>
			</div>
        </main>
    </div>
</body>
<script>
	$(document).ready(function() {

        $("#btn-home").addClass('btn_active');
        $("#home_a_tag").addClass('a_tag_click');
        
        $("#rank_a_tag").addClass('a_tag');
        $("#notice_a_tag").addClass('a_tag');

        $("#categori").click(function () {
            $('#categori_zone').toggle();
            $("main").toggle();
        });
	});
</script>
</html>