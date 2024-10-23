<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="java.lang.Math" %>
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
	
/* 	#btn_review { */
/* 		background-color: white; */
/* 		border: 1px solid #3D3D3D; */
/* 	} */

/* 	#btn_ingredient { */
/* 		background-color: white; */
/* 		border: 1px solid #BFBFBF; */
/* 	} */

	.tab_click {
		background-color: white;
		border: 1px solid #3D3D3D;
	}

	.tab_nonclick {
		background-color: white;
		border: 1px solid #BFBFBF;
	}
	
	#div_tab {
		border-bottom: 1px solid #3D3D3D;
	}
	
	#rating_score {
		color: #3D3D3D;
        font-size: 27px;
        font-weight: bold;
        display: block;
	    justify-content: center;
	    align-items: center;
	    display: flex;
	}
	
    .rating-bar {
        width: 300px;
        font-family: Arial, sans-serif;
        font-size: 14px;
    }

    .rating-row {
        display: flex;
        align-items: center;
        margin-bottom: 5px;
    }

    .rating-row span {
        width: 20px;
        text-align: right;
        margin-right: 10px;
    }

    .bar-container {
        width: 170px;
        background-color: #f1f1f1;
        border-radius: 5px;
        margin-right: 10px;
        position: relative;
        height: 10px;
    }

    .bar {
        height: 100%;
        border-radius: 5px;
    }
    
    .image-container {
	    width: 180px;
	    height: 200px;
	    display: flex;
	    justify-content: center; /* 가로 중앙 정렬 */
	    align-items: center; /* 세로 중앙 정렬 */
	    overflow: hidden; /* 이미지가 div 크기를 넘으면 숨김 */
	}
	
	.image-container img {
	    max-width: 110%;
	    max-height: 110x`%;
	    object-fit: contain; /* 이미지 비율을 유지하며 div 안에 맞춤 */
	}
	
    #profileImage {
       width: 51px;
       height: 51px;
       object-fit: cover;
       border-radius: 50%;
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
            <div class="">
	            <div style="width: 50%; margin: 0 auto; padding-top: 30px;">
	                <div class="d-flex justify-content-center" style="padding: 25px; margin-bottom: 10px">
	                	<div class="image-container">
<!-- 		                      <img src="resources/assets/cosmetic_img/달바.png" style="height: 250px;"> -->
							<c:if test="${cosInfo.cosImage == null || fn:length(cosInfo.cosImage) == 0}">
							    <img src="${pageContext.request.contextPath}/assets/img/none.jpg" style="height: 50px;">
							</c:if>
							<c:if test="${cosInfo.cosImage != null && fn:length(cosInfo.cosImage) > 0}">
							    <img src="${pageContext.request.contextPath}${cosInfo.cosImage}" style="height: 200px;">
							</c:if>
	                	</div>
	                    <div class="d-flex flex-column justify-content-center" style="width: 330px;">
	                    	<div class="border-bottom" style="padding-bottom: 10px;">
		                        <span style="color: #A6A6A6; font-size: 20px">${cosInfo.companyName}</span>
		                        <div style="margin-bottom: 6px;">
		                            <span style="font-size: 27px;">${cosInfo.name}</span>
		                        </div>
		                        <div>
		                            <span style="font-size: 20px;"><img src="resources/assets/img/star_full.png" style="width: 23px; height: 23px; margin-right: 7px;">${cosInfo.starScore}</span>
		                            <span style="color: #A6A6A6; font-size: 20px;">(0)</span>
		                        </div>
	                    	</div>
	                    	<div style="padding: 10px">
		                    	<div style="padding-right: 30px;">
			                    	<div class="d-flex justify-content-between" style="margin-bottom: 5px">
				                    	<div>
				                    		<img src="resources/assets/img/20warn.png" style="width: 27px; height: 27px; margin-right: 15px;">
				                            <span style="font-size: 16px;">20가지 주의성분</span>		                    	
				                    	</div>
				                    	<div>
					                    	<span>0개</span>
				                    	</div>
			                    	</div>
			                    	<div class="d-flex justify-content-between">
			                    		<div>
				                    		<img src="resources/assets/img/virus.png" style="width: 27px; height: 27px; margin-right: 15px;">
				                            <span style="font-size: 16px;">알레르기 주의성분</span>	                    		
			                    		</div>
				                    	<div>
					                    	<span>0개</span>
				                    	</div>
			                    	</div>
		                    	</div>
	                    	</div>
	                    </div>                    
	                </div>
	            </div>
	            <div style="width: 60%; margin: auto;">
	                <div class="d-flex justify-content-center" id="div_tab">
	                	<button id="btn_review" class="tab_click" style="width: 300px; font-size: 20px; padding: 5px;">리뷰</button>
	                	<button id="btn_ingredient" class="tab_nonclick" style="width: 300px; font-size: 20px; padding: 5px;">성분 정보</button>
	                </div>
					<!-- 리뷰 -->
	                <div id="review_div" style="width: 65%; margin: auto;">
		                <div style="margin-top: 15px;">
			               	<span style="font-size: 20px;">리뷰&nbsp;</span><span style="font-size: 20px; color: #3B87CD; font-weight: bold;">${reviewInfo.size()}</span>
		                </div>
						<!-- 별점 점수, 그래프 정보 -->
		               	<div class="d-flex justify-content-center" style="margin-top: 15px;">
							<!-- 별점 평균 -->
		               		<div id="rating_div" class="d-flex flex-column justify-content-center text-align" style="width: 300px;">
			               		<div>
			               		<% 
			               			double avgScore = (Double) request.getAttribute("avgStarScore");
			               			int score = (int) Math.round(avgScore);
			               			request.setAttribute("score", score);
			               		%>
				               		<span id="rating_score">${avgStarScore}</span>
				               		<div class="d-flex justify-content-center text-align">
										<c:forEach var="i" begin="1" end="5">
										    <img src="resources/assets/img/${i <= score ? 'star_full.png' : 'star_none.png'}" style="width: 23px; margin-right: 7px;">
										</c:forEach>
				               		</div>
			               		</div>
		               		</div>
							<!-- 별점 평균 -->
							
							
							<!-- 최대값 찾기 -->
							<c:set var="maxCount" value="${Math.max(Math.max(Math.max(Math.max(count5, count4), count3), count2), count1)}" />
		               		
							<!-- 별점 그래프 -->
							<div class="text-align" style="width: 300px; padding-left: 30px; margin: 0 auto;">
							    <div class="rating-bar">
							        <div class="rating-row">
							            <span>5</span>
							            <div class="bar-container">
							                <div class="bar" style="width: ${rating5}%; background-color: ${count5 == maxCount ? '#EFCE4A' : '#9e9e9e'};"></div>
							            </div>
							            <span ${count5 == maxCount ? 'style="font-weight: bold;"' : ''}>${count5}</span>
							        </div>
							        <div class="rating-row">
							            <span>4</span>
							            <div class="bar-container">
							                <div class="bar" style="width: ${rating4}%; background-color: ${count4 == maxCount ? '#EFCE4A' : '#9e9e9e'};"></div>
							            </div>
							            <span ${count4 == maxCount ? 'style="font-weight: bold;"' : ''}>${count4}</span>
							        </div>
							        <div class="rating-row">
							            <span>3</span>
							            <div class="bar-container">
							                <div class="bar" style="width: ${rating3}%; background-color: ${count3 == maxCount ? '#EFCE4A' : '#9e9e9e'};"></div>
							            </div>
							            <span ${count3 == maxCount ? 'style="font-weight: bold;"' : ''}>${count3}</span>
							        </div>
							        <div class="rating-row">
							            <span>2</span>
							            <div class="bar-container">
							                <div class="bar" style="width: ${rating2}%; background-color: ${count2 == maxCount ? '#EFCE4A' : '#9e9e9e'};"></div>
							            </div>
							            <span ${count2 == maxCount ? 'style="font-weight: bold;"' : ''}>${count2}</span>
							        </div>
							        <div class="rating-row">
							            <span>1</span>
							            <div class="bar-container">
							                <div class="bar" style="width: ${rating1}%; background-color: ${count1 == maxCount ? '#EFCE4A' : '#9e9e9e'};"></div>
							            </div>
							            <span ${count1 == maxCount ? 'style="font-weight: bold;"' : ''}>${count1}</span>
							        </div>
							    </div>
							</div>
							<!-- 별점 그래프 -->
		               	</div>
						<!-- 별점 점수, 그래프 정보 -->
						
						<!-- 리뷰 조회 -->
						<div style="margin: 0 auto;">
							<table class="table table-hover" style="margin-top: 20px;">
								<c:forEach items="${reviewInfo}" var="re">
									<tr>
										<td>
											<div class="d-flex" style="margin-top: 20px;">
												<div>
													<div class="d-flex">
									                	<c:if test="${re.profileImg == null}">
										                    <img src="${pageContext.request.contextPath}/assets/img/게시판_프로필.png">
									                	</c:if>
									                	<c:if test="${re.profileImg != null}">
										                    <img src="${pageContext.request.contextPath}${re.profileImg}" id="profileImage">
									                	</c:if>
														<div class="flex-column justify-content-center"
															style="margin-left: 15px;">
															<div>
																<span style="font-size: 18px;">${re.memWriter}</span>
																<span style="font-size: 15px; color: #A6A6A6;">아직 없음</span>
															</div>
															<div class="d-flex" style="height: 21px;">
															    <c:forEach var="i" begin="1" end="5">
															        <img src="resources/assets/img/${i <= re.starScore ? 'star_full.png' : 'star_none.png'}" style="width: 20px;">
															    </c:forEach>
											               		<div class="justify-content-end" style="margin-left: 10px;">
																	<span style="color: #7F7F7F;">${re.createDt}</span>
											               		</div>
															</div>
														</div>
													</div>
													<div style="padding-left: 20px; padding-top: 20px; padding-bottom: 20px;">
														<div class="d-flex" style="margin-right: 10px;">
															<span style="font-size: 25px; color: #61A1FF; margin-right: 10px;">&#9786;</span>
															<div class="">
																<span>${re.goodComment}</span>														
															</div>
														</div>
														<br>
														<div class="d-flex" style="margin-right: 10px;">
															<span style="font-size: 25px; color: #7F7F7F; margin-right: 10px;">&#9785;</span>
															<div class="">
																<span>${re.badComment}</span>														
															</div>
														</div>
													</div>
													<div>
<!-- 														<img src="resources/assets/img/image_ex.jpg" style="width: 200px; border-radius:5%;"> -->
<!-- 														<img src="resources/assets/img/image_ex.jpg" style="width: 200px; border-radius:5%;"> -->
													</div>
												</div>
											</div>
										</td>
									</tr>
								</c:forEach>
							</table>
						</div>
	                </div>
					<!-- 리뷰 -->
					
					<!-- 성분 정보 -->
	                <div id="ingredient_div" class="d-flex justify-content-center" style="width: 65%; margin: auto; display: none; padding-top: 15px">
                    	<div class="d-flex justify-content-between" style="width: 50%; margin-bottom: 15px;">
	                    	<span style="font-size: 20px;">전체 성분</span>
	                    	<span style="font-size: 20px;">46개</span>
                    	</div>
	                </div>
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
        
        $("#btn_review").click(function () {
        	$(this).removeClass('tab_nonclick').addClass('tab_click');
        	$('#btn_ingredient').removeClass('tab_click').addClass('tab_nonclick');
        	$('#review_div').css("display", "block");
        	$('#ingredient_div').css("display", "none");
        });

        $("#btn_ingredient").click(function () {
        	$(this).removeClass('tab_nonclick').addClass('tab_click');
        	$('#btn_review').removeClass('tab_click').addClass('tab_nonclick');
        	$('#ingredient_div').css("display", "block");
        	$('#review_div').css("display", "none");
        });
	});
</script>
</html>