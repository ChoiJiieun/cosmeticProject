<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cosmetic</title>
<script src="${pageContext.request.contextPath }/resources/smarteditor2-2.8.2.3/js/HuskyEZCreator.js"></script>
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
	
    #profileImage {
       width: 51px;
       height: 51px;
       object-fit: cover;
       border-radius: 50%;
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
	
	.boContent {
		padding: 20px;
		border: 1px solid #D9D9D9;
	}
	
	.btn-outline-dark {
	    --bs-btn-color: #3D3D3D;
		--bs-btn-border-color: #3D3D3D;
		--bs-btn-hover-bg: #3D3D3D;
		--bs-btn-hover-border-color: none;
		--bs-btn-active-bg: #3D3D3D;
		--bs-btn-active-border-color: none;
	}
	
	.reply_input:focus {
		outline: 1px solid #7F7F7F;
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
    
    #del_btn {
    	background-color: white;
    	border: none;
    	color: #7F7F7F;
    	font-size: 30px;
    }
</style>
</head>

<body>
	<c:if test="${not empty loginError}">
		<script>
			alert('${loginError}');
		</script>
	</c:if>
	<c:if test="${not empty nologin}">
		<script>
			alert('${nologin}');
		</script>
	</c:if>
    <div class="container-fluid" style="padding: 0; margin-bottom: 30px;">
        <header>
			<jsp:include page="/WEB-INF/inc/header.jsp"></jsp:include>
        </header>
        <div id="categori_zone" style="height: 60vh; display: none;">
			<jsp:include page="/WEB-INF/views/category_menu.jsp"></jsp:include>
        </div>
        <main>
			<div style="width: 54%; margin: 0 auto;">
                <div class="d-flex justify-content-between" style="border-bottom: 1px solid #3D3D3D; margin-top: 40px; margin-bottom: 30px;">
                	<div>
	                    <h5 style="font-weight: bold; margin-bottom: 20px; padding-left: 20px;">게시글 조회</h5>
                	</div>
					<c:if test="${sessionScope.login.memId == free.memId }">
	                   	<button class="dropdown_btn" type="button" data-bs-toggle="dropdown" aria-expanded="false">
		                    <h4 style="color: #7F7F7F; margin-right: 35px;">&#8942;</h4>
	                   	</button>
						<ul class="dropdown-menu">
						  <li style="margin-top: 5px;">
						  	<form action="<c:url value="/boardEditView" />" method="post">
						  		<input type="hidden" name="boNo" value="${free.boNo}">
						  		<button type="submit" class="dropdown_btn" style="text-align: center; width: 100%;">수정</button>
						  	</form>
						  </li>
						  <li>
						  	<form id="deleteForm" action="<c:url value="/boardDelDo" />">
						  		<input type="hidden" name="boNo" value="${free.boNo}">
						  		<button id="delete_submit" type="button" class="dropdown_btn" style="text-align: center; width: 100%;">삭제</button>
						  	</form>
						  </li>
						</ul>
					</c:if>
                </div>
				<table style="width: 100%; margin-top: 20px; margin-bottom: 50px;">
                    <tr>
                        <th>제목</th>
                        <td><input name="boTitle" class="form-control input-sm" type="text" required="required" value="${free.boTitle}" readonly></td>
                    </tr>
                    <tr>
                        <th>제목</th>
                        <td><input name="boTitle" class="form-control input-sm" type="text" required="required" value="${free.boWriter}" readonly></td>
                    </tr>
                    <tr>
                        <th>분류</th>
               			<td><input class="form-control input-sm" type="text" name="boCategory" value="${free.boCategory}" readonly></td>
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td class="boContent">${free.boContent}</td>
                    </tr>
				</table>
	                <div class="d-flex justify-content-end" style="border-top: 1px solid #3D3D3D; margin-top: 40px; margin-bottom: 30px; padding-top: 20px;">
	                </div>
				<!-- 댓글 등록 input -->
				<div>
					<div class="row justify-content-end" style="margin-left: 40px;">
						<div class="col-11">
							<input class="reply_input" placeholder="댓글을 작성하세요" style="width: 100%; height: 37.6px; padding-left: 10px; padding-right: 10px;">
						</div>
						<div class="col-1" style="padding: 0; margin: 0;">
							<input type="hidden" name="boNo" value="${free.boNo}">
							<button type="button" class="btn btn-primary" onclick="fn_write()">등록</button>
						</div>
					</div>
				</div>
				<!-- 댓글 조회 -->
				<div style="padding-top: 15px;">
					<table class="table">
						<tbody id="replyBody">
							<c:forEach items="${reList}" var="re">
								<tr id="${re.replyNo }">
									<td>
										<div class=" py-4" style="padding: 10px;">
											<div class="d-flex justify-content-between">
												<div>
													<div class="d-flex">
									                	<c:if test="${re.profileImg == null}">
										                    <img src="${pageContext.request.contextPath}/assets/img/게시판_프로필.png">
									                	</c:if>
									                	<c:if test="${re.profileImg != null}">
										                    <img src="${pageContext.request.contextPath}${re.profileImg}" id="profileImage">
									                	</c:if>
														<div class="flex-column justify-content-center" style="margin-left: 15px;">
															<div>
																<span style="font-size: 18px;">${re.memNickname}</span>
															</div>
															<div>
																<span style="color: #7F7F7F;">${re.replyDate}</span>
															</div>
														</div>
													</div>
													<div style="margin-left: 66px; margin-top: 15px;">
														<span style="font-size: 18px;">${re.replyContent}</span>
													</div>
												</div>
												<c:if test="${sessionScope.login.memId == re.memId}">
													<button type="button" id="del_btn" onclick="fn_del(${re.replyNo})">×</button>
												</c:if>
											</div>
										</div>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
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
		
        $("#delete_submit").on("click", function() {
            // 알림창 표시
            if (confirm("삭제하시겠습니까?")) {
                // 확인을 누르면 폼 제출
                $("#deleteForm").submit();
            }
        });
	});
	
	function fn_write() {
		let memId = '${sessionScope.login.memId}';
		let boNo = '${free.boNo}';
		let msg = $(".reply_input").val();
		$(".reply_input").val("");
		
		if (memId == '') {
			alert("로그인이 필요한 서비스 입니다.");
			return;
		}
		if (msg == '') {
			alert("내용을 입력해 주세요");
			return;
		}
		
		let sendData = JSON.stringify({ "memId":memId
									  , "boNo":boNo
									  , "replyContent":msg});
		console.log(sendData);
		$.ajax({
			  url : '<c:url value="/writeReplyDo" />'
			, type : "POST"
			, contentType : 'application/json'
			, dataType : 'json'
			, data : sendData
			, success : function(res) {
				console.log("응답");
				console.log("res: ",res);
				let imgPath;
				
				if (res.profileImg == null) {
					imgPath = '/assets/img/게시판_프로필.png';
				} else {
					imgPath = res.profileImg;
				}
				
				let str = "";
				str += "<tr id='"+ res.replyNo +"'>";
				str += "<td>";
				
				str += "<div class=' py-4' style='padding: 10px;'>";
				str += "<div class='d-flex justify-content-between'>";
				str += "<div>";
				str += "<div class='d-flex'>";
				str += "<img src='${pageContext.request.contextPath}"+ imgPath +"' id='profileImage'>";
				str += "<div class='flex-column justify-content-center' style='margin-left: 15px;'>";
				str += "<div>";
				str += "<span style='font-size: 18px;'>"+res.memNickname+"</span>";
				str += "</div>";
				str += "<div>";
				str += "<span style='color: #7F7F7F;'>"+res.replyDate+"</span>";
				str += "</div>";
				str += "</div>";
				str += "</div>";
				str += "<div style='margin-left: 66px; margin-top: 15px;'>";
				str += "<span style='font-size: 18px;'>"+res.replyContent+"</span>";
				str += "</div>";
				str += "</div>";
				str += "<button type='button' id='del_btn' onclick='fn_del("+ res.replyNo +")'>×</button>";
				str += "</div>";
				str += "</div>";
				str += "</td>";
				str += "</tr>";
				
				console.log(str);
				$("#replyBody").append(str);
			}, error : function(e) {
				console.log(e);
			}
		});
	}
	
	function fn_del(p_replyNo) {
		if (confirm("삭제하시겠습니까?")) {
			$.ajax({
				  url: '<c:url value="/delReplyDo" />'
				, type: 'POST'
				, data: JSON.stringify({"replyNo": p_replyNo})
				, contentType: 'application/json'
				, dataType: "text"
				, success: function(res) {
					if (res == 'success') {
						$("#" + p_replyNo).remove();
					}
				}, error: function(e) {
					console.log(e);
				}
			})
		}
	}
</script>
</html>
