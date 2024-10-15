<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cosmetic</title>
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
					<button id="categori" class="nav-link link-secondary"
						style="width: 17%; font-size: 20px;">전체</button>
					<button id="btn-home" class="nav-link link-secondary"
						style="width: 17%; font-size: 20px;">공지</button>
					<button id="btn-rank" class="nav-link link-secondary"
						style="width: 17%; font-size: 20px;">자유</button>
					<button id="btn-notice" class="nav-link link-secondary"
						style="width: 17%; font-size: 20px;">질문</button>
					<button id="btn-notice" class="nav-link link-secondary"
						style="width: 17%; font-size: 20px;">꿀팁</button>
				</div>
			</div>

			<div>
				<div style="width: 54%; margin: 0 auto;">
					<table class="table table-hover" style="margin-top: 20px;">
						<tr>
							<td>
								<div class="d-flex" style="margin-top: 20px;">
									<div>
										<div class="d-flex">
											<img src="resources/assets/img/게시판_프로필.png" alt="">
											<div class="flex-column justify-content-center"
												style="margin-left: 15px;">
												<div>
													<span style="font-size: 18px;">글쓴이</span>
												</div>
												<div>
													<span style="color: #979797;">2024-09-03 16:11:32</span>
												</div>
											</div>
										</div>
										<div style="padding: 20px;">
											<div style="margin-right: 10px;">
												<h5>ahc 아이크림 눈밑 + 팔자주름 없애기 표과본 홈케어템</h5>
												<span style="color: #979797;">안뇽하세요 잇님들 :&#41; 저희 엄마가
													옛날부터 피부과에서 일하고 계셔서 어렸을 때부터 저까지 관리를 정말 열심히 해주셨거든요..? 근데
													자취하고나서부터 서서히 상태가 안 좋아지기 시작하더니 나이 먹는 게 ㄹㅇ 티가 나는 거예요 다른 건 ...
												</span>
												<div class="d-flex" style="margin-top: 10px;">
													<span>공감 42</span> &nbsp;&nbsp;&nbsp;&nbsp; <span>댓글
														15</span>
												</div>
											</div>
										</div>
									</div>
									<img src="resources/assets/cosmetic_img/notice_ex.png"
										style="width: 185px; height: 185px;">
								</div>
							</td>
						</tr>
						<tr>
							<td>
								<div class="d-flex" style="margin-top: 20px;">
									<div>
										<div class="d-flex">
											<img src="resources/assets/img/게시판_프로필.png" alt="">
											<div class="flex-column justify-content-center"
												style="margin-left: 15px;">
												<div>
													<span style="font-size: 18px;">스무깅</span>
												</div>
												<div>
													<span style="color: #979797;">2024-09-02 12:41:18</span>
												</div>
											</div>
										</div>
										<div style="padding: 20px;">
											<div style="margin-right: 10px;">
												<h5>아이오페 선크림 사용감 좋은 자외선 차단제 추천!</h5>
												<span style="color: #979797;">잇님들!! 제가 이번에 자외선차단제 하나를
													샀는데 넘 좋은 것 같아서 후기 남기려구요ㅋㅋ 자외선차단제 같은 건 사계절 내내 챙겨줘야하다 보니까 그만큼
													사용감 좋은 게 최고인데 이거 진짜 사용감 제 스톼일.. 좋은 걸 저만 알고 있을 수는... </span>
												<div class="d-flex" style="margin-top: 10px;">
													<span>공감 28</span> &nbsp;&nbsp;&nbsp;&nbsp; <span>댓글
														3</span>
												</div>
											</div>
										</div>
									</div>
									<img src="resources/assets/cosmetic_img/notice_ex2.png"
										style="width: 185px; height: 185px;">
								</div>
							</td>
						</tr>
					</table>
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
    });
</script>
</html>