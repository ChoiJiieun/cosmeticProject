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
	
    .star_rating {
        width: 100%; 
        box-sizing: border-box; 
        display: inline-flex; 
        float: left;
        flex-direction: row; 
        justify-content: flex-start;
        margin-bottom: 25px;
        margin-top: 5px;
    }

    .star_rating .star {
        width: 40px; 
        height: 40px; 
        display: inline-block; 
        background: url(resources/assets/img/star_none.png) no-repeat; 
        background-size: 100%; 
        box-sizing: border-box; 
    }

    .star_rating .star.on {
        width: 40px; 
        height: 38px;
        display: inline-block; 
        background: url(resources/assets/img/star_full.png) no-repeat;
        background-size: 100%; 
        box-sizing: border-box; 
    }

    .star_box {
        width: 500px;
        box-sizing: border-box;
        display: inline-block;
        background: #F3F4F8;
        padding: 15px;
        border: 0;
        border-radius: 5px;
        height: 150px;
        resize: none;
        font-size: 15px;
        font-family: sans-serif;
    }

	#good_comment_div, #bad_comment_div {
	    border-radius: 5px;
	    margin-top: 10px;
	    padding-top: 10px;
	    padding-bottom: 10px;
	}

    .star_box:focus {
        outline: none;
    }

    .btn02 {
        display:block;
        width: 500px;
        font-weight: bold;
        color: white;
        border: 0;
        border-radius: 5px;
        max-height: 50px;
        padding: 15px 0;
        font-size: 1.1em;
        text-align: center;
        background:#3D3D3D;
        margin-top: 25px;
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
            <div class="d-flex justify-content-center" style="width: 60%; margin: 0 auto; padding-top: 30px;">
            	<div style="width: 60%; margin-bottom: 30px;">
	                <form action="reviewUpdateDo" method="post">
						<div class="d-flex justify-content-center border-bottom">
						    <div class="flex-column justify-content-center" style="margin-right: 20px; margin-bottom: 30px;">
						        <c:if test="${reList.cosImage == null || fn:length(reList.cosImage) == 0}">
						            <img src="${pageContext.request.contextPath}/assets/cosmetic_img/none.jpg" style="height: 80px;">
						        </c:if>
						        <c:if test="${reList.cosImage != null && fn:length(reList.cosImage) > 0}">
						            <img src="${pageContext.request.contextPath}${reList.cosImage}" style="height: 120px;">
						        </c:if>
						    </div>
						    <div class="d-flex flex-column justify-content-center">
						        <div style="margin-bottom: 6px;">
						            <span style="color: #A6A6A6; margin-right: 6px; font-size: 18px">${reList.companyName}</span>
						            <div>
							            <span style="font-size: 18px;">${reList.name}</span>
						            </div>
						        </div>
						    </div>
						</div>
						<input type="hidden" name="cosmeticNo" value="${reList.cosmeticNo}">
						<input type="hidden" name="reviewNo" value="${reList.reviewNo}">
						<input type="hidden" name="memId" value="${sessionScope.login.memId}">
					    <div style="margin-top: 25px;">
					        <div class="d-flex justify-content-center">
					            <div style="text-align: center;">
					                <span style="font-size: 20px;">평점을 선택해주세요</span>
					                <div>
					                    <div class ="star_rating">
					                        <span class="star on" value="1"> </span>
					                        <span class="star" value="2"> </span>
					                        <span class="star" value="3"> </span>
					                        <span class="star" value="4"> </span>
					                        <span class="star" value="5"> </span>
											<input type="hidden" name="defaultScore" value="${reList.starScore}">
					                    </div>
					                </div>
					            </div>
					        </div>
					        <div class="d-flex justify-content-center">
					            <div>
					                <input id="ratingScore" type="hidden" name="starScore">
					                <div>
					                    <span style="font-size: 20px;">좋았던 점</span>
					                    <span style="font-size: 15px;">(최소 20자 이상)</span>
										<div>
										    <div id="good_comment_div" class="d-grid" style="background-color: #F3F4F8; width: 500px;">
										        <textarea id="good_comment_text" name="goodComment" class="star_box" placeholder="사용하신 제품의 자세한 리뷰를 남겨주세요" >${reList.goodComment}</textarea>
										        <div class="d-flex justify-content-between" style="margin-left: 15px; margin-right: 15px; margin-top: 10px;">
										            <span style="font-size: 15px; color: #9a9a9a;">솔직한 리뷰를 작성해 주세요</span>
										            <span id="good_count" style="font-size: 15px;">0/800</span>
										        </div>
										    </div>
										</div>
					                </div>
					                <div style="margin-top: 20px;">
					                    <span style="font-size: 20px;">아쉬운 점</span>
					                    <span style="font-size: 15px;">(최소 20자 이상)</span>
										<div>
										    <div id="bad_comment_div" class="d-grid" style="background-color: #F3F4F8; width: 500px;">
										        <textarea id="bad_comment_text" name="badComment" class="star_box" placeholder="사용하신 제품의 자세한 리뷰를 남겨주세요" >${reList.badComment}</textarea>
										        <div class="d-flex justify-content-between" style="margin-left: 15px; margin-right: 15px; margin-top: 10px;">
										            <span style="font-size: 15px; color: #9a9a9a;">솔직한 리뷰를 작성해 주세요</span>
										            <span id="bad_count" style="font-size: 15px;">0/800</span>
										        </div>
										    </div>
										</div>
					                </div>
					                <input type="submit" class="btn02" value="리뷰 수정"/>
					            </div>
					        </div>
					    </div>
	                </form>
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
        
        let good_content = $("#good_comment_text").val();
        $("#good_count").text(good_content.length + "/800");

        let bad_content = $("#bad_comment_text").val();
        $("#bad_count").text(bad_content.length + "/800");
        
        let defaultScore = parseInt($('input[name="defaultScore"]').val());
        
        setDefaultRating(defaultScore);

        // 1. 별을 클릭할 때 이벤트 처리
        $('.star_rating > .star').click(function() {
            // 모든 별의 'on' 클래스를 제거하고 클릭한 별과 그 이전 별들에 'on' 추가
            $(this).parent().children('span').removeClass('on');
            $(this).addClass('on').prevAll('span').addClass('on');
            
            // 선택한 별의 값(value)을 가져옴
            var rating = $(this).attr('value');
            
            // 히든 필드와 input 필드에 값을 설정
            $("#ratingScore").val(rating);
            
        });
        
     	// 기본 별점 설정 함수
        function setDefaultRating(defaultRating) {
            // 별점 초기화 및 기본 별점 설정
            $('.star_rating > .star').removeClass('on');
            $('.star_rating > .star').each(function(index) {
                if (index < defaultRating) {
                    $(this).addClass('on');
                }
            });

            // input과 히든 필드에 기본 값 설정
            $("#ratingScore").val(defaultRating);
        }
        
        $("#good_comment_text").focus(function() {
            $("#good_comment_div").css("outline", "2px solid #9a9a9a");
        });

        $("#good_comment_text").blur(function() {
            $("#good_comment_div").css("outline", "none");
        });

        $("#good_comment_text").keyup(function(e) {
            let content = $(this).val();

            // 글자수 세기
            if (content.length == 0 || content == '') {
                $("#good_count").text("0/800");
            } else {
                $("#good_count").text(content.length + "/800");
            }

            // 글자수 제한
            if (content.length > 800) {
                // 800자 넘어가면 타이핑 안되도록
                $(this).val($(this).val().substring(0, 800));
                // 800자 넘으면 알림창 뜨게
                alert("800자까지 입력 가능합니다.")
            }
        });
        
        $("#bad_comment_text").focus(function() {
            $("#bad_comment_div").css("outline", "2px solid #9a9a9a");
        });

        $("#bad_comment_text").blur(function() {
            $("#bad_comment_div").css("outline", "none");
        });

        $("#bad_comment_text").keyup(function(e) {
            let content = $(this).val();

            // 글자수 세기
            if (content.length == 0 || content == '') {
                $("#bad_count").text("0/800");
            } else {
                $("#bad_count").text(content.length + "/800");
            }

            // 글자수 제한
            if (content.length > 800) {
                // 800자 넘어가면 타이핑 안되도록
                $(this).val($(this).val().substring(0, 800));
                // 800자 넘으면 알림창 뜨게
                alert("800자까지 입력 가능합니다.")
            }
        });
	});
</script>
</html>