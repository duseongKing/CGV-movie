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

    <title>${mvInfo.mvname } 상세 정보</title>

	<%@ include file="/WEB-INF/views/includes/commonCss.jsp" %>
	<script src="https://kit.fontawesome.com/3955dc82b3.js" crossorigin="anonymous"></script>	
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
                        <h1 class="h3 mb-0 text-gray-800">영화 상세정보 페이지 - member/MovieView.jsp</h1>
                    </div>
                    <!-- Content Row -->
                    <div class="row mx-auto" >
                        <div class="col-xl-3 col-lg-3">
                            <div class="card shadow mb-4">
                                <!-- Card Body -->
                                <div class="card-body">
								<img class="img-fluid" alt="${mvInfo.mvname }" src="${mvInfo.mvposter }">
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-9 col-lg-9">
                            <div class="card shadow mb-4">
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-gray-900">${mvInfo.mvname }</h6>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body text-gray-900 ">
             						<div class="font-weight-bold p-2">
										예매율 ${mvInfo.reservationRatio }% | <i class="text-lg fa-regular fa-thumbs-up text-primary"></i> ${mvInfo.goodRecommend } 
										           | <i class="text-lg fa-regular fa-thumbs-down text-danger"></i> ${mvInfo.badRecommend }
									</div>
             						<div class="font-weight-bold p-2">
										감독 : ${mvInfo.mvpd }
									</div>
             						<div class="font-weight-bold p-2">
										배우 : ${mvInfo.mvactor }
									</div>									
             						<div class="font-weight-bold p-2">
										장르 : ${mvInfo.mvgenre } | 기본 : ${mvInfo.mvage }, ${mvInfo.mvtime }
									</div>																														
									<div class="font-weight-bold p-2">
										${mvInfo.mvopen } 개봉
									</div>  
									<div class="font-weight-bold p-2">
										<a class=" btn-sm btn-danger" href="#">예매하기</a>
									</div>									
                                </div>
                            </div>
                        </div>
                    </div>
					
					<!-- 관람평 목록 시작 -->
                    <!-- Content Row -->
                    <div class="row">
						<div class="col-12">
							<div class="card mb-2">
                                <div class="card-header py-3 text-center bg-primary">
                                    <h6 class="m-0 font-weight-bold h5 text-white">관람평</h6>
                                </div>
                            </div>							
						</div>
						
						<c:forEach items="${reviewList }" var="review" >
                        <div class="col-xl-4 col-md-6 mb-4 align-items-center">
                            <div class="card border-left-primary shadow h-100 py-2">
                                <div class="card-body">
                                    <div class="row no-gutters align-items-center">
                                        <div class="col-auto mr-3">
                                            <img style="width: 80px;" class="img-fluid rounded-circle img-profile" src="${pageContext.request.contextPath }/resources/mprofileUpLoad/${review.mprofile }"> 
                                        </div>                                    
                                        <div class="col mr-1">
                                            <div class="font-weight-bold text-primary text-uppercase mb-1">
                                                ${review.rvmid }</div>
                                            <div class="font-weight-bold text-gray-800" style="height: 100px;" >${review.rvcomment }</div>
                                            
                                            <div class="text-xs text-uppercase mb-1 font-weight-bold text-gray-800">${review.rvdate }</div>
                                            
                                        </div>
                                        <div class="col-auto">
                                        	<c:choose>
                                        		<c:when test="${review.rvrecommend == 1 }">
                                        			<i class="fa-regular fa-thumbs-up fa-2x text-primary"></i>
                                        		</c:when>
                                        		<c:otherwise>
                                           			<i class="fa-regular fa-thumbs-down fa-2x text-danger"></i>
                                        		</c:otherwise>
                                        	</c:choose>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                    </div>
                    <!-- 관람평 목록 끝 -->
                    
                    				

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