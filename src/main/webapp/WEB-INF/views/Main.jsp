<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>시작페이지</title>

<%@ include file="/WEB-INF/views/includes/commonCss.jsp"%>

</head>

<body>

	<div class="container">

		<div class="card o-hidden border-0 shadow-lg " style="margin-top: 200px;">
			<div class="card-body p-0">
				<!-- Nested Row within Card Body -->
				<div class="row">
						<div class="col-12" title="시작페이지">
							<div class="card mb-2">
                                <div class="card-header py-3 text-center ">
                                    <h6 class="m-0 font-weight-bold h5 ">시작페이지</h6>
                                </div>
                            </div>							
						</div>					
				
					<div class="col-xl-6 col-lg-6">
                        <div class="p-5">
                            <div class="text-center">
                            	<button  onclick="adminMain()" class="btn btn-danger p-5 text-lg font-weight-bold">관리자 페이지</button>
                            </div>
                        </div>					
					</div>
					<div class="col-xl-6 col-lg-6">
                        <div class="p-5">
                            <div class="text-center">
                            	<a href="movieMain" class="btn btn-primary p-5 text-lg font-weight-bold">일반 페이지</a>
                            </div>
                        </div>					
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Bootstrap core JavaScript-->
	<script
		src="${pageContext.request.contextPath }/resources/vendor/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<!-- Core plugin JavaScript-->
	<script
		src="${pageContext.request.contextPath }/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
	<!-- Custom scripts for all pages-->
	<script
		src="${pageContext.request.contextPath }/resources/js/sb-admin-2.min.js"></script>
	
	<script type="text/javascript">
		function adminMain(){
			/*
			var confirmVal = confirm("확인");
			console.log(confirmVal);
			*/
			var inputPw = prompt("비밀번호 입력");
			location.href = "adminMain?inputPw="+inputPw;
		}
	</script>
		<script type="text/javascript">
		var checkMsg = '${msg}';
		console.log(checkMsg.length);
		if( checkMsg.length > 0 ){
			alert(checkMsg);
		}
	</script>
	
	
	
	
</body>

</html>