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
	
    .image-container {
	    width: 120px;
	    height: 120px;
	    display: flex;
	    justify-content: center; /* 가로 중앙 정렬 */
	    align-items: center; /* 세로 중앙 정렬 */
	    overflow: hidden; /* 이미지가 div 크기를 넘으면 숨김 */
	}
	
	.image-container img {
	    max-width: 110%;
	    max-height: 110%;
	    object-fit: contain; /* 이미지 비율을 유지하며 div 안에 맞춤 */
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
                    <h5 style="font-weight: bold;">'${cateNm}'</h5>
                	<div style="margin-left: 15px;">
	                	<span>결과 </span><span style="color: #3B87CD; font-weight: bold;">${cosSize}</span><span>개</span>
                	</div>
                </div>
<!--                 <div class="d-flex justify-content-start" style="margin-top: 25px;"> -->
<!--                 </div> -->
				<table class="table table-hover">
					<c:forEach items="${cosList}" var="cos">
						<tr>
							<td>
								<a href="<c:url value="/products?cosNo=${cos.cosmeticNo}" />">
	                                <div class="d-flex" style="padding: 25px;">
	                                	<div class="image-container justify-content-center" style="margin-right: 20px;">
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
        
		let left_position = $("#btn-rank").position().left;
        
        $("#choose_div").css({ "margin-right": left_position, "margin-left": left_position-1 });
	});
</script>
</html>