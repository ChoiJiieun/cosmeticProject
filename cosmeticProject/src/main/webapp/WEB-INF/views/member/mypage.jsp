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
    
    .header-none {
    	border-bottom: none !important;
    }
    
    .face_btn {
    	background-color: white !important;
    	border-radius: 5px !important;
    	border: 1px solid #C7C7C7;
    	width: 50%;
    	height: 70px;
    }
    
    .write_btn {
    	color: black;
    	text-decoration: none;
    }

    .write_btn:focus {
    	color: black;
    	text-decoration: none;
    }

    .write_btn:hover {
    	color: black;
    	text-decoration: none;
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
    
    .notice_list {
    	color: #6C757D;
    	text-decoration: none;
    }

    .notice_list:hover {
    	color: black;
    	text-decoration: none;
    }
    
	.tab-link.active {
        color: #3D3D3D; /* 원하는 색상으로 변경 */
    }
    
    .btn-primary {
	    --bs-btn-bg: #3D3D3D;
	    --bs-btn-hover-color: white;
	    --bs-btn-hover-bg: #545454;
	    --bs-btn-border-color: none;
	    --bs-btn-hover-border-color: none;
	    --bs-btn-focus-shadow-rgb: none;
	    --bs-btn-active-color: white !important;
	    --bs-btn-active-bg: #3D3D3D;
	    --bs-btn-active-border-color: none;
	    height: 40px;
	    text-decoration: none;
	}

    .btn-primary-light {
	    --bs-btn-bg: white;
	    --bs-btn-border-color: #3D3D3D !important;
	    --bs-btn-hover-color: black;
	    --bs-btn-hover-bg: white;
	    --bs-btn-border-color: #3D3D3D;
	    --bs-btn-hover-border-color: #3D3D3D !important;
	    --bs-btn-focus-shadow-rgb: none;
	    --bs-btn-active-color: black !important;
	    --bs-btn-active-bg: white;
	    --bs-btn-active-border-color: #3D3D3D;
	    height: 40px;
	    text-decoration: none;
	}
	
 	@media (min-width: 992px) { 
 	    .modal-lg, .modal-xl { 
 	        --bs-modal-width: 540px !important; 
 	    } 
 	}
 	
 	.btn-close {
 		--bs-btn-close-focus-shadow: none !important;
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
                                <li><a href="#" class="tab-link" data-target="face">피부 기록</a></li>
                                <li><a href="#" class="tab-link" data-target="mycosmetic">계절별 루틴</a></li>
                                <li><a href="#" id="review_tag" class="tab-link" data-target="review">작성한 리뷰</a></li>
                                <br>
                                <li><a href="#" class="tab-link" data-target="myinfo">회원정보 수정</a></li>
                                <li><a href="#" class="tab-link" data-target="delinfo">회원 탈퇴</a></li>
                            </ul>
                        </div>

                    </section>
        
                    <section id="menu_page" class="col-9" style="margin-left: 10px; margin-bottom: 30px;"> 
                        <div id="review" class="content-section" style="display: none;">
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
															<ul class="dropdown-menu" style="width: 90px;">
															  <li style="margin-top: 5px;">
															  	<form action="/reviewUpdate" method="post">
															  		<input type="hidden" name="reviewNo" value="${reList.reviewNo}">
															  		<input type="hidden" name="memId" value="${reList.memId}">
															  		<button type="submit" class="dropdown_btn" style="text-align: center; width: 100%;">수정</button>
															  	</form>
															  </li>
															  <li>
															  	<form class="deleteForm" action="/reviewDelete">
															  		<input type="hidden" name="reviewNo" value="${reList.reviewNo}">
															  		<input type="hidden" name="memId" value="${reList.memId}">
															  		<button type="button" class="delete_submit dropdown_btn" style="text-align: center; width: 100%;">삭제</button>
															  	</form>
															  </li>
															  <li>
															  	<form class="deleteForm" action="#">
															  		<input type="hidden" name="reviewNo" value="${reList.reviewNo}">
															  		<input type="hidden" name="memId" value="${reList.memId}">
															  		<button type="button" class="dropdown_btn" data-bs-toggle="modal" data-bs-target="#recommendModal" data-cosmetic-no="${reList.cosmeticNo}" data-cate-cd="${reList.cateCd}" style="text-align: center; width: 100%;" onclick="cosMachine(this)">유사 제품</button>
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

							<!-- Modal -->
							<div class="modal fade" id="recommendModal" tabindex="-1" aria-labelledby="recommendModalLabel" aria-hidden="true" style="display: none;">
								<div class="modal-dialog modal-lg modal-dialog-scrollable">
									<div class="modal-content">
										<div class="modal-header" style="padding: 20px;">
											<h5 class="modal-title" id="modalRecomTitle">유사 제품 추천</h5>
											<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">
											<p id="hashtag" style="margin-left: 10px; color: #7d7d7d;"></p>
											<table>
												<tbody id="recomBody">
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
							<!-- Modal -->
						</div>
                        <div id="face" class="content-section" style="display: block;">
					        <form name="search" action="<c:url value="/mypage" />" method="post">
						        <input type="hidden" name="curPage" id="curPage" value="${searchVO.curPage }">
						        <input type="hidden" name="rowSizePerPage" value="${searchVO.rowSizePerPage}">
					        </form>
							<div style="border-bottom: 1px solid #3D3D3D;">
								<div class="d-flex justify-content-between">
	                                <h5 style="font-weight: bold; margin-bottom: 20px; padding-left: 20px;">피부 기록</h5>
	                                <button type="button" class="writer_class" id="addinfo_btn" style="margin-right: 25px; margin-bottom: 20px;">
										<img src="${pageContext.request.contextPath}/assets/img/pencil.png" style="width: 20px; height: 20px; margin-right: 10px;">
										<a class="write_btn" href="${pageContext.request.contextPath}/faceRecord">게시물 작성하기</a>
									</button>
								</div>
                            </div>
							<c:if test="${not empty faceRecord}">
								<table class="table table-hover" style="margin-top: 20px;">
								 <colgroup>
								 	<col width="65%" />
								 	<col width="35%" />
								 </colgroup>
									 <thead style="text-align: center;">
										 <tr>
										 	<th>제목</th><th>날짜</th>
										 </tr>
									 </thead>
									 <tbody style="text-align: center;">
									 	<c:forEach items="${faceRecord }" var="free">
									 	<tr>
									 		<td><a class="notice_list" href="recordDetail?reNo=${free.recordNo}">${free.recordTitle}</a></td>
									 		<td>${free.recordDate}</td>
									 	</tr>
									 	</c:forEach>
									 </tbody>
								</table>
							</c:if>
							<c:if test="${empty faceRecord}">
								<div class="d-flex justify-content-center" style="margin-bottom: 100px; margin-top: 100px;">
									<div>
										<div class="d-flex justify-content-center" style="margin-bottom: 15px;">
											<img src="${pageContext.request.contextPath}/assets/img/noinfo.png" style="width: 100px; height: 100px;">
										</div>
										<h5>작성된 기록이 없습니다.</h5>
									</div>
								</div>
							</c:if>
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
                        <div id="mycosmetic" class="content-section" style="display: none;">
							<div style="border-bottom: 1px solid #3D3D3D;">
								<div class="d-flex justify-content-between">
	                                <h5 style="font-weight: bold; margin-bottom: 20px; padding-left: 20px;">계절별 루틴</h5>
	                                <button type="button" class="writer_class" id="addinfo_btn" style="margin-right: 25px; margin-bottom: 20px;">
										<img src="${pageContext.request.contextPath}/assets/img/pencil.png" style="width: 20px; height: 20px; margin-right: 10px;">
										<a class="write_btn" href="/RoutineWrite">루틴 기록</a>
									</button>
								</div>
                            </div>
							<div style="margin-right: 20px; margin-left: 37px; margin-top: 15px;">
								<button type="button" class="btn btn-primary season-btn" style="width: 53.13px; margin-right: 10px;" onclick="season_filter('spring', this)">
									봄</button>
								<button type="button" class="btn btn-primary-light season-btn"  style="margin-right: 10px;" onclick="season_filter('summer', this)">
									&nbsp;여름&nbsp;</button>
								<button type="button" class="btn btn-primary-light season-btn" style="margin-right: 10px;" onclick="season_filter('fall', this)">
									&nbsp;가을&nbsp;</button>
								<button type="button" class="btn btn-primary-light season-btn" onclick="season_filter('winter', this)">
									&nbsp;겨울&nbsp;</button>
							</div>
							<div class="d-flex justify-content-center">
								<table class="table table-hover" style="margin-top: 20px;">
								 <colgroup>
								 	<col width="65%" />
								 	<col width="35%" />
								 </colgroup>
									 <thead style="text-align: center;">
										 <tr>
										 	<th>루틴명</th><th>계절</th>
										 </tr>
									 </thead>
									 <tbody id="seasonBody" style="text-align: center;">
										<c:if test="${not empty sInfo}">
										 	<c:forEach items="${sInfo}" var="info">
											 	<tr data-season-no="${info.seasonNo}" data-routine-title="${info.routineTitle}" onclick="showModal(this)">
											 		<td>${info.routineTitle}</td>
											 		<td>${info.seasonName}</td>
											 	</tr>
										 	</c:forEach>
										</c:if>
										<c:if test="${empty sInfo}">
											<tr>
												<td colspan='2' style="border: none;">
													<div style="margin-top: 35px;">
														<div class="d-flex justify-content-center" style="margin-bottom: 15px;">
															<img src="${pageContext.request.contextPath}/assets/img/noinfo.png" style="width: 100px; height: 100px;">
														</div>
														<h5>작성된 기록이 없습니다.</h5>
													</div>
												</td>
											</tr>
										</c:if>
									 </tbody>
								</table>
							</div>
							
							<!-- 모달 -->
							<div class="modal fade" id="seasonModal" tabindex="-1" aria-labelledby="seasonModalLabel" aria-hidden="true">
								<div class="modal-dialog modal-lg modal-dialog-scrollable">
									<div class="modal-content">
										<div class="modal-header" style="padding: 20px;">
											<h5 class="modal-title" id="modalRoutineTitle"></h5>
											<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body" style="padding: 0;">
											<table style="width: 100%;">
												<tbody id="seasonDetail">
												</tbody>
											</table>
										</div>
										<div class="modal-footer">
											<form action="/routineUpdate">
												<input type="hidden" name="seasonNo" id="modalSeasonNo">
												<button type="submit" class="btn btn-primary-light">수정</button>
											</form>
											<form action="/delSeason" method="post">
												<input type="hidden" name="seasonNo" id="modalSeasonNo2">
												<button type="submit" class="btn btn-primary-light" style="margin-right: 15px;">삭제</button>
											</form>
										</div>
									</div>
								</div>
							</div>
							<!-- 모달 -->
							
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
											<div class="modal-header header-none" style="margin-top: 15px; margin-right: 10px;">
												<button type="button" class="btn-close" data-bs-dismiss="modal"
													aria-label="Close"></button>
											</div>
											<div class="modal-body" style="padding-top: 0; padding-right: 30px; padding-left: 30px; padding-bottom: 30px;">
												<form id="addInfoForm" action="/addInfoDo" method="post">
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
												            <button type="button" class="face_btn skin-type-btn" data-value="건성" style="margin-right: 10px;">건성</button>
												            <button type="button" class="face_btn skin-type-btn" data-value="지성">지성</button>
												        </div>
												        <div class="d-flex justify-content-between">
												            <button type="button" class="face_btn skin-type-btn" data-value="복합성" style="margin-right: 10px;">복합성</button>
												            <button type="button" class="face_btn skin-type-btn" data-value="수부지">수부지</button>
												        </div>
												        <input id="faceType" type="hidden" name="faceType">
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
												            <button type="button" class="face_btn add-info-btn" data-value="민감성" style="margin-right: 10px;">민감성</button>
												            <button type="button" class="face_btn add-info-btn" data-value="여드름">여드름</button>
												        </div>
												        <input id="addInfo1" type="hidden" name="addType1">
												        <input id="addInfo2" type="hidden" name="addType2">
												        <input id="memId" type="hidden" name="memId" value="${sessionScope.login.memId}">
												    </div>
												    <div class="d-flex justify-content-end" style="margin-bottom: 15px;">
												        <button type="button" id="addInfoBtn"
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
		
		// 페이지가 처음 로드될 때 "피부 기록" 탭을 활성화
        $('.tab-link[data-target="face"]').addClass('active');

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
        	 // 모든 탭 링크에서 active 클래스 제거
            $(".tab-link").removeClass("active");
        	 
         	// 클릭된 a 태그에 active 클래스 추가
            $(this).addClass("active");
        	 
            // 클릭된 a 태그의 data-target 속성 값 가져오기
            let target = $(this).data('target');

            // 모든 content-section div 숨기기
            $('.content-section').hide();

            // 해당하는 div 보이기
            $('#' + target).show();
        });
        
        $(".delete_submit").on("click", function() {
            // 알림창 표시
            if (confirm("정말로 삭제하시겠습니까?")) {
                // 확인을 누르면 폼 제출
                $(".deleteForm").submit();
            }
        });
        
        // 단일 선택: 피부 타입 버튼
        $('.skin-type-btn').click(function() {
            if ($(this).css('border-color') === 'rgb(61, 61, 61)') {
                // 이미 선택된 버튼 클릭 시 테두리를 원래 색상으로 되돌림
                $(this).css('border', '1px solid #C7C7C7');
                $('#faceType').val(""); // 값 비움
            } else {
                // 모든 버튼 테두리 초기화
                $('.skin-type-btn').css('border', '1px solid #C7C7C7');
                // 클릭한 버튼에 파란색 테두리 추가
                $(this).css('border', '2px solid #3D3D3D');
                // 선택한 값 입력 필드에 저장
                $('#faceType').val($(this).data('value'));
            }
        });

        // 중복 선택: 추가 정보 버튼
        $('.add-info-btn').click(function() {
            // 선택된 버튼에 파란색 테두리 추가/제거
            if ($(this).css('border') === '2px solid rgb(61, 61, 61)') {
                // 파란색 테두리이면 원래 색으로 변경
                $(this).css('border', '1px solid #C7C7C7');
                removeInfoValue($(this).data('value'));
            } else {
                $(this).css('border', '2px solid #3D3D3D');
                addInfoValue($(this).data('value'));
            }
        });

        // 추가 정보 입력 필드에 값 추가
        function addInfoValue(value) {
            if ($('#addInfo1').val() === "") {
                $('#addInfo1').val(value);
            } else if ($('#addInfo2').val() === "") {
                $('#addInfo2').val(value);
            }
        }

        // 추가 정보 입력 필드에서 값 제거
        function removeInfoValue(value) {
            if ($('#addInfo1').val() === value) {
                $('#addInfo1').val("");
            } else if ($('#addInfo2').val() === value) {
                $('#addInfo2').val("");
            }
        }

        $("#addInfoBtn").on("click", function() {
            // 알림창 표시
            if (confirm("정보가 등록되었습니다.")) {
                // 확인을 누르면 폼 제출
                $("#addInfoForm").submit();
            }
        });
        
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
	
    function showModal(td) {
		
		// td 요소에서 data 속성 가져오기
		const seasonNo = $(td).data("season-no");
		const routineTitle = $(td).data("routine-title");
		
		// 모달에 데이터 넣기
		$("#modalSeasonNo").val(seasonNo);
		$("#modalSeasonNo2").val(seasonNo);
		$("#modalRoutineTitle").text(routineTitle);
		
		$.ajax({
			  url: "/seasonDetail"
			, type: "GET"
			, data: {seasonNo : seasonNo}
			, success: function(data) {
				console.log("접선성공", seasonNo);
				console.log("데이타확인", data);
				let str = "";
				
				data.forEach(function(item) {
					let sunImage = item.dayRecord == 'Y' ? 'sun_full.png' : 'sun_none.png';
					let moonImage = item.nightRecord == 'Y' ? 'moon_full.png' : 'moon_none.png';
					
					let dayImage = "${pageContext.request.contextPath}/assets/img/" + sunImage;
					let nightImage = "${pageContext.request.contextPath}/assets/img/" + moonImage;
					
					let imagePath = item.cosImage === "none.jpg" 
                        ? "${pageContext.request.contextPath}/assets/img/none.jpg"   // 기본 이미지 경로 설정
                        : "${pageContext.request.contextPath}" + item.cosImage;  // 실제 이미지 경로 설정
					
					str += "<tr>";
					str += "<td style='margin-left: 15px; margin-right: 15px;'>";
					str += "<a class='tr_a' href='<c:url value='/products?cosNo="+ item.cosmeticNo +"' />'>";
					str += "<div class='d-flex'>";
					str += "<div class='justify-content-center'>";
					str += "<div class='image-container'>";
					str += "<img src='"+ imagePath +"' style='height: 80px;'>";
					str += "</div>";
					str += "</div>";
					str += "<div class='d-flex flex-column justify-content-center'>";
					str += "<div class='d-flex'>";
					str += "<span style='color: #A6A6A6; margin-right: 6px; font-size: 17px'>"+ item.companyName +"</span>";
					str += "</div>";
					str += "<div>";
					str += "<span style='font-size: 17px;'>"+ item.name +"</span>";
					str += "</div>";
					str += "</div>";
					str += "<div class='d-flex justify-content-center' style='margin-left: auto; margin-right: 30px; align-items: center;'>";
					str += "<img src='"+ dayImage +"' style='width: 25px; height: 25px; margin-right: 20px;'>";
					str += "<img src='"+ nightImage +"' style='width: 25px; height: 25px;'>";
					str += "</div>";
					str += "</div>";
					str += "</a>";
					str += "</td>";
					str += "</tr>";
				});

				$("#seasonDetail").html(str);
			}, error: function(xhr, status, error) {
				console.log("상세조회 실패", error);
			}
		})
		
		// 모달창 표시
		$("#seasonModal").modal("show");
	}

	function cosMachine(td) {
		// td 요소에서 data 속성 가져오기
		const cosmeticNo = $(td).data("cosmetic-no");
		const cateCd = $(td).data("cate-cd");

		console.log("cosNo", cosmeticNo);
		console.log("cateCd", cateCd);
		
		$.ajax({
			  url: "http://127.0.0.1:5000/recommend"
			, type: "GET"
			, data : { category: cateCd
					 , cosmeticNo: cosmeticNo }
			, success: function(data) {
		        // similarity_based 배열의 모든 데이터 출력
		        console.log("유사도 기반 추천:", data.similarity_based);
		        let str = "";
		        
		        // similarity_based 배열을 순회하면서 각 아이템 출력
		        data.similarity_based.forEach((item, index) => {
		        	
		        	$("#hashtag").text(item.HASHTAG);
		        	
		            let imagePath = item.COS_IMAGE === "none.jpg" 
                        ? "${pageContext.request.contextPath}/assets/img/none.jpg"   // 기본 이미지 경로 설정
                        : "${pageContext.request.contextPath}" + item.COS_IMAGE;  // 실제 이미지 경로 설정
		            
	                str += "<tr>";
	                str += "<td style='margin-left: 15px; margin-right: 15px;'>";
	                str += "<a class='tr_a' href='<c:url value='/products?cosNo="+ item.COSMETIC_NO +"' />'>";
	                str += "<div class='d-flex'>";
	                str += "<div class='justify-content-center'>";
	                str += "<div class='image-container'>";
	                str += "<img src='${pageContext.request.contextPath}"+ item.COS_IMAGE +"' style='height: 80px;'>";
	                str += "</div>";
	                str += "</div>";
	                str += "<div class='d-flex flex-column justify-content-center'>";
	                str += "<div style='margin-bottom: 6px;'>";
	                str += "<div>";
	                str += "<span style='color: #A6A6A6; font-size: 15px'>"+ item.COMPANY_NAME +"</span>";
	                str += "</div>";
	                str += "<div>";
	                str += "<span style='font-size: 17px;'>"+ item.NAME +"</span>";
	                str += "</div>	";
	                str += "</div>";
	                str += "<div>";
	                str += "<img src='${pageContext.request.contextPath}/assets/img/star_full.png' style='width: 17px; height: 17px; margin-right: 5px;'>";
	                str += "<span style='font-size: 15px; margin-right: 2px;'>"+ item.STAR_SCORE +"</span>";
	                str += "<span style='color: #A6A6A6; font-size: 15px;'>("+ item.REVIEW_COUNT +")</span>";
	                str += "</div>";
	                str += "</div>";
	                str += "</div>";
	                str += "</a>";
	                str += "</td>";
	                str += "</tr>";
		                
		        });
		        $("#recomBody").html(str);
		        
			}, error: function(xhr, status, error) {
				console.log("상세조회 실패", error);
			}
		});
		
		// 모달창 표시
		$("#recommendModal").modal("show");
	}
	
	function season_filter(season, element) {
		let memId = '${sessionScope.login.memId}';
		
		let sendData = JSON.stringify({ "memId":memId
							 		  , "seasonName":season});
		
		$(".season-btn").removeClass("btn-primary").addClass("btn-primary-light");
		$(element).removeClass("btn-primary-light").addClass("btn-primary");
		
// 		console.log(sendData);
		$.ajax({
			  url : '<c:url value="/seasonInfo" />'
			, type : "POST"
			, data : sendData
			, contentType : 'application/json'
			, success : function(res) {
				console.log("응답");
				console.log("res :", res);
// 				console.log(res.length);
				
				let str = "";
				
				if (res.length == 0) {
					str += "<tr>";
					str += "<td colspan='2' style='border: none;'>";
					str += "<div style='margin-top: 35px;'>";
					str += "<div class='d-flex justify-content-center' style='margin-bottom: 15px;'>";
					str += "<img src='${pageContext.request.contextPath}/assets/img/noinfo.png' style='width: 100px; height: 100px;'>";
					str += "</div>";
					str += "<h5>작성된 기록이 없습니다.</h5>";
					str += "</div>";
					str += "</td>";
					str += "</tr>";
				} else {
					res.forEach(function (item) {
						str += "<tr data-season-no='"+ item.seasonNo +"' data-routine-title='"+ item.routineTitle +"' onclick='showModal(this)'>";
						str += "<td>"+ item.routineTitle +"</td>";
						str += "<td>"+ item.seasonName +"</td>";
						str += "</tr>";
					});
				}
				
// 				console.log(str);
				$("#seasonBody").html(str);
			}, error : function(e) {
				console.log(e);
			}
		});
	}
</script>
</html>