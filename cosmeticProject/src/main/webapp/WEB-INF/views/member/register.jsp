<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>cosmetic</title>
<style>
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

        </div>
        <main>
            <div style="width: 50%; margin: 0 auto; padding-top: 30px;">
                <div class="d-flex">
                    <h5 style="font-weight: bold;">회원가입</h5>
                    <div class="justify-content-end" style="margin-left: 10px;">
                        <span style="font-size: 13px; color: #959595;">*은 필수 항목 입니다.</span>
                    </div>
                </div>
                <form action="/registDo" method="post" enctype="multipart/form-data">
	                <div class="text-center">
	                    <img src="resources/assets/img/user-profile.png" id="profileImage" class="mb-3" style="cursor: pointer;">
	                    <input type="file" id="imageUpload" name="uploadImage" style="display: none;" accept="image/*">
	                </div>
	                <div style="margin-bottom: 30px;">
	                    <label style="padding-left: 12px; font-weight: bold; margin-bottom: 10px;">아이디 *</label>
	                    <input type="text" class="form-control" id="input_id" name="memId" placeholder="cosmetic@example.com"
	                    style="border-radius: 0; font-size: 16px; height: 40px;">
	                    <div id="id_error" style="margin-top: 12px; display: none;">
	                        <span style="color: #ff5246; padding: 12px;">중복된 아이디 입니다.</span>
	                    </div>
	                    <div id="id_correct" style="margin-top: 12px; display: none;">
	                        <span style="color: #4693ff; padding: 12px;">사용 가능한 아이디 입니다.</span>
	                    </div>
	                </div>
	                <div style="margin-bottom: 30px;">
	                    <label style="padding-left: 12px; font-weight: bold; margin-bottom: 10px;">비밀번호 *</label>
	                    <input type="password" class="form-control" id="input_pw_reg" name="memPw" placeholder="비밀번호"
	                        style="border-radius: 0; font-size: 16px; height: 40px;">
	                    <input type="password" class="form-control" id="input_pw_check" placeholder="비밀번호 확인"
	                        style="border-radius: 0; font-size: 16px; height: 40px;">
						<div id="pw_error" style="margin-top: 12px; display: none;">
							<span style="color: #ff5246; padding: 12px;">비밀번호가 일치하지 않습니다.</span>
						</div>
						<div id="pw_correct" style="margin-top: 12px; display: none;">
							<span style="color: #4693ff; padding: 12px;">비밀번호가 일치합니다.</span>
						</div>
	                </div>
                    <div style="margin-bottom: 30px;">
	                    <label style="padding-left: 12px; font-weight: bold; margin-bottom: 10px;">이름 *</label>
	                    <input type="text" class="form-control" id="input_nm" name="memNm" placeholder="이름을 입력하세요"
	                        style="border-radius: 0; font-size: 16px; height: 40px;">
                	</div>
	                <div style="margin-bottom: 30px;">
	                    <label style="padding-left: 12px; font-weight: bold; margin-bottom: 10px;">닉네임</label>
	                    <input type="text" class="form-control" id="input_nick" name="memNickname" placeholder="닉네임을 입력하세요"
	                        style="border-radius: 0; font-size: 16px; height: 40px;">
	                    <div id="nick_error" style="margin-top: 12px; display: none;">
	                        <span style="color: #ff5246; padding: 12px;">중복된 닉네임 입니다.</span>
	                    </div>
						<div id="nick_correct" style="margin-top: 12px; display: none;">
							<span style="color: #4693ff; padding: 12px;">사용 가능한 닉네임 입니다.</span>
						</div>
	                </div>
	                <label style="padding-left: 12px; font-weight: bold; margin-bottom: 10px;">성별 *</label>
	                <div class="d-flex" style="margin-bottom: 30px; margin-left: 10px;">
	                    <div class="form-check" style="padding: 0;">
	                        <input id="gender_woman" type="radio" name="memGender" value="여자" style="accent-color: #3D3D3D;">
	                        <label for="gender_woman">여자</label>
	                    </div>
	                    <div class="form-check">
	                        <input id="gender_men" type="radio" name="memGender" value="남자" style="accent-color: #3D3D3D;">
	                        <label for="gender_men">남자</label>
	                    </div>
	                </div>
	                <div style="margin-left: 10px; margin-bottom: 50px;">
	                    <label class="d-block" style="font-weight: bold; margin-bottom: 10px;">생년월일 *</label>
	                    <input type="date" name="memBirth" style="height: 40px; padding-left: 10px; padding-right: 10px;">
	                </div>
	                <div style="margin-bottom: 50px;">
	                    <button type="submit" id="submitButton"
	                        style="width: 100%; height: 38px; border: none; background-color: #3D3D3D; color: white; font-size: 16px;">완료</button>
	                </div>
                </form>
            </div>
        </main>
    </div>
</body>
<script>
	$(document).ready(function() {
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
        
        $('#input_pw_reg, #input_pw_check').on('input', function() {
            var password = $('#input_pw_reg').val();
            var passwordCheck = $('#input_pw_check').val();

            if (password && passwordCheck) {
                if (password !== passwordCheck) {
                    $('#pw_error').show();  // 일치하지 않으면 메시지 표시
                    $('#pw_correct').hide();
                } else {
                    $('#pw_error').hide();  // 일치하면 메시지 숨김
                    $('#pw_correct').show();
                }
            } else {
                $('#pw_error').hide();  // 둘 중 하나라도 비어있으면 메시지 숨김
            }
        });
        
        $("#input_nick").blur(function() {
        	let memNickname = $("#input_nick").val();
        	
        	if (memNickname == "") {
        		$("#nick_error").css("display", "none");
        		$("#nick_correct").css("display", "none");
        		return;
        	}
        	
        	$.ajax({
        		  url : '/nicknameCheck'  // 요청 받을 주소
        		, type : 'post'
        		, data : {'memNickname' : memNickname}
        		, success : function(cnt) {
        			if (cnt == 0) {  // 사용 가능한 닉네임
                		$("#nick_error").css("display", "none");
                		$("#nick_correct").css("display", "block");
        			} else {
                		$("#nick_error").css("display", "block");
                		$("#nick_correct").css("display", "none");
        			}
        		}, error : function() {
        			alert("닉네임 확인 중 오류");
        		}
        	});
        });
        
        $("#input_id").blur(function() {
        	let memId = $("#input_id").val();
        	
        	if (memId == "") {
        		$("#id_error").css("display", "none");
        		$("#id_correct").css("display", "none");
        		return;
        	}
        	
        	$.ajax({
        		  url : '/idCheck'  // 요청 받을 주소
        		, type : 'post'
        		, data : {'memId' : memId}
        		, success : function(cnt) {
        			if (cnt == 0) {  // 사용 가능한 닉네임
                		$("#id_error").css("display", "none");
                		$("#id_correct").css("display", "block");
        			} else {
                		$("#id_error").css("display", "block");
                		$("#id_correct").css("display", "none");
        			}
        		}, error : function() {
        			alert("아이디 확인 중 오류");
        		}
        	});
        });
        
	});
</script>
</html>