<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cosmetic</title>
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
				<div class="d-flex" id="choose_div" style="height: 47px;">
					<button id="categori" class="nav-link px-4 link-secondary"
						style="width: 25%; font-size: 20px; border-left: 1px solid #D9D9D9 !important; border-right: 1px solid #D9D9D9 !important;">
						카테고리별</button>
					<button id="btn-home" class="nav-link link-secondary px-4"
						style="width: 25%; font-size: 20px; border-left: 1px solid #D9D9D9 !important;">피부별</button>
					<button id="btn-rank" class="nav-link px-4 link-secondary"
						style="width: 25%; font-size: 20px; border-left: 1px solid #D9D9D9 !important;">연령별</button>
					<button id="btn-notice" class="nav-link px-4 link-secondary"
						style="width: 25%; font-size: 20px; border-left: 1px solid #D9D9D9 !important; border-right: 1px solid #D9D9D9 !important;">퍼스널컬러별</button>
				</div>
			</div>
			<div style="border-bottom: 1px solid #D9D9D9;">
				<div class="container d-flex justify-content-center"
					style="height: 47px;">
					<button id="categori" class="nav-link link-secondary"
						style="width: 11%; font-size: 20px;">건성</button>
					<button id="btn-home" class="nav-link link-secondary"
						style="width: 11%; font-size: 20px;">지성</button>
					<button id="btn-rank" class="nav-link link-secondary"
						style="width: 11%; font-size: 20px;">중성</button>
					<button id="btn-notice" class="nav-link link-secondary"
						style="width: 11%; font-size: 20px;">복합성</button>
					<button id="btn-notice" class="nav-link link-secondary"
						style="width: 11%; font-size: 20px;">민감성</button>
					<button id="btn-notice" class="nav-link link-secondary"
						style="width: 11%; font-size: 20px;">여드름</button>
					<button id="btn-notice" class="nav-link link-secondary"
						style="width: 11%; font-size: 20px;">아토피</button>
				</div>
			</div>
			<div style="width: 60%; margin: 0 auto;">
				<div style="margin-top: 20px;">
					<button type="button" class="btn btn-primary"
						data-bs-toggle="modal" data-bs-target="#categori_modal">
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
													<a href="#" style="color: #000000;">카테고리 전체</a>
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
														<a href="#" class="tab-link">전체</a> <a href="#"
															class="tab-link">스킨</a> <a href="#" class="tab-link">로션/에멀젼</a>
														<a href="#" class="tab-link">에센스/앰플/세럼</a> <a href="#"
															class="tab-link">페이스오일</a> <a href="#" class="tab-link">크림</a>
														<a href="#" class="tab-link">아이케어</a> <a href="#"
															class="tab-link">미스트</a> <a href="#" class="tab-link">젤</a>
														<a href="#" class="tab-link">스킨/토너 패드</a> <a href="#"
															class="tab-link">밤/멀티밤</a>
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
															<a href="#" class="tab-link">전체</a> <a href="#"
																class="tab-link">클렌징 폼</a> <a href="#" class="tab-link">클렌징
																워터</a> <a href="#" class="tab-link">클렌징 젤</a> <a href="#"
																class="tab-link">클렌징 오일</a> <a href="#" class="tab-link">클렌징
																로션/크림</a> <a href="#" class="tab-link">비누</a> <a href="#"
																class="tab-link">티슈/패트</a> <a href="#" class="tab-link">립/아이
																리무버</a> <a href="#" class="tab-link">스크럽/필링</a> <a href="#"
																class="tab-link">파우더</a> <a href="#" class="tab-link">밤</a>
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
															<a href="#" class="tab-link">전체</a> <a href="#"
																class="tab-link">시트마스크</a> <a href="#" class="tab-link">부분마스크/팩</a>
															<a href="#" class="tab-link">워시오프 팩</a> <a href="#"
																class="tab-link">필오브 팩</a> <a href="#" class="tab-link">슬리핑
																팩</a> <a href="#" class="tab-link">패치</a> <a href="#"
																class="tab-link">코팩</a> <a href="#" class="tab-link">부분마스크
																패드</a>
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
															<a href="#" class="tab-link">전체</a> <a href="#"
																class="tab-link">선크림/로션</a> <a href="#" class="tab-link">선스프레이</a>
															<a href="#" class="tab-link">선케어 기타</a> <a href="#"
																class="tab-link">선스틱</a> <a href="#" class="tab-link">선쿠션/팩트</a>
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
															<a href="#" class="tab-link">전체</a> <a href="#"
																class="tab-link">바디워시</a> <a href="#" class="tab-link">바디로션</a>
															<a href="#" class="tab-link">바디크림/젤</a> <a href="#"
																class="tab-link">바디오일/에센스</a> <a href="#"
																class="tab-link">바디스크럽</a> <a href="#" class="tab-link">바디미스트/샤워코롱</a>
															<a href="#" class="tab-link">핸드크림/밤</a> <a href="#"
																class="tab-link">풋케어</a> <a href="#" class="tab-link">입욕제</a>
															<a href="#" class="tab-link">여성청결제</a> <a href="#"
																class="tab-link">데오드란트</a> <a href="#" class="tab-link">바디기타</a>
															<a href="#" class="tab-link">바디케어 패드</a> <a href="#"
																class="tab-link">바디케어 패드</a> <a href="#"
																class="tab-link">핸드워시</a> <a href="#" class="tab-link">핸드케어
																기타</a>
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
															<a href="#" class="tab-link">전체</a> <a href="#"
																class="tab-link">린스/컨디셔너</a> <a href="#"
																class="tab-link">헤어에센스/오일</a> <a href="#"
																class="tab-link">헤어미스트</a> <a href="#" class="tab-link">바디오일/에센스</a>
															<a href="#" class="tab-link">스타일링</a> <a href="#"
																class="tab-link">헤어컬러링</a> <a href="#" class="tab-link">트리트먼트/팩</a>
															<a href="#" class="tab-link">두피 스케일러</a>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-primary"
											style="width: 80px;">적용</button>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="d-flex justify-content-center"
						style="margin-top: 30px; box-shadow: 5px 5px 20px #D9D9D9; border-radius: 1cm; padding: 20px;">
						<div class="d-flex flex-column justify-content-center">
							<img src="resources/assets/img/rank1.png" style="width: 55px; height: 55px;">
						</div>
						<img src="resources/assets/cosmetic_img/달바.png"
							style="width: 120px; height: 120px;">
						<div class="d-flex flex-column justify-content-center">
							<div class="d-flex" style="margin-bottom: 6px;">
								<span
									style="color: #A6A6A6; margin-right: 6px; font-size: 20px;">달바</span>
								<span style="font-size: 20px;">워터풀 선크림[SPF50+/PA++++]</span>
							</div>
							<div class="d-flex">
								<img src="resources/assets/img/star_full.png"
									style="width: 25px; height: 25px;">
								<div class="justify-content-center" style="margin-left: 5px;">
									<span style="font-size: 17px;">4.59</span> <span
										style="color: #A6A6A6; font-size: 17px;">(3,610)</span>
								</div>
							</div>
						</div>
						<div style="margin-left: 60px;">
							<div class="d-flex">
								<div class="align-self-center pt-2">
									<span
										style="font-size: 30px; color: #61A1FF; margin-right: 10px;">&#9786;</span>
								</div>
								<div class="justify-content-center align-self-center">
									<span style="font-size: 20px;">좋았던 점</span>
								</div>
							</div>
							<div class="d-grid" style="margin-top: 5px;">
								<span class="text-center" style="font-size: 20px;">흡수가 잘
									돼요</span> <span class="text-center" style="font-size: 20px;">보습이
									잘 돼요</span>
							</div>
						</div>
						<div style="margin-left: 60px;">
							<div class="d-flex">
								<div class="align-self-center pt-2">
									<span
										style="font-size: 30px; color: #7F7F7F; margin-right: 10px;">&#9785;</span>
								</div>
								<div class="justify-content-center align-self-center">
									<span style="font-size: 20px;">아쉬운 점</span>
								</div>
							</div>
							<div class="d-grid" style="margin-top: 5px;">
								<span class="text-center" style="font-size: 20px;">유분이
									있어요</span> <span class="text-center" style="font-size: 20px;">보정이
									안 돼요</span>
							</div>
						</div>
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
        
        let left_position = $("#btn-home").position().left;
        
        $("#choose_div").css({ "margin-right": left_position, "margin-left": left_position-1 });

			
    });
</script>
</html>