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
                <form action="#">
					<table class="table table-hover" style="margin-top: 20px;">
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
												<img src="${pageContext.request.contextPath}/assets/img/love_empty.png" style="width: 25px; height: 25px;">									
		                                    </div>
		                                </div>
									</a>
								</td>
							</tr>
						</c:forEach>
					</table>
                </form>
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