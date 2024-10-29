<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	/* input에 포커스가 있을 때 테두리 색상 변경 */
	input:focus {
	    border-color: #3D3D3D !important;
	    outline: none;
	    box-shadow: none !important;
	}
	
    #profileImage {
       width: 150px;
       height: 150px;
       object-fit: cover;
       border-radius: 50%;
    }
    
    .image-container {
        width: 100px;
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
    
    .item_info {
        color: inherit;
        text-decoration: none !important;
        background: none;
        padding: 0;
        margin: 0;
        border: none;
        cursor: auto;
        font-size: inherit;
    }
    
    .dropdown_btn {
    	background-color: white;
    	border: none;
    }
    
    .dropdown-menu {
    	min-width: 50px !important;
    	margin: 0 !important;
    	padding: 0 !important;
    }
    
    .dropdown-item {
    	text-decoration: none !important;
    }
    
    .dropdown-item.active {
    	background-color: ##F3F4F8 !important;
    }
    
    .dropdown-menu.active {
    	background-color: ##F3F4F8 !important;
    }
    
    .writer_class {
    	font-size: 18px;
    	background-color: white;
    	border: none;
    }
    
    .modal-header {
    	border-bottom: none !important;
    }
    
    .face_btn {
    	background-color: white !important;
    	border-radius: 5% !important;
    	border: 1px solid #C7C7C7;
    	width: 50%;
    	height: 70px;
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
            <div style="width: 60%; margin: 0 auto;">
                <div class="row" style="margin-top: 50px;">
                    <section id="select_menu" class="col-2" style="width: 160.363px;">
                        <h5 style="font-weight: bold; text-align: center;">마이페이지</h5>
                        <div style="margin-top: 20px;">
                            <ul>
<!--                                 <li><a id="like_tag" href="#" class="tab-link" data-target="like">좋아요</a></li> -->
<!--                                 <li><a href="#" class="tab-link" data-target="review">리뷰</a></li> -->
<!--                                 <br> -->
                                <li><a href="#" class="tab-link" data-target="review">리뷰</a></li>
                                <li><a href="#" class="tab-link" data-target="mycosmetic">나의 화장대</a></li>
                                <li><a href="#" class="tab-link" data-target="face">피부 기록</a></li>
                                <br>
                                <li><a href="#" class="tab-link" data-target="myinfo">회원정보 수정</a></li>
                                <li><a href="#" class="tab-link" data-target="delinfo">회원 탈퇴</a></li>
                            </ul>
                        </div>

                    </section>
        
                    <section id="menu_page" class="col-9" style="margin-left: 10px;"> 
                        <div id="like" class="content-section" style="display: none;">
<!--                             <div style="border-bottom: 1px solid #3D3D3D;"> -->
<!--                                 <h5 style="font-weight: bold; margin-bottom: 20px; padding-left: 20px;">좋아요</h5> -->
<!--                             </div> -->
<!--                             <div> -->
<!--                                 <div class="d-flex" style="padding: 25px;"> -->
<!--                                     <img src="./cosmetic_img/달바.png" style="width: 100px; height: 100px; margin-right: 13px;"> -->
<!--                                     <div class="d-flex flex-column justify-content-center"> -->
<!--                                         <div class="d-flex" style="margin-bottom: 6px;"> -->
<!--                                             <span style="color: #A6A6A6; margin-right: 6px;">달바</span> -->
<!--                                             <span>워터풀 선크림[SPF50+/PA++++]</span> -->
<!--                                         </div> -->
<!--                                         <div> -->
<!--                                             <img src="./img/star_full.png" style="width: 20px; height: 20px;"> -->
<!--                                             <span>4.59</span> -->
<!--                                             <span style="color: #A6A6A6;">(3,610)</span> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div class="d-flex flex-column justify-content-center" style="margin-left: auto;"> -->
<!--                                         <button type="button" class="btn-close" style="margin-right: 20px;"></button> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                                 <div class="d-flex" style="padding: 25px;"> -->
<!--                                     <img src="./cosmetic_img/ybk.png" style="width: 100px; height: 100px; margin-right: 13px;"> -->
<!--                                     <div class="d-flex flex-column justify-content-center"> -->
<!--                                         <div class="d-flex" style="margin-bottom: 6px;"> -->
<!--                                             <span style="color: #A6A6A6; margin-right: 6px;">YBK</span> -->
<!--                                             <span>릴리프 하이드레이션 라이트 폼 클렌져</span> -->
<!--                                         </div> -->
<!--                                         <div> -->
<!--                                             <img src="./img/star_full.png" style="width: 20px; height: 20px;"> -->
<!--                                             <span>4.71</span> -->
<!--                                             <span style="color: #A6A6A6;">(1,787)</span> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div class="d-flex flex-column justify-content-center" style="margin-left: auto;"> -->
<!--                                         <button type="button" class="btn-close" style="margin-right: 20px;"></button> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                                 <div class="d-flex" style="padding: 25px;"> -->
<!--                                     <img src="./cosmetic_img/토리든.jpg" style="width: 100px; height: 100px; margin-right: 13px;"> -->
<!--                                     <div class="d-flex flex-column justify-content-center"> -->
<!--                                         <div class="d-flex" style="margin-bottom: 6px;"> -->
<!--                                             <span style="color: #A6A6A6; margin-right: 6px;">토리든</span> -->
<!--                                             <span>다이브인 저분자 히알루론산 세럼</span> -->
<!--                                         </div> -->
<!--                                         <div> -->
<!--                                             <img src="./img/star_full.png" style="width: 20px; height: 20px;"> -->
<!--                                             <span>4.58</span> -->
<!--                                             <span style="color: #A6A6A6;">(11,326)</span> -->
<!--                                         </div> -->
<!--                                     </div> -->
<!--                                     <div class="d-flex flex-column justify-content-center" style="margin-left: auto;"> -->
<!--                                         <button type="button" class="btn-close" style="margin-right: 20px;"></button> -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
                        </div>
                        <div id="review" class="content-section" style="display: block;">
                            <div style="border-bottom: 1px solid #3D3D3D;">
                                <h5 style="font-weight: bold; margin-bottom: 20px; padding-left: 20px;">나의 리뷰</h5>
                            </div>
							<c:if test="${not empty reviewList}">
								<table style="margin: 30px;">
									<c:forEach items="${reviewList}" var="reList">
									    <tr>
									        <div style="margin-left: 45px; margin-right: 45px; border-bottom: 1px solid #3D3D3D;">
									        	<a class="item_info" href="/products?cosNo=${reList.cosmeticNo}">
										            <div class="d-flex">
										                <div class="d-flex" style="align-items: center;">
										                    <div class="d-grid">
										                        <span style="color: #A6A6A6; margin-right: 6px;">${reList.companyName}</span>
										                        <span>${reList.name}</span>
										                    </div>
										                </div>
										                <div class="d-flex" style="margin-left: auto; align-items: center;">
										                    <div class="image-container">
								                                <c:if test="${reList.cosImage == null || fn:length(reList.cosImage) == 0}">
								                                    <img src="${pageContext.request.contextPath}/assets/img/none.jpg" style="width: 30px;">
								                                </c:if>
								                                <c:if test="${reList.cosImage != null && fn:length(reList.cosImage) > 0}">
								                                    <img src="${pageContext.request.contextPath}${reList.cosImage}" style="height: 80px;">
								                                </c:if>
										                    </div>
										                    <p style="color: #7F7F7F; align-items: center; margin: 0;">></p>
										                </div>
										            </div>
									        	</a>
									            <hr style="margin: 0;">
									            <div style="margin: 15px;">
									                <div class="d-flex justify-content-between">
									                    <div class="d-flex">
														    <c:forEach var="i" begin="1" end="5">
														        <img src="${pageContext.request.contextPath}/assets/img/${i <= reList.starScore ? 'star_full.png' : 'star_none.png'}" style="width: 20px; height: 20px;">
														    </c:forEach>
									                        <span style="color: #7F7F7F; margin-left: 10px;">${reList.createDt}</span>
									                    </div>
									                    <div>
									                    	<button class="dropdown_btn" type="button" data-bs-toggle="dropdown" aria-expanded="false">
											                    <h4 style="color: #7F7F7F; margin-right: 35px;">&#8942;</h4>
									                    	</button>
															<ul class="dropdown-menu">
															  <li style="margin-top: 5px;">
															  	<form action="/reviewUpdate" method="post">
															  		<input type="hidden" name="reviewNo" value="${reList.reviewNo}">
															  		<input type="hidden" name="memId" value="${reList.memId}">
															  		<button type="submit" class="dropdown_btn" style="text-align: center; width: 100%;">수정</button>
															  	</form>
															  </li>
															  <li>
															  	<form id="deleteForm" action="/reviewDelete">
															  		<input type="hidden" name="reviewNo" value="${reList.reviewNo}">
															  		<input type="hidden" name="memId" value="${reList.memId}">
															  		<button id="delete_submit" type="button" class="dropdown_btn" style="text-align: center; width: 100%;">삭제</button>
															  	</form>
															  </li>
															</ul>
									                    </div>
									                </div>
									                 <div style="margin-right: 35px; margin-top: 15px;">
									                    <div class="d-flex" >
									                        <span style="font-size: 20px; color: #61A1FF; margin-right: 10px;">&#9786;</span>
									                        <div class="">
									                            <span>${reList.goodComment}</span>														
									                        </div>
									                    </div>
									                    <br>
									                    <div class="d-flex" >
									                        <span style="font-size: 20px; color: #7F7F7F; margin-right: 10px;">&#9785;</span>
									                        <div class="">
									                            <span>${reList.badComment}</span>														
									                        </div>
									                    </div>
									                 </div>
									            </div>
									        </div>
									    </tr>
									</c:forEach>
								</table>
							</c:if>
							<c:if test="${empty reviewList}">
								<div class="d-flex justify-content-center" style="margin-bottom: 100px; margin-top: 100px;">
									<div>
										<div class="d-flex justify-content-center" style="margin-bottom: 15px;">
											<img src="${pageContext.request.contextPath}/assets/img/noinfo.png" style="width: 100px; height: 100px;">
										</div>
										<h5>작성된 리뷰가 없습니다.</h5>
									</div>
								</div>
							</c:if>
                        </div>
                        <div id="face" class="content-section" style="display: none;">
							<div style="border-bottom: 1px solid #3D3D3D;">
								<div class="d-flex justify-content-between">
	                                <h5 style="font-weight: bold; margin-bottom: 20px; padding-left: 20px;">피부 기록</h5>
	                                <button type="button" class="writer_class" id="addinfo_btn" style="margin-right: 25px; margin-bottom: 20px;">
										<img src="${pageContext.request.contextPath}/assets/img/pencil.png" style="width: 20px; height: 20px; margin-right: 10px;">
										게시물 작성하기
									</button>
								</div>
                            </div>
<%-- 							<c:if test="${not empty reviewList}"> --%>
<!-- 								<table style="margin: 30px;"> -->
<%-- 									<c:forEach items="${reviewList}" var="reList"> --%>
<!-- 									    <tr> -->
<!-- 									        <div style="margin-left: 45px; margin-right: 45px; border-bottom: 1px solid #3D3D3D;"> -->
<%-- 									        	<a class="item_info" href="/products?cosNo=${reList.cosmeticNo}"> --%>
<!-- 										            <div class="d-flex"> -->
<!-- 										                <div class="d-flex" style="align-items: center;"> -->
<!-- 										                    <div class="d-grid"> -->
<%-- 										                        <span style="color: #A6A6A6; margin-right: 6px;">${reList.companyName}</span> --%>
<%-- 										                        <span>${reList.name}</span> --%>
<!-- 										                    </div> -->
<!-- 										                </div> -->
<!-- 										                <div class="d-flex" style="margin-left: auto; align-items: center;"> -->
<!-- 										                    <div class="image-container"> -->
<%-- 								                                <c:if test="${reList.cosImage == null || fn:length(reList.cosImage) == 0}"> --%>
<%-- 								                                    <img src="${pageContext.request.contextPath}/assets/img/none.jpg" style="width: 30px;"> --%>
<%-- 								                                </c:if> --%>
<%-- 								                                <c:if test="${reList.cosImage != null && fn:length(reList.cosImage) > 0}"> --%>
<%-- 								                                    <img src="${pageContext.request.contextPath}${reList.cosImage}" style="height: 80px;"> --%>
<%-- 								                                </c:if> --%>
<!-- 										                    </div> -->
<!-- 										                    <p style="color: #7F7F7F; align-items: center; margin: 0;">></p> -->
<!-- 										                </div> -->
<!-- 										            </div> -->
<!-- 									        	</a> -->
<!-- 									            <hr style="margin: 0;"> -->
<!-- 									            <div style="margin: 15px;"> -->
<!-- 									                <div class="d-flex justify-content-between"> -->
<!-- 									                    <div class="d-flex"> -->
<%-- 														    <c:forEach var="i" begin="1" end="5"> --%>
<%-- 														        <img src="${pageContext.request.contextPath}/assets/img/${i <= reList.starScore ? 'star_full.png' : 'star_none.png'}" style="width: 20px; height: 20px;"> --%>
<%-- 														    </c:forEach> --%>
<%-- 									                        <span style="color: #7F7F7F; margin-left: 10px;">${reList.createDt}</span> --%>
<!-- 									                    </div> -->
<!-- 									                    <div> -->
<!-- 									                    	<button class="dropdown_btn" type="button" data-bs-toggle="dropdown" aria-expanded="false"> -->
<!-- 											                    <h4 style="color: #7F7F7F; margin-right: 35px;">&#8942;</h4> -->
<!-- 									                    	</button> -->
<!-- 															<ul class="dropdown-menu"> -->
<!-- 															  <li style="margin-top: 5px;"> -->
<!-- 															  	<form action="/reviewUpdate" method="post"> -->
<%-- 															  		<input type="hidden" name="reviewNo" value="${reList.reviewNo}"> --%>
<%-- 															  		<input type="hidden" name="memId" value="${reList.memId}"> --%>
<!-- 															  		<button type="submit" class="dropdown_btn" style="text-align: center; width: 100%;">수정</button> -->
<!-- 															  	</form> -->
<!-- 															  </li> -->
<!-- 															  <li> -->
<!-- 															  	<form id="deleteForm" action="/reviewDelete"> -->
<%-- 															  		<input type="hidden" name="reviewNo" value="${reList.reviewNo}"> --%>
<%-- 															  		<input type="hidden" name="memId" value="${reList.memId}"> --%>
<!-- 															  		<button id="delete_submit" type="button" class="dropdown_btn" style="text-align: center; width: 100%;">삭제</button> -->
<!-- 															  	</form> -->
<!-- 															  </li> -->
<!-- 															</ul> -->
<!-- 									                    </div> -->
<!-- 									                </div> -->
<!-- 									                 <div style="margin-right: 35px; margin-top: 15px;"> -->
<!-- 									                    <div class="d-flex" > -->
<!-- 									                        <span style="font-size: 20px; color: #61A1FF; margin-right: 10px;">&#9786;</span> -->
<!-- 									                        <div class=""> -->
<%-- 									                            <span>${reList.goodComment}</span>														 --%>
<!-- 									                        </div> -->
<!-- 									                    </div> -->
<!-- 									                    <br> -->
<!-- 									                    <div class="d-flex" > -->
<!-- 									                        <span style="font-size: 20px; color: #7F7F7F; margin-right: 10px;">&#9785;</span> -->
<!-- 									                        <div class=""> -->
<%-- 									                            <span>${reList.badComment}</span>														 --%>
<!-- 									                        </div> -->
<!-- 									                    </div> -->
<!-- 									                 </div> -->
<!-- 									            </div> -->
<!-- 									        </div> -->
<!-- 									    </tr> -->
<%-- 									</c:forEach> --%>
<!-- 								</table> -->
<%-- 							</c:if> --%>
<%-- 							<c:if test="${empty reviewList}"> --%>
								<div class="d-flex justify-content-center" style="margin-bottom: 100px; margin-top: 100px;">
									<div>
										<div class="d-flex justify-content-center" style="margin-bottom: 15px;">
											<img src="${pageContext.request.contextPath}/assets/img/noinfo.png" style="width: 100px; height: 100px;">
										</div>
										<h5>작성된 기록이 없습니다.</h5>
									</div>
								</div>
<%-- 							</c:if> --%>
						</div>
                        <div id="myinfo" class="content-section" style="display: none;">
                            <div style="border-bottom: 1px solid #3D3D3D;">
								<div class="d-flex justify-content-between">
	                                <h5 style="font-weight: bold; margin-bottom: 20px; padding-left: 20px;">나의 정보</h5>
	                                <button type="button" class="writer_class" id="addinfo_btn" data-bs-toggle="modal" data-bs-target="#addInfo_modal" style="margin-right: 25px; margin-bottom: 20px;">
										<img src="${pageContext.request.contextPath}/assets/img/pencil.png" style="width: 20px; height: 20px; margin-right: 10px;">
										추가 정보
									</button>
								</div>
								
								<!-- Modal -->
								<div class="modal fade" id="addInfo_modal" tabindex="-1"
									aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog modal-dialog-centered" style="width: 450px;">
										<div class="modal-content">
											<div class="modal-header" style="margin-top: 15px; margin-right: 10px;">
												<button type="button" class="btn-close" data-bs-dismiss="modal"
													aria-label="Close"></button>
											</div>
											<div class="modal-body" style="padding-top: 0; padding-right: 30px; padding-left: 30px; padding-bottom: 30px;">
												<form action="/addInfoDo" method="post">
													<div style="margin-bottom: 30px;">
														<div style="margin-bottom: 15px;">
															<div>
																<span style="font-size: 20px;">피부 타입을 골라주세요</span>
															</div>
															<div>
																<span style="color: #949494;">1개만 선택해 주세요</span>
															</div>
														</div>
														<div class="d-flex justify-content-between" style="margin-bottom: 15px;">
															<button class="face_btn" style="margin-right: 10px;">
																건성
															</button>
															<button class="face_btn">
																지성
															</button>
														</div>
														<div class="d-flex justify-content-between">
															<button class="face_btn" style="margin-right: 10px;">
																복합성
															</button>
															<button class="face_btn">
																수부지
															</button>
														</div>
														<input type="hidden">
													</div>
													<div style="margin-bottom: 30px;">
														<div style="margin-bottom: 15px;">
															<div>
																<span style="font-size: 20px;">추가 정보를 골라주세요</span>
															</div>
															<div>
																<span style="color: #949494;">중복 선택이 가능합니다.</span>
															</div>
														</div>
														<div class="d-flex justify-content-between" style="margin-bottom: 15px;">
															<button class="face_btn" style="margin-right: 10px;">
																민감성
															</button>
															<button class="face_btn">
																여드름
															</button>
														</div>
													</div>
													<div class="d-flex justify-content-end" style="margin-bottom: 15px;">
									                    <button type="submit" id="submitButton"
									                        style="width: 20%; height: 38px; border: none; background-color: #3D3D3D; color: white; font-size: 16px;">완료</button>
									                </div>
												</form>
											</div>
										</div>
									</div>
								</div>
								<!-- Modal -->
                            </div>
				            <div style="margin: 0 auto; padding-top: 30px;">
				                <form id="updateInfo" method="post" enctype="multipart/form-data">
					                <div class="text-center">
					                	<c:if test="${sessionScope.login.profileImg == null}">
						                    <img src="${pageContext.request.contextPath}/assets/img/user-profile.png" id="profileImage" class="mb-3" style="cursor: pointer;">
						                    <input type="file" id="imageUpload" name="uploadImage" style="display: none;" accept="image/*">
					                	</c:if>
					                	<c:if test="${sessionScope.login.profileImg != null}">
						                    <img src="${pageContext.request.contextPath}${sessionScope.login.profileImg}" id="profileImage" class="mb-3" style="cursor: pointer;">
						                    <input type="file" id="imageUpload" name="uploadImage" style="display: none;" accept="image/*">
					                	</c:if>
					                </div>
					                <div style="margin-bottom: 30px;">
					                    <label style="padding-left: 12px; font-weight: bold; margin-bottom: 10px;">아이디</label>
					                    <input type="text" class="form-control" id="input_id" name="memId" value="${sessionScope.login.memId}"
					                    style="border-radius: 0; font-size: 16px; height: 40px;">
					                    <div id="id_error" style="margin-top: 12px; display: none;">
					                        <span style="color: #ff5246; padding: 12px;">중복된 아이디 입니다.</span>
					                    </div>
					                    <div id="id_correct" style="margin-top: 12px; display: none;">
					                        <span style="color: #4693ff; padding: 12px;">사용 가능한 아이디 입니다.</span>
					                    </div>
					                </div>
					                <div style="margin-bottom: 30px;">
					                    <label style="padding-left: 12px; font-weight: bold; margin-bottom: 10px;">새 비밀번호</label>
					                    <input type="password" class="form-control" id="input_pw_reg" name="memPw" placeholder="새 비밀번호"
					                        style="border-radius: 0; font-size: 16px; height: 40px;">
					                    <input type="password" class="form-control" id="input_pw_check" placeholder="새 비밀번호 확인"
					                        style="border-radius: 0; font-size: 16px; height: 40px;">
										<div id="pw_error" style="margin-top: 12px; display: none;">
											<span style="color: #ff5246; padding: 12px;">비밀번호가 일치하지 않습니다.</span>
										</div>
										<div id="pw_correct" style="margin-top: 12px; display: none;">
											<span style="color: #4693ff; padding: 12px;">비밀번호가 일치합니다.</span>
										</div>
					                </div>
				                    <div style="margin-bottom: 30px;">
					                    <label style="padding-left: 12px; font-weight: bold; margin-bottom: 10px;">이름</label>
					                    <input type="text" class="form-control" id="input_nm" name="memNm" value="${sessionScope.login.memNm}"
					                        style="border-radius: 0; font-size: 16px; height: 40px;">
				                	</div>
					                <div style="margin-bottom: 30px;">
					                    <label style="padding-left: 12px; font-weight: bold; margin-bottom: 10px;">닉네임</label>
					                    <input type="text" class="form-control" id="input_nick" name="memNickname" value="${sessionScope.login.memNickname}"
					                        style="border-radius: 0; font-size: 16px; height: 40px;">
					                    <div id="nick_error" style="margin-top: 12px; display: none;">
					                        <span style="color: #ff5246; padding: 12px;">중복된 닉네임 입니다.</span>
					                    </div>
										<div id="nick_correct" style="margin-top: 12px; display: none;">
											<span style="color: #4693ff; padding: 12px;">사용 가능한 닉네임 입니다.</span>
										</div>
					                </div>
					                <label style="padding-left: 12px; font-weight: bold; margin-bottom: 10px;">성별</label>
					                <div class="d-flex" style="margin-bottom: 30px; margin-left: 10px;">
					                    <div class="form-check" style="padding: 0;">
					                    <c:if test="${sessionScope.login.memGender == '여자'}">
					                        <input id="gender_woman" type="radio" name="memGender" value="여자" style="accent-color: #3D3D3D;" checked>
					                    </c:if>
					                    <c:if test="${sessionScope.login.memGender != '여자'}">
					                        <input id="gender_woman" type="radio" name="memGender" value="여자" style="accent-color: #3D3D3D;">
					                    </c:if>
					                        <label for="gender_woman">여자</label>
					                    </div>
					                    <div class="form-check">
					                    <c:if test="${sessionScope.login.memGender == '남자'}">
					                        <input id="gender_men" type="radio" name="memGender" value="남자" style="accent-color: #3D3D3D;" checked>
					                    </c:if>
					                    <c:if test="${sessionScope.login.memGender != '남자'}">
					                        <input id="gender_men" type="radio" name="memGender" value="남자" style="accent-color: #3D3D3D;">
					                    </c:if>
					                        <label for="gender_men">남자</label>
					                    </div>
					                </div>
					                <div style="margin-left: 10px; margin-bottom: 50px;">
					                    <label class="d-block" style="font-weight: bold; margin-bottom: 10px;">생년월일</label>
					                    <input type="date" value="${sessionScope.login.memBirth}" name="memBirth" style="height: 40px; padding-left: 10px; padding-right: 10px;">
					                </div>
					                <div style="margin-bottom: 50px;">
					                    <button type="submit" id="submitButton"
					                        style="width: 100%; height: 38px; border: none; background-color: #3D3D3D; color: white; font-size: 16px;">수정</button>
					                </div>
				                </form>
				            </div>
			            </div>
        
                        <div id="delinfo" class="content-section" style="display: none;">회원 탈퇴 섹션</div>
                    </section>
                </div>
            </div>
        </main>
    </div>
</body>
<script>
	$(document).ready(function () {

        $("#btn-home").addClass('btn_active');
        $("#home_a_tag").addClass('a_tag_click');
        
        $("#rank_a_tag").addClass('a_tag');
        $("#notice_a_tag").addClass('a_tag');

        $("#categori").click(function () {
            $('#categori_zone').toggle();
            $("main").toggle();
        });
        
        $("#profileImage").click(function () {
            $("#imageUpload").click();
        });

        $("#imageUpload").change(function () {
            let reader = new FileReader();
            reader.onload = function (e) {
                $("#profileImage").attr('src', e.target.result);
            }
            reader.readAsDataURL(this.files[0]);
        });
        
        $(".tab-link").click(function(e) {
            // 클릭된 a 태그의 data-target 속성 값 가져오기
            let target = $(this).data('target');

            // 모든 content-section div 숨기기
            $('.content-section').hide();

            // 해당하는 div 보이기
            $('#' + target).show();
        });
        
        $("#delete_submit").on("click", function() {
            // 알림창 표시
            if (confirm("정말로 삭제하시겠습니까?")) {
                // 확인을 누르면 폼 제출
                $("#deleteForm").submit();
            }
        });
    });
</script>
</html>