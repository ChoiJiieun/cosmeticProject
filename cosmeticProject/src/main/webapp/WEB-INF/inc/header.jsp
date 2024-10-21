<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jQuery -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
    crossorigin="anonymous"></script>
<!-- font -->
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet" />
<!-- css -->
<link href="resources/css/header_style.css" rel="stylesheet" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/rank_style.css" />
<div id="header_div" style="position: relative;">
    <nav class="navbar border-bottom py-4">
        <div class="container-fluid justify-content-center" style="margin-left: 50px; margin-right: 60px;">
            <img src="resources/assets/img/로고.png" style="width: 187px; height: 51px">
            <form class="mx-auto" action="/search" method="GET">
                <input class="form-control rounded-pill" type="text" placeholder="검색어를 입력해주세요" aria-label="Search"
                    id="search-input" name="query" style="font-family: 'NanumSquare'; height: 58px; width: 580px;">
            </form>
            <div id="login-div" class="text-end" style="margin-right: 25px;">
                <a href="#">
                    <div class="login-box" style="display: inline;">
                        <img id="login_btn" src="resources/assets/img/login.png" alt="login" data-bs-toggle="modal" data-bs-target="#exampleModal" width="30" height="30" style="margin-right: 20px;">
                    </div>
                    <c:if test="${sessionScope.login == null }">
                    	<div class="login-tool" style="font-family: 'NanumSquare'; font-size: 14px;">로그인</div>
                    </c:if>
                    <c:if test="${sessionScope.login != null }">
                    	<div class="login-tool" style="font-family: 'NanumSquare'; font-size: 14px;">로그아웃</div>
                    </c:if>
                </a>
            </div>
            <div id="mypage-div" class="text-end" style="margin-right: 25px;">
                <a href="/mypage">
                    <div class="mypage-box" style="display: inline;">
                        <img id="mypage_btn" src="resources/assets/img/mypage.png" alt="mypage" width="30" height="30">
                    </div>
                    <div class="mypage-tool" style="font-family: 'NanumSquare'; font-size: 14px;">마이페이지</div>
                </a>
            </div>
        </div>
    </nav>
    
    <nav id="bottom_nav" class="navbar border-bottom">
        <div style="margin-left: 15%;">
            <ul class="nav col-12 col-md-auto justify-content-center mb-md-0">
                <li class="nav-item">
                    <button id="categori" class="nav-link px-4 link-secondary"
                        style="font-size: 20px; color: #000000 !important; border-left: 1px solid #D9D9D9 !important; border-right: 1px solid #D9D9D9 !important; font-family: 'NanumSquare';">
                        <!-- <img src="img/etc.png" width="23px" height="15px" style="margin-right: 5px; margin-bottom: 5px;"> -->
                        ☰&nbsp;&nbsp;&nbsp;&nbsp;카테고리
                    </button>
                </li>
                <li class="nav-item">
                    <a id="home_a_tag" href="/" class="a_tag">
                    	<button id="btn-home" class="nav-link link-secondary px-4"
                        	style="font-size: 20px; display: inline; font-family: 'NanumSquare';">홈</button></a>
                </li>
                <li class="nav-item">
                    <a id="rank_a_tag" href="/rank" class="a_tag">
                        <button id="btn-rank" class="nav-link px-4 link-secondary"
                        style="font-size: 20px;  display: inline; font-family: 'NanumSquare';">랭킹</button></a>
                    
                </li>
                <li class="nav-item">
                    <a id="notice_a_tag" href="/notice" class="a_tag">
                    	<button id="btn-notice" class="nav-link px-4 link-secondary"
                        style="font-size: 20px; display: inline; font-family: 'NanumSquare';">커뮤니티</button></a>                    
                </li>
            </ul>
        </div>
    </nav>
</div>


<!-- 로그인 모달 -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content" style="width: 80%; padding: 10px;">
            <div class="modal-header" style="border: none; display: block;">
                <div>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"
                        style="float: right;"></button>
                </div>
                <br>
                <div style="text-align: center;">
                    <img src="resources/assets/img/작은로고.png" style="width: 120px; height: 30px;">
                </div>
            </div>
            <div class="modal-body">
                <form action="/loginDo" method="post">
                    <div class="mb-3">
                        <input type="text" class="form-control" name="memId" id="input_email" value="${cookie.rememberId.value }" placeholder="이메일"
                            style="border-radius: 0; font-size: 16px; height: 40px;">
                        <input type="password" class="form-control" name="memPw" id="input_pw" placeholder="비밀번호"
                            style="border-radius: 0; font-size: 16px; height: 40px;">
                    </div>

                    <div style="margin-top: 12px; padding: 0; height: min-content; margin-bottom: 25px;">
                        <input ${cookie.rememberId.value == null ? "" : "checked"} id="login_save" name="remember" type="checkbox" style="accent-color: #3D3D3D;">
                        <label for="login_save" style="font-size: 14px;">아이디 저장하기</label>
                    </div>

                    <button id="login_btn" type="submit"
                        style="width: 100%; height: 38px; border: none; margin-bottom: 10px; background-color: #3D3D3D; color: white; font-size: 16px;">로그인</button>
                    <button type="button" id="register_btn" onClick="location.href='/register'"
                        style="width: 100%; height: 38px; border: none; background-color: #3D3D3D; color: white; font-size: 16px;">회원가입</button>
                </form>
                <hr style="border: 1px solid #cacaca; margin-top: 20px;">
                <div style="text-align: center;">
                    <img src="resources/assets/img/kakao.png" style="width: 45px;">
                    <label style="font-size: 14px;">카카오 로그인</label>
                </div>
            </div>
        </div>
    </div>
</div>

