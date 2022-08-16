<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page import="java.util.Date" %>

<!DOCTYPE html>
<html >
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>예매내역</title>
	
	<%@ include file="/WEB-INF/views/includes/commonCss.jsp" %>
	<link href="${pageContext.request.contextPath }/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
	
	<style type="text/css">
		td{
			color: black;
			font-size:20px;
		}
		a{
			color: black;
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
                        <h1 class="h3 mb-0 text-gray-800">예매내역 확인 - ReservationList.jsp</h1>
                    </div>
                    <!-- Content Row -->
                    <!-- DataTables Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">예매내역</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                        	<th></th>
                                            <th>영화제목</th>
                                            <th>극장</th>
                                            <th>상영관</th>
                                            <th>일시</th>
                                            <th>예매인원</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                        	<th></th>
                                            <th>영화제목</th>
                                            <th>극장</th>
                                            <th>상영관</th>
                                            <th>일시</th>
                                            <th>예매인원</th>
                                            <th></th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    <c:set var="today" value="<%=new Date() %>" ></c:set>
                                    <c:forEach items="${reservList }" var="reInfo" >
                                        <tr class="text-center">
                                        	<td class="align-middle text-center">
                                        	<a class="text-decoration-none" href="movieView?mvcode=${reInfo.mvcode }"><img style="height: 70px;" src="${reInfo.mvposter }"></a>
                                        	</td>
                                            <td class="align-middle font-weight-bold" >
                                            	<a class="text-decoration-none" href="movieView?mvcode=${reInfo.mvcode }"> ${reInfo.mvname } </a>
                                            </td>
                                            <td class="align-middle font-weight-bold">${reInfo.thname }</td>
                                            <td class="align-middle font-weight-bold">${reInfo.scroom }</td>
                                            <td class="align-middle font-weight-bold">${reInfo.scdate }</td>
                                            <td class="align-middle font-weight-bold">${reInfo.reamount } 명</td>
                                            <th class="align-middle">
                                            	<fmt:parseDate value="${reInfo.scdate }" var="scdate_fm"  pattern="yyyy.MM.dd HH:mm" ></fmt:parseDate>
                                            
                                            	<c:choose>
                                            		<c:when test="${scdate_fm > today}">
                                            			<a href="reservationCancel?recode=${reInfo.recode }" class="btn btn-danger p-2 font-weight-bold">예매취소</a> 
                                            		</c:when>
                                            		<c:otherwise>
                                            		    <c:choose>
                                            		    	<c:when test="${reInfo.review == null}">
                                            					<button class="btn btn-primary p-2 font-weight-bold" onclick="reviewWriteForm('${reInfo}')">관람평작성</button>
                                            				</c:when>
                                            				<c:otherwise>
                                            					<button class="btn btn-secondary p-2 font-weight-bold" onclick="reviewView('${reInfo}', '${reInfo.review }')">관람평보기</button>
                                            					
                                            				</c:otherwise>
                                            			</c:choose>
                                            			
                                            		</c:otherwise>
                                            	</c:choose>
                                            </th>
                                        </tr>
                                    </c:forEach>    
                                    </tbody>
                                </table>
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
	
   <!-- 관람평 작성폼 Modal-->
    <div class="modal fade" id="reviewWriteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document" style="max-width: 800px;" >
            <div class="modal-content">
            	<form class="user" action="reviewWrite" method="post"  >
                <div class="modal-header">
                    <h5 class="modal-title text-gray-900 text-primary font-weight-bold" id="exampleModalLabel">관람평 작성</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                	<div class="row">
						<div class="col-4">
							<div class="text-gray-900">
								<img class="img-fluid" src="" id="review_mvposter" >
							</div>
						</div>                		
                	
						<div class="col-8">
							<div class="row">
								<div class="col-12">
									<div class="text-gray-900">
										<div class="p-2 font-weight-bold " id="review_recode" ></div>
										<div class="p-2 font-weight-bold " id="review_mvname" ></div>
										<div class="p-2 font-weight-bold " id="review_thname" ></div>
										<div class="p-2 font-weight-bold " id="review_scdate" ></div>
										<div class="p-2 font-weight-bold " id="review_reamount" ></div>
									</div>
								</div>
								<div class="col-12">
                        			<div class="p-1">
                            			<div class="form-group">
                            				<input type="radio" class="form-control-user" id="recommendGood" name="rvrecommend" value="1" checked="checked"> 
                                    		<label for="recommendGood" class="text-lg font-weight-bold text-gray-900"> <i class="fa-regular fa-thumbs-up"></i> 좋아요 </label>
                                    		&nbsp;
                                    		<input type="radio" class="form-control-user" id="recommendBad" name="rvrecommend" value="0">
                                     		<label for="recommendBad" class="text-lg font-weight-bold text-gray-900"> <i class="fa-regular fa-thumbs-down"></i> 별로에요 </label>   
                            				<textarea rows="4" name="rvcomment"  id="rvcomment" class="form-control text-gray-900 font-weight-bold"></textarea>
                            				<input type="hidden" name="rvrecode" id="rvrecode">
                            				<input type="hidden" name="rvmid" id="rvmid" value="${sessionScope.loginId }">
                            				<input type="hidden" name="rvmvcode" id="rvmvcode">
                                		</div>
                        			</div>
								</div>
							</div>
						</div>
					</div>
                </div>
                <div class="modal-footer">
                    <input type="submit" class="btn btn-primary"  value="작성하기">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                </div>
                </form>
            </div>
        </div>
    </div>     	
	
   <!-- 관람평 확인 Modal-->
    <div class="modal fade" id="reviewViewModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document" style="max-width: 800px;" >
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title text-gray-900 text-primary font-weight-bold" id="exampleModalLabel">관람평 보기</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                	<div class="row">
						<div class="col-4">
							<div class="text-gray-900">
								<img class="img-fluid" src="" id="reviewView_mvposter" >
							</div>
						</div>                		
                	
						<div class="col-8">
							<div class="row">
								<div class="col-12">
									<div class="text-gray-900">
										<div class="p-2 font-weight-bold " id="reviewView_recode" ></div>
										<div class="p-2 font-weight-bold " id="reviewView_mvname" ></div>
										<div class="p-2 font-weight-bold " id="reviewView_thname" ></div>
										<div class="p-2 font-weight-bold " id="reviewView_scdate" ></div>
										<div class="p-2 font-weight-bold " id="reviewView_reamount" ></div>
									</div>
								</div>
								<div class="col-12">
									<div class="p-2 font-weight-bold " id="reviewView_rvrecommend" ></div>
                            		<textarea rows="3" readonly="readonly" id="reviewView_rvcomment" class="form-control text-gray-900 font-weight-bold"></textarea>
								</div>
							</div>
						</div>
					</div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary" type="button" data-dismiss="modal">확인</button>
                </div>
            </div>
        </div>
    </div>     



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

    <!-- Page level plugins -->
    <script src="${pageContext.request.contextPath }/resources/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="${pageContext.request.contextPath }/resources/js/demo/datatables-demo.js"></script>
	
	<script type="text/javascript">
		
	function reviewWriteForm(reInfo){
		var row = reInfo.split('(')[1].split(')')[0].split(', ');
		var reserveData = {};
		for(var i = 0; i < row.length; i++ ){
			var key = row[i].split('=')[0];  // mvcode
			var val = row[i].split('=')[1]; // MV001
			reserveData[key] = val;
		}
		
		$("#review_mvposter").attr("src",reserveData.mvposter);
		$("#review_recode").text("예매코드 : "+reserveData.recode);
		$("#review_mvname").text("영화 : "+reserveData.mvname);
		$("#review_thname").text("극장 : "+reserveData.thname + " " + reserveData.scroom);
		$("#review_scdate").text("일시 : "+reserveData.scdate);
		$("#review_reamount").text("인원 : "+reserveData.reamount +" 명");
		
		$("#rvcomment").val("");
		$("#rvrecode").val(reserveData.recode);
		$("#rvmvcode").val(reserveData.mvcode);
		
		$("#reviewWriteModal").modal('show');
		
	}
	
	function reviewView(reInfo, reviewInfo ){
		console.log("reviewView() 호출" );
		console.log("예매정보 : " + reInfo);
		var row_re = reInfo.split('(')[1].split(')')[0].split(', ');
		var reserveData = {};
		for(var i = 0; i < row_re.length; i++ ){
			var key = row_re[i].split('=')[0];  // mvcode
			var val = row_re[i].split('=')[1]; // MV001
			reserveData[key] = val;
		}
		console.log(reserveData);
		
		console.log("관람평 정보 : "+reviewInfo);
		
		var row_rv = reviewInfo.split('(')[1].split(')')[0].split(', ');
		var reviewData = {};
		for(var i = 0; i < row_rv.length; i++ ){
			var key = row_rv[i].split('=')[0];  // 
			var val = row_rv[i].split('=')[1]; //
			reviewData[key] = val;
		}
		console.log(reviewData);
		$("#reviewView_mvposter").attr("src",reserveData.mvposter);
		$("#reviewView_recode").text("예매코드 : "+reserveData.recode);
		$("#reviewView_mvname").text("영화 : "+reserveData.mvname);
		$("#reviewView_thname").text("극장 : "+reserveData.thname + " " + reserveData.scroom);
		$("#reviewView_scdate").text("일시 : "+reserveData.scdate);
		$("#reviewView_reamount").text("인원 : "+reserveData.reamount +" 명");
		
		if( reviewData.rvrecommend == '1'){
			$("#reviewView_rvrecommend").html("<i class=\"fa-regular fa-thumbs-up\"></i> 좋아요")
		} else {
			$("#reviewView_rvrecommend").html("<i class=\"fa-regular fa-thumbs-down\"></i> 별로에요")
		}
		
		
		$("#reviewView_rvcomment").val( reviewData.rvcomment.replaceAll("<br>","\r\n") );
		
		$("#reviewViewModal").modal('show');
		
	}

	
	</script>
	
	
	
	
	
	
	
</body>

</html>