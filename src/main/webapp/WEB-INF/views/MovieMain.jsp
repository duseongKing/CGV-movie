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
	
	<style type="text/css">
		.listArea{
			min-height: 300px;
			max-height: 500px;
			overflow: scroll;
		}		
		.receiveMsg{
		
		}
		.sendMsg{
		
		}
	</style>
	
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
                        <h1 class="h3 mb-0 text-gray-800">메인페이지 - MovieMain.jsp</h1>
                    </div>
                    <h3>로그인 아이디 : ${sessionScope.loginId}</h3>
                    <h3>로그인 프로필 : ${sessionScope.loginProfile}</h3>
                    <!-- Content Row -->

                    <!-- Content Row -->

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

	<!-- 예매정보 Modal -->
	<script type="text/javascript">
		console.log("${reserveInfo.recode}");
		if( "${reserveInfo.recode}".length > 0 ){
			$("#reserveMsg_mvposter").attr("src","${reserveInfo.mvposter}");
			$("#reserveMsg_recode").text("예매코드 : "+"${reserveInfo.recode}");
			$("#reserveMsg_mvname").text("영화 : "+"${reserveInfo.mvname}");
			$("#reserveMsg_thname").text("극장 : "+"${reserveInfo.thname}" + " ${reserveInfo.scroom}");
			$("#reserveMsg_scdate").text("일시 : "+"${reserveInfo.scdate}");
			$("#reserveMsg_reamount").text("인원 : "+"${reserveInfo.reamount}" +" 명");
			$("#reInfoModal").modal('show');
		}
	
	</script>
	


</body>

</html>