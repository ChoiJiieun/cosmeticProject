<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	
    #notice_write {
    	font-size: 18px;
    	background-color: white;
    	border: none;
    }
    
    .notice_list {
    	text-decoration: none;
    	color: black;
    }
    
    .notice_list:focus {
    	text-decoration: none !important;
    	color: black;
    }
    
    .page-link {
    	text-decoration: none;
    	color: black;
    }

    .page-link:focus {
    	text-decoration: none;
    	color: white;
    	background-color: #3D3D3D !important;
	    box-shadow: none !important;
    }
    
    .page-item {
    	text-decoration: none;
    	color: black;
    }

    .active>.page-link, .page-link.active {
    	text-decoration: none !important;
    	color: white !important;
    	background-color: #3D3D3D !important;
	    box-shadow: none !important;
    }
    
    .pagination {
		--bs-pagination-color: black !important;
		--bs-pagination-hover-color: white !important;
		--bs-pagination-focus-color: white !important;
    }
    
    .category_a {
    	color: #6C757D;
    	text-decoration: none;
    }

    .category_a:hover {
    	color: black;
    	text-decoration: none;
    }

    .category_a:focus {
    	text-decoration: none;
    }
</style>
</head>

<body>
    <div class="container-fluid" style="padding: 0;">
        <header>
			<jsp:include page="/WEB-INF/inc/header.jsp"></jsp:include>
        </header>
        <div id="categori_zone" style="height: 60vh; display: none;">
			<jsp:include page="/WEB-INF/views/category_menu.jsp"></jsp:include>
        </div>
        <main>
	        <form name="search" action="<c:url value="/notice" />" method="post">
		        <input type="hidden" name="curPage" id="curPage" value="${searchVO.curPage }">
		        <input type="hidden" name="rowSizePerPage" value="${searchVO.rowSizePerPage}">
	        </form>
			<div style="border-bottom: 1px solid #D9D9D9;">
				<div class="container d-flex justify-content-center"
					style="height: 47px;">
					<button id="categori" class="nav-link link-secondary"
						style="width: 17%; font-size: 20px;"><a id="all_a" class="category_a" href="${pageContext.request.contextPath}/notice?cd=ALL">전체</a></button>
					<button id="btn-home" class="nav-link link-secondary"
						style="width: 17%; font-size: 20px;"><a class="category_a" href="${pageContext.request.contextPath}/notice?cd=NT">공지</a></button>
					<button id="btn-rank" class="nav-link link-secondary"
						style="width: 17%; font-size: 20px;"><a class="category_a" href="${pageContext.request.contextPath}/notice?cd=FR">자유</a></button>
					<button id="btn-notice" class="nav-link link-secondary"
						style="width: 17%; font-size: 20px;"><a class="category_a" href="${pageContext.request.contextPath}/notice?cd=QT">질문</a></button>
					<button id="btn-notice" class="nav-link link-secondary"
						style="width: 17%; font-size: 20px;"><a class="category_a" href="${pageContext.request.contextPath}/notice?cd=TP">꿀팁</a></button>
				</div>
			</div>

			<div>
				<div style="width: 54%; margin: 0 auto;">
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
						 	<c:forEach items="${freeList }" var="free">
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
	$(document).ready(function () {
        let left_position = 0;

        $("#btn-notice").addClass('btn_active');
        $("#notice_a_tag").addClass('a_tag_click');
        
        $("#rank_a_tag").addClass('a_tag');
        $("#home_a_tag").addClass('a_tag');


//         $("#btn-rank").click(function () {
//             location.href = 'rank.html';
//         });

//         $("#btn-home").click(function () {
//             location.href = 'home.html';
//         });

        $("#categori").click(function () {
            $('#categori_zone').toggle();
            $("main").toggle();
        });

        left_position = $("#btn-home").position().left;

        $("#choose_div").css({"margin-right": left_position, "margin-left": left_position});
        
		 $("#rowSizePerPage").change(function(){
			$("#curPage").val(1);
			$("input[name='rowSizePerPage']").val($(this).val());
			$("form[name='search']").submit();
		 });
		 
		 $("ul.pagination li a[data-page]").click(function(e){
			 e.preventDefault();
			 $("#curPage").val($(this).data('page'));
			 $("form[name='search']").submit();
		 });
    });
</script>
</html>