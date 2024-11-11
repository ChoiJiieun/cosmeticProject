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
                    <h5 style="font-weight: bold; margin-bottom: 20px; padding-left: 20px;">게시글 작성</h5>
                </div>
                <form action="/boardWriteDo" method="post" onsubmit="return fn_check()">
					<table style="width: 100%; margin-top: 20px; margin-bottom: 50px;">
	                    <tr>
	                        <th>제목</th>
	                        <td><input name="boTitle" class="form-control input-sm" type="text"  required="required"></td>
	                    </tr>
	                    <tr>
	                        <th>분류</th>
	                   		<td>
	                    		<select name="boCategory" class="form-control input-sm">
	                    			<option value="">---선택---</option>
	                    			<c:forEach items="${comm}" var="code">
	                    				<option value="${code.cdId}">${code.cdName}</option>	
	                    			</c:forEach>
	                    		</select>
	                    	</td>
	                    </tr>
	                    <tr>
	                        <th>내용</th>
	                        <td><textarea name="boContent" id="bo_content"  class="form-control input-sm"></textarea></td>
	                    </tr>
					</table>
	                <div class="d-flex justify-content-end" style="border-top: 1px solid #3D3D3D; margin-top: 40px; margin-bottom: 30px; padding-top: 20px;">
	                	<input type="hidden" name="boWriter" value="${sessionScope.login.memId}">
	                    <button type="submit" class="btn btn-primary">&nbsp;&nbsp;&nbsp;완료&nbsp;&nbsp;&nbsp;</button>
	                </div>
                </form>
			</div>
        </main>
    </div>
</body>
<script>
	var oEditors = [];
	
	$(document).ready(function () {
		
		$("#rev").css("display", "none");

        $("#btn-home").addClass('btn_active');
        $("#home_a_tag").addClass('a_tag_click');
        
        $("#rank_a_tag").addClass('a_tag');
        $("#notice_a_tag").addClass('a_tag');

        $("#categori").click(function () {
            $('#categori_zone').toggle();
            $("main").toggle();
        });
        
		nhn.husky.EZCreator.createInIFrame({
			oAppRef: oEditors,
			elPlaceHolder: "bo_content",    // 적용시킬 textarea id
			sSkinURI: "<c:url value='/resources/smarteditor2-2.8.2.3/SmartEditor2Skin.html' />",	
			htParams : {
				bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				bSkipXssFilter : true,		// client-side xss filter 무시 여부 (true:사용하지 않음 / 그외:사용)
				//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
				fOnBeforeUnload : function(){
					//alert("완료!");
				}
			}, //boolean
			fOnAppLoad : function(){
				//예제 코드
				//oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
			},
			fCreator: "createSEditor2"
		});
        
    });
	
	function fn_check() {
		//textarea 값 
		oEditors.getById['bo_content'].exec("UPDATE_CONTENTS_FIELD", []);
		var content = document.getElementById("bo_content").value;
		if(content =='' || content ==null 
				        || content =="&nbsp;" || content=='<p>&nbsp;</p>'){
			alert("내용을 입력해주세요");
			return false;
		}else{
			if(confirm("저장하시겠습니까?")){
				return true;
			}else{
				return false;
			}
		}
	}
</script>
</html>