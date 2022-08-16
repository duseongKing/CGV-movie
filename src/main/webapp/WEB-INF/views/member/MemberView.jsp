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
                        <h1 class="h3 mb-0 text-gray-800">회원정보페이지 - MemberView.jsp</h1>
                    </div>
                    <!-- Content Row -->
						<div class="row">
                            <div class="col-xl-4">
                                <!-- Profile picture card-->
                                <div class="card mb-4 mb-xl-0">
                                    <div class="card-header text-primary font-weight-bold">프로필 이미지</div>
                                    <div class="card-body text-center">
                                        <!-- Profile picture image-->
                                        <img style="max-height: 200px;" class="img-account-profile rounded-circle mb-2" src="${pageContext.request.contextPath }/resources/mprofileUpLoad/${memberInfo.mprofile }" alt="">
                                        <!-- Profile picture help block-->
                                      <!--   
                                        <div class="small font-italic text-muted mb-4">JPG or PNG no larger than 5 MB</div>
                                        Profile picture upload button
                                        <button class="btn btn-primary" type="button">Upload new image</button>
                                         -->
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-8">
                                <!-- Account details card-->
                                <div class="card mb-4">
                                    <div class="card-header text-primary font-weight-bold">회원 정보</div>
                                    <div class="card-body">
                                        <form>
                                            <!-- Form Row-->
                                            <div class="row gx-3 mb-3">
                                                <!-- Form Group (아이디)-->
                                                <div class="col-md-6">
                                                    <label class="small mb-1" for="mid">아이디</label>
                                                    <input class="form-control" id="mid" name="mid" type="text"  readonly="readonly" value="${memberInfo.mid }">
                                                </div>
                                                <!-- Form Group (비밀번호)-->
                                                <div class="col-md-6">
                                                    <label class="small mb-1" for="mpw">비밀번호</label> 
                                                    <input class="form-control" id="mpw" name="mpw" type="password" readonly="readonly" value="${memberInfo.mpw }">
                                                </div>
                                            </div>
                                            <!-- Form Row        -->
                                            <div class="row gx-3 mb-3">
                                                <!-- Form Group (이름)-->
                                                <div class="col-md-6">
                                                    <label class="small mb-1" for="mname">이름</label>
                                                    <input class="form-control" id="mname" name="mname" type="text" readonly="readonly" value="${memberInfo.mname }">
                                                </div>
                                                <!-- Form Group (생년월일)-->
                                                <div class="col-md-6">
                                                    <label class="small mb-1" for="mbirth">생년월일</label>
                                                    <input class="form-control" id="mbirth" name="mbirth" type="date"  value="${memberInfo.mbirth }">
                                                </div>
                                            </div>
                                            <!-- Form Group (이메일)-->
                                            <div class="mb-3">
                                                <label class="small mb-1" for="memail">이메일</label>
                                                <input class="form-control" id="memail" name="memail" type="email" readonly="readonly"  value="${memberInfo.memail }">
                                            </div>
                                            <!-- Form Row-->
                                            <div class="row gx-3 mb-3">
                                                <!-- Form Group (우편번호)-->
                                                <div class="col-md-6">
                                                    <label class="small mb-1" for="mpostcode">우편번호</label>
                                                    <input class="form-control" id="mpostcode" name="mpostcode" type="text" readonly="readonly" value="${memberInfo.mpostcode }">
                                                </div>
                                                <!-- Form Group (우편번호 찾기)-->
                                                <div class="col-md-6 d-none">
                                                    <label class="small mb-1" for="inputBirthday">우편번호 찾기</label>
                                                    <input class="form-control" id="inputBirthday" type="button"  value="우편번호 찾기">
                                                </div>
                                            </div>
                                            
                                            <div class="mb-3">
                                                <label class="small mb-1" for="maddr">회원주소</label>
                                                <input class="form-control" id="maddr" name="maddr" type="text" readonly="readonly"  value="${memberInfo.maddr }">
                                            </div>
                                            
                                            <!-- Form Row-->
                                            <div class="row gx-3 mb-3">
                                                <!-- Form Group (우편번호)-->
                                                <div class="col-md-6">
                                                    <label class="small mb-1" for="mdetailAddr">상세주소</label>
                                                    <input class="form-control" id="mdetailAddr" name="mdetailAddr" type="text" readonly="readonly" value="${memberInfo.mdetailAddr }">
                                                </div>
                                                <!-- Form Group (birthday)-->
                                                <div class="col-md-6 ">
                                                    <label class="small mb-1" for="mextraAddr">참고주소</label>
                                                    <input class="form-control" id="mextraAddr" name="mextraAddr" type="text" readonly="readonly" value="${memberInfo.mextraAddr }">
                                                </div>
                                            </div>                                            
                                                                                        
                                            <!-- Save changes button-->
                                            <button class="btn btn-primary" type="button" >정보수정</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>

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

	

</body>

</html>