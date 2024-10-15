<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cosmetic</title>
<style>
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
    });
</script>
</html>