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

    <title>관리자 회원 목록</title>

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
                        <h1 class="h3 mb-0 text-gray-800">관리자 회원관리 - AdminMemberList.jsp</h1>
                    </div>
                    <!-- Content Row -->
                    <!-- DataTables Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">회원목록</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th style="min-width: 80px;">아이디</th>
                                            <th style="min-width: 80px;">이름</th>
                                            <th style="width: 40%; min-width: 80px;">이메일</th>
                                            <th style="max-width: 180px;min-width: 180px;">관리</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th >아이디</th>
                                            <th >이름</th>
                                            <th >이메일</th>
                                            <th >관리</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    <c:forEach items="${memberList }" var="member" >
                                        <tr class="font-weight-bold">
                                        	<td class="align-middle">
                                        		${member.mid }
                                        	</td>
                                            <td class="align-middle font-weight-bold" >
                                            	${member.mname }
                                            </td>
                                            <td class="align-middle">${member.memail }</td>
                                            <td class="align-middle text-center">
                                				<button class="btn btn-success font-weight-bold" onclick="adminMemberViewShow('${member.mid }')">
                                    					상세정보
                                				</button>                                            	
                                            	<c:choose>
                                            		<c:when test="${member.mstate == '0' }">
                                            			<button  class="btn btn-danger font-weight-bold" onclick="modifyMemberState(this,'${member.mid }')">중지됨</button>
                                            			
                                            		</c:when>
                                            		<c:otherwise>
                                            			<button class="btn btn-primary font-weight-bold" onclick="modifyMemberState(this,'${member.mid }')">사용중</button>
                                            		</c:otherwise>
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
    <div class="modal fade" id="adminMemberViewModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document" style="max-width: 800px;" >
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title text-gray-900 text-primary font-weight-bold" id="exampleModalLabel">회원 상세 정보</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
						<div class="row">
                            <div class="col-xl-4">
                                <!-- Profile picture card-->
                                <div class="card mb-4 mb-xl-0">
                                    <div class="card-header text-primary font-weight-bold">프로필 이미지</div>
                                    <div class="card-body text-center">
                                        <!-- Profile picture image-->
                                        <img style="max-height: 200px;" class="img-account-profile img-fluid rounded-circle mb-2" id="mprofile" src="" alt="">
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
                                            <!-- Form Row-->
                                            <div class="row gx-3 mb-3">
                                                <!-- Form Group (아이디)-->
                                                <div class="col-md-6">
                                                    <label class="small mb-1" for="mid">아이디</label>
                                                    <input class="form-control" id="mid" name="mid" type="text"  readonly="readonly" value="">
                                                </div>
                                                <!-- Form Group (비밀번호)-->
                                                <div class="col-md-6">
                                                    <label class="small mb-1" for="mpw">비밀번호</label> 
                                                    <input class="form-control" id="mpw" name="mpw" type="text" readonly="readonly" value="">
                                                </div>
                                            </div>
                                            <!-- Form Row        -->
                                            <div class="row gx-3 mb-3">
                                                <!-- Form Group (이름)-->
                                                <div class="col-md-6">
                                                    <label class="small mb-1" for="mname">이름</label>
                                                    <input class="form-control" id="mname" name="mname" type="text" readonly="readonly" value="">
                                                </div>
                                                <!-- Form Group (생년월일)-->
                                                <div class="col-md-6">
                                                    <label class="small mb-1" for="mbirth">생년월일</label>
                                                    <input class="form-control" id="mbirth" name="mbirth" type="date" readonly="readonly" value="">
                                                </div>
                                            </div>
                                            <!-- Form Group (이메일)-->
                                            <div class="mb-3">
                                                <label class="small mb-1" for="memail">이메일</label>
                                                <input class="form-control" id="memail" name="memail" type="email" readonly="readonly"  value="">
                                            </div>
                                            <div class="mb-3">
                                                <label class="small mb-1" for="maddress">주소</label>
                                                <input class="form-control" id="maddress" name="maddress" type="text" readonly="readonly"  value="">
                                            </div>                                            
                                    </div>
                                </div>
                            </div>
                        </div>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-primary" type="button" data-dismiss="modal">닫기</button>
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
		function modifyMemberState(btnObj, mid){
			console.log("아이디 : " + mid);
			console.log($(btnObj).text());
			if($(btnObj).hasClass("btn-primary")){
				var mstate = '0';
			} else if($(btnObj).hasClass("btn-danger")){
				
				//회원 아이디 : mid >> number 타입 변환 O ::카카오 회원 mstate=2
				//회원 아이디 : mid >> number 타입 변환 x ::일반 회원  mstate=1
				var mstate = '1';
			}
			
			$.ajax({
				type : "get",
				url : "adminModifyMemberState",
				data : { "mid" : mid, "mstate" : mstate },
				success : function(result){
					console.log("result : " + result);
					if( result == '1' ){
						if( mstate == '0'){
							$(btnObj).text("중지됨")
						} else if( mstate == '1'){
							$(btnObj).text("사용중")
						}
						$(btnObj).toggleClass("btn-primary");
						$(btnObj).toggleClass("btn-danger");
					}
				}
			});
		}
		
		function adminMemberViewShow(mid){
			
			//ajax 회원 정보 조회
			$.ajax({
				url : "adminGetMemberInfo",
				type : "get",
				data : { "mid" : mid },
				dataType : "json",
				async:false,
				success: function(result){
					$("#mid").val(result.mid);
					$("#mpw").val(result.mpw);
					$("#mname").val(result.mname);
					$("#mbirth").val(result.mbirth);
					$("#memail").val(result.memail);
					$("#maddress").val(result.maddress);
					
					if( result.mstate == '2'){
						$("#mprofile").attr("src",result.mprofile);
					} else {
						$("#mprofile").attr("src","${pageContext.request.contextPath }/resources/mprofileUpLoad/"+result.mprofile);
					}
					
				}
			});
			$("#adminMemberViewModal").modal('show');
		}
	
	
		

		$("#adminThViewModal").on('hide.bs.modal', function(){
			/* alert("모달창 닫히기 전!"); */
		});		

		$("#adminThViewModal").on('hidden.bs.modal', function(){
			/* alert("모달창 닫힌 후!"); */
		});
		
		$("#adminThViewModal").on('show.bs.modal', function(){
			/* alert("모달창 열리기 전!"); */
		});		
		
		$("#adminThViewModal").on('shown.bs.modal', function(){
			/* alert("모달창 열린 후!"); */
		});
		

		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	</script>

</body>

</html>