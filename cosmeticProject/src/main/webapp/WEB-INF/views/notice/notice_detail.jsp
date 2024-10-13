<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판</title>
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet">
    <style>
        * {
            font-family: 'NanumSquare';
        }

        .btn_active {
            background-color: #3D3D3D !important;
            color: white !important;
        }

        /* 이메일 입력 필드에 포커스가 있을 때 테두리 색상 변경 */
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
    <script>
        $(document).ready(function () {
            $('header').load('header.html', function () {
                $('<link>', {
                    rel: 'stylesheet',
                    type: 'text/css',
                    href: 'css/header_style.css'
                }).appendTo('head');

                $("#btn-rank").addClass('btn_active');

                $("#btn-notice").click(function () {
                    location.href = 'notice.html';
                });

                $("#btn-home").click(function () {
                    location.href = 'home.html';
                });

                $("#categori").click(function () {
                    $('#categori_zone').toggle();
                    $("main").toggle();
                });

                let left_position = $("#btn-home").position().left;
                // alert(left_position);

                $("#choose_div").css({"margin-right": left_position, "margin-left": left_position});

            });

            $('#categori_zone').load('categori_menu.html', function() {
                $('<link>', {
                    rel: 'stylesheet',
                    type: 'text/css',
                    href: 'css/categori_menu.css'
                }).appendTo('main');
            });
        });
    </script>
</head>

<body>
    <div class="container-fluid" style="padding: 0;">
        <header></header>
        <div id="categori_zone" style="height: 60vh; display: none;">

        </div>
        <div style="border-bottom: 1px solid #D9D9D9;">
            <div class="container d-flex justify-content-center" style="height: 47px;">
                <button id="categori" class="nav-link link-secondary"
                    style="width: 17%; font-size: 20px;">전체</button>
                <button id="btn-home" class="nav-link link-secondary"
                    style="width: 17%; font-size: 20px;">공지</button>
                <button id="btn-rank" class="nav-link link-secondary"
                    style="width: 17%; font-size: 20px;">자유</button>
                <button id="btn-notice" class="nav-link link-secondary"
                    style="width: 17%; font-size: 20px;">질문</button>
                <button id="btn-notice" class="nav-link link-secondary"
                    style="width: 17%; font-size: 20px;">꿀팁</button>
            </div>
        </div>

        <div>
            <div>
                <div style="width: 54%; margin: 0 auto;">
                    <table class="table table-hover" style="margin-top: 20px;">
                        <tr>
                            <td>
                                <div class="d-flex" style="margin-top: 20px;">
                                    <div>
                                        <div class="d-flex">
                                            <img src="./img/게시판_프로필.png" alt="">
                                            <div class="flex-column justify-content-center" style="margin-left: 15px;">
                                                <div>
                                                    <span style="font-size: 18px;">글쓴이</span>
                                                </div>
                                                <div>
                                                    <span style="color: #979797;">2024-09-03 16:11:32</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div style="padding: 20px;">
                                            <div style="margin-right: 10px;">
                                                <h5>ahc 아이크림 눈밑 + 팔자주름 없애기 표과본 홈케어템</h5>
                                                <span style="color: #5e5e5e;">안뇽하세요 잇님들 :&#41; 저희 엄마가 옛날부터 피부과에서 일하고 계셔서 어렸을 때부터 저까지 관리를 정말 열심히 해주셨거든요..? 근데 자취하고나서부터 서서히 상태가 안 좋아지기 시작하더니 나이 먹는 게 ㄹㅇ 티가 나는 거예요 다른 건 ...
                                                </span>
                                                <div class="d-flex" style="margin-top: 10px;">
                                                    <span>공감 42</span>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                    <span>댓글 15</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <img src="./cosmetic_img/notice_ex.png" style="width: 185px; height: 185px;">
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="d-flex" style="margin-top: 20px;">
                                    <div>
                                        <div class="d-flex">
                                            <img src="./img/게시판_프로필.png" alt="">
                                            <div class="flex-column justify-content-center" style="margin-left: 15px;">
                                                <div>
                                                    <span style="font-size: 18px;">스무깅</span>
                                                </div>
                                                <div>
                                                    <span style="color: #979797;">2024-09-02 12:41:18</span>
                                                </div>
                                            </div>
                                        </div>
                                        <div style="padding: 20px;">
                                            <div style="margin-right: 10px;">
                                                <h5>아이오페 선크림 사용감 좋은 자외선 차단제 추천!</h5>
                                                <span style="color: #5e5e5e;">잇님들!! 제가 이번에 자외선차단제 하나를 샀는데 넘 좋은 것 같아서 후기 남기려구요ㅋㅋ 자외선차단제 같은 건 사계절 내내 챙겨줘야하다 보니까 그만큼 사용감 좋은 게 최고인데 이거 진짜 사용감 제 스톼일.. 좋은 걸 저만 알고 있을 수는...
                                                </span>
                                                <div class="d-flex" style="margin-top: 10px;">
                                                    <span>공감 28</span>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                    <span>댓글 3</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <img src="./cosmetic_img/notice_ex2.png" style="width: 185px; height: 185px;">
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>

</html>