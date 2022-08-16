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
	<link href="${pageContext.request.contextPath }/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
	<style type="text/css">
	
		.btn_dNone{
			display: none;
		}
	
	</style>
	
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
		<%@ include file="/WEB-INF/views/includes/AdminSideBar.jsp" %>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
				<%@ include file="/WEB-INF/views/includes/AdminTopBar.jsp" %>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">관리자 영화관리 - AdminMovieList.jsp</h1>
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
                                            <th>영화코드</th>
                                            <th style="width: 40%">영화이름</th>
                                            <th  >영화장르</th>
                                            <th>관람등급</th>
                                            <th>개봉일</th>
                                            <th style="width: 180px;"></th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>영화코드</th>
                                            <th>영화이름</th>
                                            <th>영화장르</th>
                                            <th>관람등급</th>
                                            <th>개봉일</th>
                                            <th ></th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    <c:forEach items="${mvList }" var="movie" >
                                        <tr class="font-weight-bold">
                                        	<td class="align-middle">
                                        		${movie.mvcode }
                                        	</td>
                                            <td class="align-middle font-weight-bold" >
                                            	${movie.mvname }
                                            </td>
                                            <td class="align-middle">${movie.mvgenre }</td>
                                            <td class="align-middle">${movie.mvage }</td>
                                            <td class="align-middle">${movie.mvopen }</td>
                                            <td class="align-middle text-center">
                                				<button class="btn btn-success font-weight-bold" onclick="adminMvViewShow('${movie}','${movie.mvcode }')">
                                    					상세정보
                                				</button>                                            	
                                            	<c:choose>
                                            		<c:when test="${movie.mvstate == '1' }">
                                            		<%-- 
                                            			<button onclick="modifyMvState1('${movie.mvcode }','0')" class="btn btn-primary font-weight-bold">사용중1</button>
                                            			 --%>
                                            			<button onclick="modifyMvState2(this,'${movie.mvcode }')" class="btn btn-primary font-weight-bold">사용중</button>
                                            			
                                            		</c:when>
                                            		<c:when test="${movie.mvstate == '0' }">
                                            			<%-- 
                                            			<button onclick="modifyMvState1('${movie.mvcode }','1')" class="btn btn-danger font-weight-bold">중지됨1</button>
                                            			 --%>
                                            			<button onclick="modifyMvState2(this,'${movie.mvcode }')" class="btn btn-danger font-weight-bold">중지됨</button>
                                            		
                                            		</c:when>                                           		
                                            	</c:choose>
                                            </td>
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

    <!-- adminMvViewModal Modal-->
    <div class="modal fade" id="adminMvViewModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document" style="max-width: 800px;" >
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title text-gray-900 text-primary font-weight-bold" id="exampleModalLabel">영화 상세 정보</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                	<div class="row">
						<div class="col-4">
							<div class="text-gray-900">
								<img class="img-fluid" src="" id="mvposter" >
							</div>
						</div>                		
                	
						<div class="col-8">
							<div class="row">
								<div class="col-12">
									<div class="text-gray-900">
                                            <!-- Form Row-->
                                            <form action="adminModifyMovie" method="post" >
                                            <div class="row gx-3 mb-3">
                                                <!-- Form Group (영화코드)-->
                                                <div class="col-md-6 font-weight-bold">
                                                    <label class="small mb-1" for="mvcode">영화코드</label>
                                                    <input class="form-control" id="mvcode" name="mvcode" type="text"  readonly="readonly" value="">
                                                </div>
                                            </div>
                                            <!-- Form Group (영화제목)-->
                                            <div class="mb-3">
                                                <label class="small mb-1" for="mvname">영화제목</label>
                                                <input class="form-control" id="mvname" name="mvname" type="text" readonly="readonly"  value="">
                                            </div>
                                            <!-- Form Row        -->
                                            <div class="row gx-3 mb-3">
                                                <!-- Form Group (감독)-->
                                                <div class="col-md-6">
                                                    <label class="small mb-1" for="mvpd">감독</label>
                                                    <input class="form-control" id="mvpd" name="mvpd" type="text" readonly="readonly" >
                                                </div>
                                                <!-- Form Group (장르)-->
                                                <div class="col-md-6">
                                                    <label class="small mb-1" for="mvgenre">장르</label>
                                                    <input class="form-control" id="mvgenre" name="mvgenre" type="text" readonly="readonly"  >
                                                </div>
                                            </div>
                                            <!-- Form Group (배우)-->
                                            <div class="mb-3">
                                                <label class="small mb-1" for="mvactor">배우</label>
                                                <input class="form-control" id="mvactor" name="mvactor" type="text" readonly="readonly"  >
                                            </div>
                                            <div class="row gx-3 mb-3">
                                                <!-- Form Group (연령)-->
                                                <div class="col-md-6">
                                                    <label class="small mb-1" for="mvage">연령</label>
                                                    <input class="form-control" id="mvage" name="mvage" type="text" readonly="readonly" >
                                                </div>
                                                <!-- Form Group (시간)-->
                                                <div class="col-md-6">
                                                    <label class="small mb-1" for="mvtime">시간</label>
                                                    <input class="form-control" id="mvtime" name="mvtime" type="text" readonly="readonly"  >
                                                </div>
                                            </div>
                                            <!-- Form Group (개봉일)-->
                                            <div class="mb-3">
                                                <label class="small mb-1" for="mvopen">개봉일</label>
                                                <input class="form-control" id="mvopen" name="mvopen" type="date" readonly="readonly"  >
                                            </div>                                                                                                                                    
                                                                                        
                                            <!-- Save changes button-->
                                         				<!--
															.btn_dNone{
																display: none;
															}
                                          				-->
                                            
                                            <button class="btn btn-primary " type="button"  id="openBtn" onclick="modifyOpen()" >정보수정</button>
                                            <button class="btn btn-danger btn_dNone" id="submitBtn" type="submit" >수정하기</button>
                                            <button class="btn btn-secondary btn_dNone" id="closeBtn" type="button" onclick="modifyClose()" >취소</button>
											</form>
									</div>
								</div>

							</div>
						</div>
					</div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary" type="button" data-dismiss="modal">닫기</button>
                </div>
                </form>
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
    
    <!-- Page level plugins -->
    <script src="${pageContext.request.contextPath }/resources/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="${pageContext.request.contextPath }/resources/js/demo/datatables-demo.js"></script>    
    

	<script type="text/javascript">
		var checkMsg = '${msg}';
		console.log(checkMsg.length);
		if( checkMsg.length > 0 ){
			alert(checkMsg);
		}
	</script>
	
	<script type="text/javascript">
	
		function adminMvViewShow(mvInfo,mvcode){
			console.log("adminMvViewShow() 호출" );
			var row_mv = mvInfo.split('(')[1].split(')')[0].split(", mv");
			var mvData = {};
			for(var i = 0; i < row_mv.length; i++ ){
				var key = row_mv[i].split('=')[0];  // mvcode
				var val = row_mv[i].split('=')[1]; // MV001
				mvData[key] = val;
			}
			/* 
			$("#mvcode").val(mvData.mvcode);
			$("#mvname").val(mvData.name);
			$("#mvpd").val(mvData.pd);
			$("#mvactor").val(mvData.actor);
			$("#mvgenre").val(mvData.genre);
			$("#mvage").val(mvData.age);
			$("#mvtime").val(mvData.time);
			$("#mvopen").val(mvData.open);
			$("#mvposter").attr("src",mvData.poster);
			*/
			
			//2. ajax
			console.log("mvcode : " + mvcode);
			$.ajax({
				type : "get",
				url : "adminGetMvInfo",
				data : { "mvcode" : mvcode },
				dataType: "json",
				async:false,
				success : function(result){
					$("#mvcode").val(result.mvcode);
					$("#mvname").val(result.mvname);
					$("#mvpd").val(result.mvpd);
					$("#mvactor").val(result.mvactor);
					$("#mvgenre").val(result.mvgenre);
					$("#mvage").val(result.mvage);
					$("#mvtime").val(result.mvtime);
					$("#mvopen").val(result.mvopen);
					$("#mvposter").attr("src",result.mvposter);
				}
			});
			$("#adminMvViewModal").modal('show');
		}
		
		function modifyOpen(){
			console.log("modifyOpen() 호출")
			$("#mvpd").removeAttr("readonly");
			$("#mvactor").removeAttr("readonly");
			$("#mvgenre").removeAttr("readonly");
			$("#mvage").removeAttr("readonly");
			$("#mvtime").removeAttr("readonly");
			$("#mvopen").removeAttr("readonly");
			
			$("#openBtn").toggleClass("btn_dNone");
			$("#closeBtn").toggleClass("btn_dNone");
			$("#submitBtn").toggleClass("btn_dNone");
		}
		function modifyClose(){
			console.log("modifyClose() 호출")
			$("#mvpd").attr("readonly","readonly");
			$("#mvactor").attr("readonly","readonly");
			$("#mvgenre").attr("readonly","readonly");
			$("#mvage").attr("readonly","readonly");
			$("#mvtime").attr("readonly","readonly");
			$("#mvopen").attr("readonly","readonly");
			
			$("#openBtn").toggleClass("btn_dNone");
			$("#closeBtn").toggleClass("btn_dNone");
			$("#submitBtn").toggleClass("btn_dNone");
		}
		
		
		
	
	</script>
	
	
	
	<script type="text/javascript">
		function modifyMvState1(mvcode, mvstate){
			location.href="adminModifyMvState1?mvcode=" + mvcode+"&mvstate="+mvstate;
		}
		
		/*  
		<button onclick="modifyMvState2(this,'MV001')" class="btn btn-primary font-weight-bold">사용중</button>
		<button onclick="modifyMvState2(this,'MV001')" class="btn btn-danger font-weight-bold">중지됨</button>
		*/
	
		function modifyMvState2(btnObj, mvcode){
			console.log("영화코드 : " + mvcode);
			console.log($(btnObj).text());
			
			
			if($(btnObj).hasClass("btn-primary")){
				var mvstate = '0';
			} else if($(btnObj).hasClass("btn-danger")){
				var mvstate = '1';
			}
		 console.log(mvstate)
			
			$.ajax({
				type : "get",
				url : "adminModifyMvState2",
				data : { "mvcode" : mvcode, "mvstate" : mvstate },
				success : function(result){
					console.log("result : " + result);
					if( result == '1' ){
						if( mvstate == '0'){
							$(btnObj).text("중지됨")
						} else if( mvstate == '1'){
							$(btnObj).text("사용중")
						}
						$(btnObj).toggleClass("btn-primary");
						$(btnObj).toggleClass("btn-danger");
					}
					
				}
			});
		
		}
	
	
	</script>

</body>

</html>