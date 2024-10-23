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
        /* margin-right: 10px; */
        display: inline-block; 
        background: url(resources/assets/img/star_none.png) no-repeat; 
        background-size: 100%; 
        box-sizing: border-box; 
    }

    .star_rating .star.on {
        width: 40px; 
        height: 38px;
        /* margin-right: 10px; */
        display: inline-block; 
        background: url(resources/assets/img/star_full.png) no-repeat;
        background-size: 100%; 
        box-sizing: border-box; 
    }

    .star_box {
        width: 500px;
        box-sizing: border-box;
        display: inline-block;
        margin-top: 10px;
        background: #F3F4F8;
        border: 0;
        border-radius: 5px;
        height: 150px;
        resize: none;
        padding: 15px;
        font-size: 15px;
        font-family: sans-serif;
    }

    .star_box:focus {
        outline-color: #9a9a9a;
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
	                <form action="#">
						<div class="d-flex justify-content-center border-bottom">
						    <div class="flex-column justify-content-center" style="margin-right: 20px; margin-bottom: 30px;">
	<%-- 					        <c:if test="${cos.cosImage == null || fn:length(cos.cosImage) == 0}"> --%>
						            <img src="resources/assets/cosmetic_img/달바.png" style="height: 80px;">
	<%-- 					        </c:if> --%>
	<%-- 					        <c:if test="${cos.cosImage != null && fn:length(cos.cosImage) > 0}"> --%>
	<%-- 					            <img src="${pageContext.request.contextPath}${cos.cosImage}" style="height: 120px;"> --%>
	<%-- 					        </c:if> --%>
						    </div>
						    <div class="d-flex flex-column justify-content-center">
						        <div style="margin-bottom: 6px;">
						            <span style="color: #A6A6A6; margin-right: 6px; font-size: 18px">달바</span>
						            <div>
							            <span style="font-size: 18px;">에센스 선크림 [SPF50+ PA+++++]</span>
						            </div>
						        </div>
						    </div>
						</div>
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
					                    </div>
					                </div>
					            </div>
					        </div>
					        <div class="d-flex justify-content-center">
					            <div>
					                <input id="ratingScore" type="hidden" name="ratingScore">
					                <div>
					                    <span style="font-size: 20px;">좋았던 점</span>
					                    <span style="font-size: 15px;">(최소 20자 이상)</span>
					                    <div style="display: block;">
					                        <textarea class="star_box" placeholder="사용하신 제품의 자세한 리뷰를 남겨주세요" ></textarea>
					                    </div>
					                </div>
					                <div style="margin-top: 20px;">
					                    <span style="font-size: 20px;">아쉬운 점</span>
					                    <span style="font-size: 15px;">(최소 20자 이상)</span>
					                    <div>
					                        <textarea class="star_box" placeholder="사용하신 제품의 자세한 리뷰를 남겨주세요" ></textarea>
					                    </div>
					                </div>
					                <input type="submit" class="btn02" value="리뷰 등록"/>
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
	});
	
    $('.star_rating > .star').click(function() {
        $(this).parent().children('span').removeClass('on');
        $(this).addClass('on').prevAll('span').addClass('on');

        var rating = $(this).attr('value');
        $("#ratingScore").val(rating)
        console.log($("#ratingScore").val())
    });
</script>
</html>