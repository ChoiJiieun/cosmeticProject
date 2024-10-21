<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
                                <li><a id="like_tag" href="#" class="tab-link" data-target="like">좋아요</a></li>
                                <li><a href="#" class="tab-link" data-target="review">리뷰</a></li>
                                <br>
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
                        <div id="review" class="content-section" style="display: none;">리뷰 섹션</div>
                        <div id="mycosmetic" class="content-section" style="display: none;">나의 화장대 섹션</div>
                        <div id="face" class="content-section" style="display: none;">피부 기록 섹션</div>
                        <div id="myinfo" class="content-section" style="display: none;">
                            <div style="border-bottom: 1px solid #3D3D3D;">
                                <h5 style="font-weight: bold; margin-bottom: 20px; padding-left: 20px;">나의 정보</h5>
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
    });
</script>
</html>