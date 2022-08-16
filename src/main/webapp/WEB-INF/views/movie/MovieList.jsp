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

    <title>영화목록</title>

	<%@ include file="/WEB-INF/views/includes/commonCss.jsp" %>
	
	<style type="text/css">
		.mvTitle{
			overflow: hidden;
			text-overflow: ellipsis;
			white-space: nowrap;
			max-width: 100%;
		}
		.mvTitle a:hover{
			text-decoration: none;
		}
	</style>
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
                        <h1 class="h3 mb-0 text-gray-800">영화목록페이지 - movie/MovieList.jsp</h1>
                    </div>
                    <!-- Content Row -->
<!-- 
					<div class="row">
						<div class="col-xl-10 col-lg-8 mr-auto ml-auto">
					 -->	
							<div class="row">
								<c:forEach items="${mvList }" var="movie">
									<!-- Earnings (Monthly) Card Example -->
									<div class="col-xl-3 col-md-6 col-sm-6 mb-4">
										<div class="card shadow h-100 ">
											<div class="card-header">
												<a href="${pageContext.request.contextPath}/movieView?mvcode=${movie.mvcode }">
												<img class="img-fluid" alt="${movie.mvname }" src="${movie.mvposter }">
												</a>
											</div>
											<div class="card-body pb-0">
												<div class="row no-gutters align-items-center">
													<div class="col mr-1">
														<div class="h4 mb-0 font-weight-bold text-gray-800 mvTitle">
															<a href="movieView?mvcode=${movie.mvcode }">${movie.mvname }</a>
														</div>
													</div>
												</div>
											</div>
											<div class="card-footer mb-1" style="background-color: white; border-top:0px;" >
												<div class="text-lg font-weight-bold text-gray-900">
													예매율 20% | <i class="fa-regular fa-thumbs-up text-primary"></i> ${movie.goodRecommend }
													| <i class="fa-regular fa-thumbs-down text-danger"></i> ${movie.badRecommend } 
												</div>												
												<div class="text-lg font-weight-bold text-gray-900 mb-1 ">
													${movie.mvopen } 개봉
												</div>
												<a class=" btn-sm btn-danger" href="movieReservationPage?mvcode=${movie.mvcode }">예매하기</a>
											</div>

										</div>
									</div>
								</c:forEach>
							</div>
							<!-- 
						</div>
					</div> -->
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

</body>

</html>