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
            <div id="content" >

                <!-- Topbar -->
				<%@ include file="/WEB-INF/views/includes/TopBar.jsp" %>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">로그인페이지 - MemberLoginForm.jsp</h1>
                    </div>

                    <!-- Content Row - 로그인 양식 시작 -->
                <div class="row">
                   <!--  <div class="col-lg-5 d-none d-lg-block bg-register-image"></div> -->
                    <div class="card col-xl-8 col-lg-8 ml-auto mr-auto"   >
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">로그인!</h1>
                            </div>
                            <form class="user" action="memberLogin" method="post"  >
                            
                            	<div class="form-group">
                                   	<label for="inputMid" class="text-lg font-weight-bold">아이디</label>
                                    <input type="text" class="form-control form-control-user" id="inputMid"
                                       name="mid" placeholder="아이디 입력...">
                                </div>
                                
                            	<div class="form-group">
                                   	<label for="inputMpw" class="text-lg font-weight-bold">비밀번호</label>
                                    <input type="text" class="form-control form-control-user" id="inputMpw"
                                       name="mpw" placeholder="비밀번호 입력...">
                                </div>
                                <button type="submit" class="btn btn-primary btn-user btn-block font-weight-bold" style="font-size: 1.3rem;" >
                                    로그인
                                </button>
                            </form>
                            <hr>
                            <div class="text-center">
                                <a class="small" id="kakaoLoginBtn"></a>
                            </div>
                            <div class="text-center">
                                <a class="small" href="login.html">Already have an account? Login!</a>
                            </div>
                        </div>
                    </div>
                </div>
				<!-- Content Row - 로그인 양식 끝 -->


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
	
	<script type="text/javascript">
		var checkMsg = '${msg}';
		console.log(checkMsg.length);
		if( checkMsg.length > 0 ){
			alert(checkMsg);
		}
	</script>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script>
        // SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('3bf9f9666d310fa5980df2b48298b061');

        // SDK 초기화 여부를 판단합니다.
        console.log(Kakao.isInitialized());
    </script>
	
	<script type="text/javascript">
	Kakao.Auth.createLoginButton({
		  container: '#kakaoLoginBtn',
		  size: 'large',
		  success: function(response) {
		    console.log(response);
		    Kakao.API.request({
		    	  url: '/v2/user/me',
		    	  success: function(res) {
		    	    console.log(res);
		    	    console.log("res.id : " + res.id);
		    	    console.log("res.kakao_account.email : " + res.kakao_account.email);
		    	    console.log("res.kakao_account.profile.nickname : " + res.kakao_account.profile.nickname);
		    	    console.log("res.kakao_account.profile.profile_image_url : " + res.kakao_account.profile.profile_image_url);
		    	    memberKakaoLogin(res.id, res.kakao_account.email, res.kakao_account.profile.nickname, res.kakao_account.profile.profile_image_url);
		    	  },
		    	  fail: function(error) {
		    	    console.error(error)
		    	  }
		    	});
		  },
		  fail: function(error) {
		    console.log(error);
		  },
		});
	</script>
	<script type="text/javascript">
		function memberKakaoLogin(mid,memail,mname,mprofile){
			console.log(mid);
			console.log(memail);
			console.log(mname);
			console.log(mprofile);
			location.href = "memberKakaoLogin?mid="+mid+"&memail="+memail+"&mname="+mname+"&mprofile="+mprofile;
			
		}
	</script>
	
	
</body>

</html>










