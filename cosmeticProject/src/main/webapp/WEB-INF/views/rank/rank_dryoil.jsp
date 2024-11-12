<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
    .a_click {
    	color: black;
    	text-decoration: none;
    }
    
    .category_a {
    	color: #6C757D;
    	text-decoration: none;
    }
    
   	.tr_a {
	    text-decoration: none !important; /* 밑줄 제거 */
	    color: inherit !important; /* 기본 글씨 색상으로 변경 (상위 요소의 색상 따름) */
	}
	
	.tr_a:hover {
	    text-decoration: none !important; /* hover 시에도 밑줄 제거 */
	    color: inherit !important; /* hover 시에도 글씨 색상 변화 없음 */
	}
</style>
<!-- css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/rank_style.css" />
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
			<div style="border-bottom: 1px solid #D9D9D9;">
				<div class="container d-flex justify-content-center"
					style="height: 47px;">
					<button id="btn-dry" class="nav-link link-secondary"
						style="width: 11%; font-size: 20px;"><a class="category_a" href="${pageContext.request.contextPath}/rank/dry">건성</a></button>
					<button id="btn-oil" class="nav-link link-secondary"
						style="width: 11%; font-size: 20px;"><a class="category_a" href="${pageContext.request.contextPath}/rank/oil">지성</a></button>
					<button id="btn-combine" class="nav-link link-secondary"
						style="width: 11%; font-size: 20px;"><a class="category_a" href="${pageContext.request.contextPath}/rank/combine">복합성</a></button>
					<button id="btn-dryoil" class="nav-link link-secondary"
						style="width: 11%; font-size: 20px;"><a class="a_click" href="${pageContext.request.contextPath}/rank/dryoil">수부지</a></button>
					<button id="btn-sensitive" class="nav-link link-secondary"
						style="width: 11%; font-size: 20px;"><a class="category_a" href="${pageContext.request.contextPath}/rank/sensitive">민감성</a></button>
					<button id="btn-pimple" class="nav-link link-secondary"
						style="width: 11%; font-size: 20px;"><a class="category_a" href="${pageContext.request.contextPath}/rank/pimple">여드름</a></button>
				</div>
			</div>
			<div style="width: 60%; margin: 0 auto;">
				<div style="margin-top: 20px;">
					<button type="button" class="btn btn-primary"
						data-bs-toggle="modal" data-bs-target="#categori_modal" style="margin-left: 100px;">
						카테고리 전체&nbsp;&nbsp;&nbsp;▾</button>

					<!-- Modal -->
					<div class="modal fade" id="categori_modal" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog-scrollable">
					    <div class="modal-content">
					        <div class="modal-header">
					            <h1 class="modal-title fs-5" id="exampleModalLabel">카테고리
					                선택</h1>
					            <button type="button" class="btn-close" data-bs-dismiss="modal"
					                aria-label="Close"></button>
					        </div>
					        <div class="modal-body">
					            <div id="categori_acd" class="accordion">
					                <div class="accordion-item">
					                    <h2 class="accordion-header">
					                        <button class="accordion-button collapsed" type="button">
					                            <a href="${pageContext.request.contextPath}/rank/dry" style="color: #000000;">카테고리 전체</a>
					                        </button>
					                    </h2>
					                </div>
					                <div class="accordion-item">
					                    <h2 class="accordion-header">
					                        <button class="accordion-button collapsed" type="button"
					                            data-bs-toggle="collapse" data-bs-target="#collapse1">
					                            스킨케어</button>
					                    </h2>
					                    <div id="collapse1" class="accordion-collapse collapse"
					                        data-bs-parent="#categori_acd">
					                        <div class="accordion-body" style="margin: 0; padding: 0;">
					                            <div class="d-grid"
					                                style="margin-left: 50px; padding-top: 15px;">
					                                <a href="${pageContext.request.contextPath}/rank/dry?cd=SC00" class="tab-link">전체</a> 
					                                <a href="${pageContext.request.contextPath}/rank/dry?cd=SC01" class="tab-link">스킨/토너</a> 
					                                <a href="${pageContext.request.contextPath}/rank/dry?cd=SC02" class="tab-link">로션/에멀젼</a>
					                                <a href="${pageContext.request.contextPath}/rank/dry?cd=SC03" class="tab-link">에센스/앰플/세럼</a> 
					                                <a href="${pageContext.request.contextPath}/rank/dry?cd=SC04" class="tab-link">페이스오일</a> 
					                                <a href="${pageContext.request.contextPath}/rank/dry?cd=SC05" class="tab-link">크림</a>
					                                <a href="${pageContext.request.contextPath}/rank/dry?cd=SC06" class="tab-link">아이케어</a> 
					                                <a href="${pageContext.request.contextPath}/rank/dry?cd=SC07" class="tab-link">미스트</a> 
					                                <a href="${pageContext.request.contextPath}/rank/dry?cd=SC08" class="tab-link">젤</a>
					                                <a href="${pageContext.request.contextPath}/rank/dry?cd=SC09" class="tab-link">스킨/토너 패드</a> 
					                                <a href="${pageContext.request.contextPath}/rank/dry?cd=SC10" class="tab-link">밤/멀티밤</a>
					                            </div>
					                        </div>
					                    </div>
					                    <div class="accordion-item">
					                        <h2 class="accordion-header">
					                            <button class="accordion-button collapsed" type="button"
					                                data-bs-toggle="collapse" data-bs-target="#collapse2">
					                                클렌징/필링</button>
					                        </h2>
					                        <div id="collapse2" class="accordion-collapse collapse"
					                            data-bs-parent="#categori_acd">
					                            <div class="accordion-body" style="margin: 0; padding: 0;">
					                                <div class="d-grid"
					                                    style="margin-left: 50px; padding-top: 15px;">
					                                    <a href="${pageContext.request.contextPath}/rank/dry?cd=CP00" class="tab-link">전체</a> 
					                                    <a href="${pageContext.request.contextPath}/rank/dry?cd=CP01" class="tab-link">클렌징 폼</a> 
					                                    <a href="${pageContext.request.contextPath}/rank/dry?cd=CP02" class="tab-link">클렌징 워터</a> 
					                                    <a href="${pageContext.request.contextPath}/rank/dry?cd=CP03" class="tab-link">클렌징 젤</a> 
					                                    <a href="${pageContext.request.contextPath}/rank/dry?cd=CP04" class="tab-link">클렌징 오일</a> 
					                                    <a href="${pageContext.request.contextPath}/rank/dry?cd=CP05" class="tab-link">클렌징 로션/크림</a> 
					                                    <a href="${pageContext.request.contextPath}/rank/dry?cd=CP06" class="tab-link">비누</a> 
					                                    <a href="${pageContext.request.contextPath}/rank/dry?cd=CP07" class="tab-link">티슈/패트</a> 
					                                    <a href="${pageContext.request.contextPath}/rank/dry?cd=CP08" class="tab-link">립/아이 리무버</a> 
					                                    <a href="${pageContext.request.contextPath}/rank/dry?cd=CP09" class="tab-link">스크럽/필링</a> 
					                                    <a href="${pageContext.request.contextPath}/rank/dry?cd=CP10" class="tab-link">파우더</a> 
					                                    <a href="${pageContext.request.contextPath}/rank/dry?cd=CP11" class="tab-link">밤</a>
					                                </div>
					                            </div>
					                        </div>
					                    </div>
					                    <div class="accordion-item">
					                        <h2 class="accordion-header">
					                            <button class="accordion-button collapsed" type="button"
					                                data-bs-toggle="collapse" data-bs-target="#collapse3">
					                                마스크/팩</button>
					                        </h2>
					                        <div id="collapse3" class="accordion-collapse collapse"
					                            data-bs-parent="#categori_acd">
					                            <div class="accordion-body" style="margin: 0; padding: 0;">
					                                <div class="d-grid"
					                                    style="margin-left: 50px; padding-top: 15px;">
					                                    <a href="${pageContext.request.contextPath}/rank/dry?cd=MP00" class="tab-link">전체</a> 
					                                    <a href="${pageContext.request.contextPath}/rank/dry?cd=MP01" class="tab-link">시트마스크</a> 
					                                    <a href="${pageContext.request.contextPath}/rank/dry?cd=MP02" class="tab-link">부분마스크/팩</a>
					                                    <a href="${pageContext.request.contextPath}/rank/dry?cd=MP03" class="tab-link">워시오프 팩</a> 
					                                    <a href="${pageContext.request.contextPath}/rank/dry?cd=MP04" class="tab-link">필오브 팩</a> 
					                                    <a href="${pageContext.request.contextPath}/rank/dry?cd=MP05" class="tab-link">슬리핑 팩</a> 
					                                    <a href="${pageContext.request.contextPath}/rank/dry?cd=MP06" class="tab-link">패치</a> 
					                                    <a href="${pageContext.request.contextPath}/rank/dry?cd=MP07" class="tab-link">코팩</a> 
					                                    <a href="${pageContext.request.contextPath}/rank/dry?cd=MP08" class="tab-link">부분마스크 패드</a>
					                                </div>
					                            </div>
					                        </div>
					                    </div>
					                    <div class="accordion-item">
					                        <h2 class="accordion-header">
					                            <button class="accordion-button collapsed" type="button"
					                                data-bs-toggle="collapse" data-bs-target="#collapse4">
					                                선케어</button>
					                        </h2>
					                        <div id="collapse4" class="accordion-collapse collapse"
					                            data-bs-parent="#categori_acd">
					                            <div class="accordion-body" style="margin: 0; padding: 0;">
					                                <div class="d-grid"
					                                    style="margin-left: 50px; padding-top: 15px;">
					                                    <a href="${pageContext.request.contextPath}/rank/dry?cd=SS00" class="tab-link">전체</a> 
					                                    <a href="${pageContext.request.contextPath}/rank/dry?cd=SS01" class="tab-link">선크림/로션</a> 
					                                    <a href="${pageContext.request.contextPath}/rank/dry?cd=SS02" class="tab-link">선스프레이</a>
					                                    <a href="${pageContext.request.contextPath}/rank/dry?cd=SS03" class="tab-link">선케어 기타</a> 
					                                    <a href="${pageContext.request.contextPath}/rank/dry?cd=SS04" class="tab-link">선스틱</a> 
					                                    <a href="${pageContext.request.contextPath}/rank/dry?cd=SS05" class="tab-link">선쿠션/팩트</a>
					                                </div>
					                            </div>
					                        </div>
					                    </div>
					                    <div class="accordion-item">
					                        <h2 class="accordion-header">
					                            <button class="accordion-button collapsed" type="button"
					                                data-bs-toggle="collapse" data-bs-target="#collapse5">
					                                바디</button>
					                        </h2>
					                        <div id="collapse5" class="accordion-collapse collapse"
					                            data-bs-parent="#categori_acd">
					                            <div class="accordion-body" style="margin: 0; padding: 0;">
					                                <div class="d-grid"
					                                    style="margin-left: 50px; padding-top: 15px;">
					                                    <a href="${pageContext.request.contextPath}/rank/dry?cd=BD00" class="tab-link">전체</a> 
					                                    <a href="${pageContext.request.contextPath}/rank/dry?cd=BD01" class="tab-link">바디워시</a> 
					                                    <a href="${pageContext.request.contextPath}/rank/dry?cd=BD02" class="tab-link">바디로션</a>
					                                    <a href="${pageContext.request.contextPath}/rank/dry?cd=BD03" class="tab-link">바디크림/젤</a> 
					                                    <a href="${pageContext.request.contextPath}/rank/dry?cd=BD04" class="tab-link">바디오일/에센스</a> 
					                                    <a href="${pageContext.request.contextPath}/rank/dry?cd=BD05" class="tab-link">바디스크럽</a>
					                                    <a href="${pageContext.request.contextPath}/rank/dry?cd=BD06" class="tab-link">바디미스트/샤워코롱</a>
					                                    <a href="${pageContext.request.contextPath}/rank/dry?cd=BD07" class="tab-link">핸드크림/밤</a> 
					                                    <a href="${pageContext.request.contextPath}/rank/dry?cd=BD08" class="tab-link">풋케어</a> 
					                                    <a href="${pageContext.request.contextPath}/rank/dry?cd=BD09" class="tab-link">입욕제</a>
					                                    <a href="${pageContext.request.contextPath}/rank/dry?cd=BD10" class="tab-link">여성청결제</a> 
					                                    <a href="${pageContext.request.contextPath}/rank/dry?cd=BD11" class="tab-link">데오드란트</a> 
					                                    <a href="${pageContext.request.contextPath}/rank/dry?cd=BD12" class="tab-link">바디기타</a>
					                                    <a href="${pageContext.request.contextPath}/rank/dry?cd=BD13" class="tab-link">바디케어 패드</a>
					                                    <a href="${pageContext.request.contextPath}/rank/dry?cd=BD14" class="tab-link">핸드워시</a> 
					                                    <a href="${pageContext.request.contextPath}/rank/dry?cd=BD15" class="tab-link">핸드케어 기타</a>
					                                </div>
					                            </div>
					                        </div>
					                    </div>
					                    <div class="accordion-item">
					                        <h2 class="accordion-header">
					                            <button class="accordion-button collapsed" type="button"
					                                data-bs-toggle="collapse" data-bs-target="#collapse6">
					                                헤어</button>
					                        </h2>
					                        <div id="collapse6" class="accordion-collapse collapse"
					                            data-bs-parent="#categori_acd">
					                            <div class="accordion-body" style="margin: 0; padding: 0;">
					                                <div class="d-grid"
					                                    style="margin-left: 50px; padding-top: 15px;">
					                                    <a href="${pageContext.request.contextPath}/rank/dry?cd=HR00" class="tab-link">전체</a> 
					                                    <a href="${pageContext.request.contextPath}/rank/dry?cd=HR01" class="tab-link">린스/컨디셔너</a> 
					                                    <a href="${pageContext.request.contextPath}/rank/dry?cd=HR02" class="tab-link">헤어에센스/오일</a> 
					                                    <a href="${pageContext.request.contextPath}/rank/dry?cd=HR03" class="tab-link">헤어미스트</a> 
					                                    <a href="${pageContext.request.contextPath}/rank/dry?cd=HR04" class="tab-link">바디오일/에센스</a>
					                                    <a href="${pageContext.request.contextPath}/rank/dry?cd=HR05" class="tab-link">스타일링</a> 
					                                    <a href="${pageContext.request.contextPath}/rank/dry?cd=HR06" class="tab-link">헤어컬러링</a> 
					                                    <a href="${pageContext.request.contextPath}/rank/dry?cd=HR07" class="tab-link">트리트먼트/팩</a>
					                                    <a href="${pageContext.request.contextPath}/rank/dry?cd=HR08" class="tab-link">두피 스케일러</a>
					                                </div>
					                            </div>
					                        </div>
					                    </div>
					                </div>
					            </div>
					        </div>
					    </div>
					</div>
					</div>
					<!-- Modal -->
					
					<div class="d-flex justify-content-center">
						<table class="table" style="margin-top: 15px; width: 70%;">
							<tbody>
								<c:forEach items="${dryRank}" var="co">
									<tr>
										<td>
											<a class="tr_a" href="<c:url value="/products?cosNo=${co.cosmeticNo}" />">
												<div class="d-flex " style="padding: 20px; height: 170px;">
													<div class="d-flex flex-column justify-content-center" style="align-items: center;">
														<c:choose>
															<c:when test="${co.rank == 1}">
																<img src="${pageContext.request.contextPath}/assets/img/rank1.png" style="width: 55px; height: 55px;">
															</c:when>
															<c:when test="${co.rank == 2}">
																<img src="${pageContext.request.contextPath}/assets/img/rank2.png" style="width: 55px; height: 55px;">
															</c:when>
															<c:when test="${co.rank == 3}">
																<img src="${pageContext.request.contextPath}/assets/img/rank3.png" style="width: 55px; height: 55px;">
															</c:when>
															<c:otherwise>
																<span style="width: 55px; height: 55px; font-size: 22px; text-align: center;">${co.rank}</span>
															</c:otherwise>
														</c:choose>
													</div>
													<div class=image-container>
						                                <c:if test="${co.cosImage == null || fn:length(co.cosImage) == 0}">
						                                    <img src="${pageContext.request.contextPath}/assets/img/none.jpg" style="height: 50px;">
						                                </c:if>
						                                <c:if test="${co.cosImage != null && fn:length(co.cosImage) > 0}">
						                                    <img src="${pageContext.request.contextPath}${co.cosImage}" style="height: 120px;">
						                                </c:if>
													</div>
													<div class="d-flex flex-column justify-content-center">
														<div style="margin-bottom: 6px;">
															<div style="margin-bottom: 6px;">
																<span style="color: #A6A6A6; margin-right: 6px; font-size: 17px;">${co.companyName}</span>
															</div>
															<div>
																<span style="font-size: 20px;">${co.name}</span>
															</div>
														</div>
														<div class="d-flex">
															<img src="${pageContext.request.contextPath}/assets/img/star_full.png"
																style="width: 25px; height: 25px;">
															<div class="justify-content-center" style="margin-left: 5px;">
																<span style="font-size: 17px;">${co.starScore}</span> <span
																	style="color: #A6A6A6; font-size: 17px;">(${co.reviewCount})</span>
															</div>
														</div>
													</div>
												</div>
											</a>
										</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</main>
	</div>
</body>
<script>
	$(document).ready(function () {

        $("#btn-rank").addClass('btn_active');
        $("#rank_a_tag").addClass('a_tag_click');
        
        $("#home_a_tag").addClass('a_tag');
        $("#notice_a_tag").addClass('a_tag');


        $("#btn-rank").click(function () {
            location.href = 'rank.html';
        });

        $("#btn-notice").click(function () {
            location.href = 'notice.html';
        });

        $("#categori").click(function () {
            $('#categori_zone').toggle();
            $("main").toggle();
        });
        
        let left_position = $("#btn-rank").position().left;
        
        $("#choose_div").css({ "margin-right": left_position, "margin-left": left_position-1 });

			
    });
</script>
</html>