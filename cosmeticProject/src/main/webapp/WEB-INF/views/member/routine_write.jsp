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
	
	.input-sm:focus {
		border-color: #3D3D3D !important;
		outline: none;
		box-shadow: none !important;
	}
	
	#bo_content {
		height: 400px;
		width: 98%;
	}
	
	.btn-primary {
	    --bs-btn-bg: #3D3D3D;
	    --bs-btn-hover-color: white;
	    --bs-btn-hover-bg: #545454;
	    --bs-btn-border-color: none;
	    --bs-btn-hover-border-color: none;
	    --bs-btn-focus-shadow-rgb: none;
	    --bs-btn-active-color: #545454;
	    --bs-btn-active-bg: #3D3D3D;
	    --bs-btn-active-border-color: none;
	    height: 40px;
	}
	
	.input_btn {
		background-color: white;
		border: 1px solid #dee2e6;
		width: 580px;
		height: 37.6px;
		border-radius: 0.375rem;
	}
	
	th {
		width: 136px;
	}
	
  	.modal-header {  
  		border-bottom: none !important;
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
			<div style="width: 54%; margin: 0 auto;">
                <div style="border-bottom: 1px solid #3D3D3D; margin-top: 40px; margin-bottom: 30px;">
                    <h5 style="font-weight: bold; margin-bottom: 20px; padding-left: 20px;">계절별 루틴 기록</h5>
                </div>
                <form action="#" method="post">
	                <div class="d-flex justify-content-center">
						<table style="width: 90%;">
		                    <tr>
		                        <th>루틴명</th>
		                        <td>
		                        	<input name="boTitle" class="form-control input-sm" type="text"  required="required">
		                        </td>
		                    </tr>
		                    <tr>
		                        <th>화장품</th>
								<td>
									<div class="d-flex">
										<button class="input_btn" type="button"  data-bs-toggle="modal" data-bs-target="#addInfo_modal"></button>
			                        	<img src="${pageContext.request.contextPath}/assets/img/search.png" style="margin-left: 10px; height: 30px;">
		                        	</div>
								</td>
								<!-- Modal -->
								<div class="modal fade" id="addInfo_modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog modal-dialog-centered" style="width: 450px;">
										<div class="modal-content">
											<div class="modal-header" style="margin-top: 15px; margin-right: 10px;">
												<button type="button" class="btn-close" data-bs-dismiss="modal"
													aria-label="Close"></button>
											</div>
											<div class="modal-body" style="padding-top: 20px;; padding-right: 30px; padding-left: 30px; padding-bottom: 30px;">
											    <input class="form-control input-sm" type="text">
<!-- 											    <div class="d-flex justify-content-end" style="margin-bottom: 15px;"> -->
<!-- 											        <button type="button" id="addInfoBtn" class="btn btn-primary">&nbsp;&nbsp;&nbsp;완료&nbsp;&nbsp;&nbsp;</button> -->
<!-- 											    </div> -->
											</div>
										</div>
									</div>
								</div>
								<!-- Modal -->
		                    </tr>
						</table>
	                </div>
	                <div class="d-flex justify-content-end" style="border-top: 1px solid #3D3D3D; margin-top: 40px; margin-bottom: 30px; padding-top: 20px;">
	                    <button type="submit" class="btn btn-primary">&nbsp;&nbsp;&nbsp;완료&nbsp;&nbsp;&nbsp;</button>
	                </div>
                </form>
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
        
    });
</script>
</html>