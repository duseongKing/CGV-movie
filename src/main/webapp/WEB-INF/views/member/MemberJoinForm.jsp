<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html >
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Dashboard</title>

	<%@ include file="/WEB-INF/views/includes/commonCss.jsp" %>
	
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
		<%@ include file="/WEB-INF/views/includes/SideBar.jsp" %>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
				<%@ include file="/WEB-INF/views/includes/TopBar.jsp" %>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">회원가입페이지 - MemberJoinForm.jsp</h1>
                    </div>

                    <!-- Content Row - 회원가입 양식 시작 -->
                <div class="row">
                   <!--  <div class="col-lg-5 d-none d-lg-block bg-register-image"></div> -->
                    <div class="col-xl-7 col-lg-7 ml-auto mr-auto" style="background-color: white;"  >
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">회원가입!</h1>
                            </div>
                            <form class="user" action="memberJoin" method="post" enctype="multipart/form-data" onsubmit="return joinFormCheck();"  >
                            
                            	<div class="form-group">
                                   	<label for="inputMid" class="text-lg font-weight-bold">아이디</label>
                                    <input type="text" class="form-control form-control-user" id="inputMid"
                                       name="mid" placeholder="아이디 입력...">
                                    &nbsp;&nbsp;&nbsp;&nbsp;<span class="font-weight-bold"  id="idCheckMsg" ></span>
                                </div>
                                
                            	<div class="form-group">
                                   	<label for="inputMpw" class="text-lg font-weight-bold">비밀번호</label>
                                    <input type="text" class="form-control form-control-user" id="inputMpw"
                                       name="mpw" placeholder="비밀번호 입력...">
                                </div>
                                
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                    <label for="inputMname" class="text-lg font-weight-bold">이름</label>
                                        <input type="text" class="form-control form-control-user"
                                           name="mname" id="inputMname" placeholder="이름 입력...">
                                    </div>
                                    <div class="col-sm-6">
                                    <label for="inputMbirth" class="text-lg font-weight-bold">생년월일</label>
                                        <input type="date" class="form-control form-control-user"
                                          name="mbirth"  id="inputMbirth" >
                                    </div>
                                </div>
                                                                
                                <div class="form-group">
                                <label for="inputMemail" class="text-lg font-weight-bold">이메일</label>
                                    <input type="email" class="form-control form-control-user" id="inputMemail"
                                       name="memail" placeholder="이메일 입력..." >
                                </div>
                                
                                <div class="form-group row">
                                	<div class="col-12 mb-3 mb-sm-0">
                                		<label for="sample6_postcode" class="text-lg font-weight-bold">주소</label>
                                	</div>
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="text" class="form-control form-control-user"
                                          name="mpostcode" id="sample6_postcode" placeholder="우편번호...">
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="button" class="btn btn-primary btn-user btn-block"
                                          onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
                                    </div>
                                  
                                </div>
                                
                                <div class="form-group">
                                    <input type="text" class="form-control form-control-user" 
                                       name="maddr" id="sample6_address" placeholder="주소..." >
                                </div>
                                                                
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <input type="text" class="form-control form-control-user"
                                           name="mdetailAddr" id="sample6_detailAddress" placeholder="상세주소...">
                                    </div>
                                    <div class="col-sm-6">
                                        <input type="text" class="form-control form-control-user"
                                          name="mextraAddr" id="sample6_extraAddress"  placeholder="참고항목..." >
                                    </div>
                                </div> 
                                
                                <div class="form-group">
                                <label for="inputMfile" class="text-lg font-weight-bold">프로필이미지</label>
                                    <input type="file" style="height: 48px; padding-top: 10px;" class="form-control form-control-user" id="inputMfile"
                                       name="mfile" >
                                </div>                                
                                                                
                                <button type="submit" class="btn btn-primary btn-user btn-block">
                                    회원가입
                                </button>

                            </form>
                            <hr>
                            <div class="text-center">
                                <a class="small" href="forgot-password.html">Forgot Password?</a>
                            </div>
                            <div class="text-center">
                                <a class="small" href="login.html">Already have an account? Login!</a>
                            </div>
                        </div>
                    </div>
                </div>
				<!-- Content Row - 회원가입 양식 끝 -->


                    <!-- Content Row -->


                    <!-- Content Row -->


                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2022</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>


    <!-- Bootstrap core JavaScript-->
    <script src="${pageContext.request.contextPath }/resources/vendor/jquery/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="${pageContext.request.contextPath }/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="${pageContext.request.contextPath }/resources/js/sb-admin-2.min.js"></script>

	<!-- 다음 우편번호 서비스-->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="${pageContext.request.contextPath }/resources/MemberJs/daumPostCode.js"> </script>
	
	
	<script type="text/javascript">
		var inputIdCheck = false;
	
		$(document).ready(function (){
			<!-- 아이디 중복 확인 -->
			$("#inputMid").focusout(function(){
				var inputId = $("#inputMid").val();
				console.log("inputId : " +inputId);
				
				if( inputId.length == 0){
					$("#idCheckMsg").text("아이디를 입력 해주세요!").css("color","red");
					inputIdCheck = false;
				} else {
					$.ajax({
						type : "get",
						url : "memberIdCheck",
						data : { "inputId" : inputId },
						success : function(result){
							console.log("result : " + result);
							if( result == "OK" ){
								$("#idCheckMsg").text("사용가능한 아이디!").css("color","green");
								inputIdCheck = true;
							} else {
								$("#idCheckMsg").text("이미 사용중인 아이디!").css("color","red");
								inputIdCheck = false;
							}
						}
					});
				}
			});
		});
	</script>
	
	<script type="text/javascript">
		
		function joinFormCheck(){
			/* 아이디 입력 확인 */
			if( !inputIdCheck ){
				alert("아이디를 확인 해주세요!");
				$("#inputMid").focus();
				return false;
			}
			/* 비밀번호 입력 확인 */
			if( $("#inputMpw").val().length == 0 ){
				alert("비밀번호를 입력 해주세요!");
				$("#inputMpw").focus();
				return false;
			}
			/* 이름 입력 확인 */
			if( $("#inputMname").val().length == 0 ){
				alert("이름을 입력 해주세요!");
				$("#inputMname").focus();
				return false;
			}

		}
	
	</script>
	
	
</body>

</html>










