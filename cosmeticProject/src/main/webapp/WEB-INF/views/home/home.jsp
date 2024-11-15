<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
        
        let left_position = $("#btn-rank").position().left;
        
        $("#choose_div").css({ "margin-right": left_position, "margin-left": left_position-1 });
        
    });
</script>
</html>