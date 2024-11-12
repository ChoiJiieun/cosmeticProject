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
	
	.alarm {
		padding: 20px;
		margin-top: 30px;
		margin-bottom: 30px;
		text-align: center;
		color: #9a9a9a;
	}
	
	#search_a {
	    text-decoration: none !important; /* 밑줄 제거 */
	    color: inherit !important; /* 기본 글씨 색상으로 변경 (상위 요소의 색상 따름) */
	}
	
	#search_a:hover {
	    text-decoration: none !important; /* hover 시에도 밑줄 제거 */
	    color: inherit !important; /* hover 시에도 글씨 색상 변화 없음 */
	}
	
    .del_btn {
    	background-color: white;
    	border: none;
    	color: #ababab;
    	font-size: 30px;
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
                    <h5 style="font-weight: bold; margin-bottom: 20px; padding-left: 20px;">계절별 루틴 수정</h5>
                </div>
                <form action="/routineUpdateDo" method="post">
	                <div class="d-flex justify-content-center">
						<table style="width: 90%;">
							<tbody id="routine_setting">
								<tr>
									<th>계절</th>
									<td>
			                    		<select name="seasonName" class="form-control input-sm">
			                    			<option value="">---선택---</option>
		                    				<option value="spring" ${seasonName == 'spring' ? 'selected' : ''}>봄</option>
		                    				<option value="summer" ${seasonName == 'summer' ? 'selected' : ''}>여름</option>
		                    				<option value="fall" ${seasonName == 'fall' ? 'selected' : ''}>가을</option>
		                    				<option value="winter" ${seasonName == 'winter' ? 'selected' : ''}>겨울</option>
			                    		</select>
									</td>
								</tr>
			                    <tr>
			                        <th>루틴명</th>
			                        <td>
			                        	<input name="routineTitle" class="form-control input-sm" type="text" value="${routineTitle}" required="required">
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
			                    </tr>
			                    <c:forEach items="${cosDetail}" var="cos">
									<tr>
									    <th>
									        <input type="hidden" name="cosmeticNo[]" value="${cos.cosmeticNo}">
									    </th>
									    <td>
									        <div class="d-flex" style="width: 622px;">
									            <div class="justify-content-center">
									                <div class="image-container">
									                    <c:if test="${cos.cosImage == none.jpg}">
									                        <img src="${pageContext.request.contextPath}/assets/img/none.jpg" style="height: 50px;">
									                    </c:if>
									                    <c:if test="${cos.cosImage != none.jpg}">
									                        <img src="${pageContext.request.contextPath}${cos.cosImage}" style="height: 80px;">
									                    </c:if>
									                </div>
									            </div>
									            <div class="d-flex flex-column justify-content-center">
									                <div class="d-flex">
									                    <span style="color: #A6A6A6; margin-right: 6px; font-size: 17px">${cos.companyName}</span>
									                </div>
									                <div>
									                    <span style="font-size: 17px;">${cos.name}</span>
									                </div>
									            </div>
									            <div class="d-flex justify-content-end" style="margin-left: auto; align-items: center;">
									                <img src="${pageContext.request.contextPath}/assets/img/${cos.dayRecord == 'Y' ? 'sun_full' : 'sun_none'}.png"
									                    style="width: 25px; height: 25px; margin-right: 20px;" onclick="toggleImage(this)">
									                <input type="hidden" name="dayRecord[]" value="N" id="dayRecord_${cos.cosmeticNo}">
									                <img src="${pageContext.request.contextPath}/assets/img/${cos.nightRecord == 'Y' ? 'moon_full' : 'moon_none'}.png"
									                    style="width: 25px; height: 25px;" onclick="toggleImage(this)">
									                <input type="hidden" name="nightRecord[]" value="N" id="nightRecord_${cos.cosmeticNo}">
									                <button type="button" name="del[]" class="del_btn" style="margin-left: 38px;" onclick="deltr(this, ${cos.cosmeticNo}, ${cos.seasonNo})">×</button>
									            </div>
									        </div>
									    </td>
									</tr>
			                    </c:forEach>
							</tbody>
						</table>
	                </div>
	                <div class="d-flex justify-content-end" style="border-top: 1px solid #3D3D3D; margin-top: 40px; margin-bottom: 30px; padding-top: 20px;">
	                	<input type="hidden" name="seasonNo" id="seasonNo" value="${seNo}">
	                    <button type="submit" class="btn btn-primary">&nbsp;&nbsp;&nbsp;완료&nbsp;&nbsp;&nbsp;</button>
	                </div>
                </form>
				<!-- Modal -->
				<div class="modal fade" id="addInfo_modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" style="width: 450px;">
						<div class="modal-content">
							<div class="modal-header" style="margin-top: 15px; margin-right: 10px;">
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body" style="padding-top: 20px;; padding-right: 30px; padding-left: 30px; padding-bottom: 30px;">
							    <input id="cos_search" class="form-control input-sm" type="text" name="query">
							    <div style="">
							    	<table class="table">
							    		<tbody id="searchBody">
											<tr>
												<td>
													<h6 class="alarm">화장품을 검색하세요</h6>
												</td>
											</tr>
							    		</tbody>
							    	</table>
							    </div>
							</div>
						</div>
					</div>
				</div>
				<!-- Modal -->
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
	
	function deltr(obj, cosNo, seaNo) {
		let sendData = JSON.stringify({ "cosmeticNo" : cosNo,
										"seasonNo" : seaNo});
		
		$.ajax({
			  url: '<c:url value="/delSeCos" />'
			, type: 'POST'
			, data: sendData
			, contentType: 'application/json'
			, dataType: "text"
			, success: function(res) {
				if (res == 'success') {
					var tr = $(obj).closest('tr');
					tr.remove();
					console.log("삭제 완료");
				}
			}, error: function(e) {
				console.log(e);
			}
		});
		
	}
	
	$("#cos_search").on("keyup", function(key) {
		if (key.keyCode == 13) {
			let keyword = $("#cos_search").val();
			
	        $.ajax({
	            url: "/routine_search",  // 검색 요청을 보낼 URL
	            type: "GET",             // GET 방식으로 요청
	            data: { keyword: keyword },  // 검색 키워드 전달
	            success: function(data) {    // 서버에서 데이터를 성공적으로 받았을 때
	                let str = "";

	                data.forEach(function(item) {
	                    let imagePath = item.cosImage === "none.jpg" 
	                                    ? "${pageContext.request.contextPath}/assets/img/none.jpg"   // 기본 이미지 경로 설정
	                                    : "${pageContext.request.contextPath}" + item.cosImage;  // 실제 이미지 경로 설정

	                    str += "<tr onclick='updateRoutineInfo(`"+ item.cosmeticNo +"` , `"+ imagePath +"`, `"+ item.companyName +"`, `"+ item.name +"`)'>";
	                    str += "<td>";
	                    str += "<div class='d-flex'>";
	                    str += "<div class='justify-content-center'>";
	                    str += "<div class='image-container'>";
	                    str += "<img src='" + imagePath + "' style='height: 80px;'>";
	                    str += "</div>";
	                    str += "</div>";
	                    str += "<div class='d-flex flex-column justify-content-center'>";
	                    str += "<div class='d-flex'>";
	                    str += "<span style='color: #A6A6A6; margin-right: 6px; font-size: 17px'>" + item.companyName + "</span>";
	                    str += "</div>";
	                    str += "<div>";
	                    str += "<span style='font-size: 17px;'>" + item.name + "</span>";
	                    str += "</div>";
	                    str += "</div>";
	                    str += "</div>";
	                    str += "</td>";
	                    str += "</tr>";
	                });

	                $("#searchBody").html(str);  // 기존 내용을 새로 검색한 내용으로 덮어씀
	            },
	            error: function(xhr, status, error) {
	                console.log("검색 실패: ", error);
	            }
	        });
		}
	});
	
	function updateRoutineInfo(number, imagePath, companyName, productName) {
		// 이미 추가된 화장품 번호와 중복되는지 확인
		let isDuplicate = false;
		
		// 기존에 추가된 화장품 번호를 가진 input을 모두 선택
		$("input[name='cosmeticNo[]']").each(function() {
	        if ($(this).val().toString() == number.toString()) {
	            isDuplicate = true; // 중복이 확인되면 true로 설정
	            return false; // each 반복 종료
	        }
		});
		
	    // 중복되는 경우 alert 메시지 출력 후 함수 종료
	    if (isDuplicate) {
	        alert("이미 선택된 화장품입니다.");
	        return;
	    }
	    
	    let seNo = $("#seasonNo").val();
		
		let sendData = JSON.stringify({ "cosmeticNo" : number,
										"seasonNo" : seNo});
	    
		$.ajax({
			  url: '<c:url value="/AddSeCos" />'
			, type: 'POST'
			, data: sendData
			, contentType: 'application/json'
			, dataType: "text"
			, success: function(res) {
				if (res == 'success') {
					console.log("추가 완료");
					let str = "";
					
					str += "<tr>";
					str += "<th>";
				    str += "<input type='hidden' name='cosmeticNo[]' value='" + number + "'>";
					str += "</th>";
					str += "<td>";
					str += "<div class='d-flex' style='width: 622px;'>";
					str += "<div class='justify-content-center'>";
					str += "<div class='image-container'>";
					str += "<img src='"+ imagePath +"' style='height: 80px;'>";
					str += "</div>";
					str += "</div>";
					str += "<div class='d-flex flex-column justify-content-center'>";
					str += "<div class='d-flex'>";
					str += "<span style='color: #A6A6A6; margin-right: 6px; font-size: 17px'>"+ companyName +"</span>";
					str += "</div>";
					str += "<div>";
					str += "<span style='font-size: 17px;'>"+ productName +"</span>";
					str += "</div>";
					str += "</div>";
					str += "<div class='d-flex justify-content-end' style='margin-left: auto; align-items: center;'>";
					str += "<img src='${pageContext.request.contextPath}/assets/img/sun_none.png' style='width: 25px; height: 25px; margin-right: 20px;' onclick='toggleImage(this)'>";
					str += "<input type='hidden' name='dayRecord[]' value='N' id='dayRecord_"+ number +"'>";
					str += "<img src='${pageContext.request.contextPath}/assets/img/moon_none.png' style='width: 25px; height: 25px;' onclick='toggleImage(this)'>";
					str += "<input type='hidden' name='nightRecord[]' value='N' id='nightRecord_" +number +"'>";
					str += "<button type='button' name='del[]' class='del_btn' style='margin-left: 38px;' onclick='deltr(this, "+ number +", "+ seNo +")'>×</button>";
					str += "</div>";
					str += "</div>";
					str += "</td>";
					str += "</tr>";

					$("#routine_setting").append(str);
					
					$('#addInfo_modal').modal('hide');
				}
			}, error: function(e) {
				console.log(e);
			}
		})
		
	}
	
    function toggleImage(img) {
        const sunNoneSrc = '${pageContext.request.contextPath}/assets/img/sun_none.png';
        const moonNoneSrc = '${pageContext.request.contextPath}/assets/img/moon_none.png';
        const sunFullSrc = '${pageContext.request.contextPath}/assets/img/sun_full.png';
        const moonFullSrc = '${pageContext.request.contextPath}/assets/img/moon_full.png';
        
        // 현재 이미지의 src가 sun_none인 경우
        if (img.src.includes("sun_none")) {
            img.src = sunFullSrc;  // sun_full로 변경
            img.nextElementSibling.value = 'Y';
        } 
        // 현재 이미지의 src가 sun_full인 경우
        else if (img.src.includes("sun_full")) {
            img.src = sunNoneSrc;  // sun_none으로 변경
            img.nextElementSibling.value = 'N';
        }
        // 현재 이미지의 src가 moon_none인 경우
        else if (img.src.includes("moon_none")) {
            img.src = moonFullSrc;  // moon_full로 변경
            img.nextElementSibling.value = 'Y';
        } 
        // 현재 이미지의 src가 moon_full인 경우
        else if (img.src.includes("moon_full")) {
            img.src = moonNoneSrc;  // moon_none으로 변경
            img.nextElementSibling.value = 'N';
        }
    }
    

</script>
</html>


