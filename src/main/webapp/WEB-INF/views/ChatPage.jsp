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
		.msgSty{
			border-radius: 10px;
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
                        <h1 class="h3 mb-0 text-gray-800" >채팅 - ChatPage.jsp</h1>
                    </div>
                    <h3>로그인 아이디 : ${sessionScope.loginId}</h3>
                    <!-- Content Row -->

                    <!-- Content Row -->
					<div class="row"  >
						<div class="col-xl-8 col-lg-8" > 
                            <div class="card mb-2">
                                <div class="card-header py-3 text-center bg-primary" >
                                    <h6 class="m-0 font-weight-bold h5 text-white">메세지 테스트!</h6>
                                </div>
                                <div class="card-body listArea text-gray-900" id="chatList" >
                                
 									<div class="my-2 p-2 font-weight-bold text-left ">
 										<p class="">보낸 사람</p>
 										<span class="bg-primary msgSty p-2 text-lg text-white">내가 받은 메세지</span>
 									</div>                               

									<div class="my-2 p-2 font-weight-bold text-right">
										<span class="bg-warning msgSty p-2 text-lg">내가 입력한 메세지</span>
									</div>

                                </div>
                            </div>
						</div>
						
						<div class="col-xl-4 col-lg-4">
							
							<div class="row">
								<div class="col-12">
		                            <div class="card mb-2">
		                                <div class="card-header py-3 text-center bg-danger" >
		                                    <h6 class="m-0 font-weight-bold h5 text-white">메시지 입력
		                                    </h6>
		                                </div>
		                                <div class="card-body text-gray-900"  >
		                                <div class="font-weight-bold text-lg listTitle">
		                                	<input class="form-control" id="inputMsg" type="text" placeholder="메세지 입력">
		                                </div>
		                                <div class="mt-2 font-weight-bold text-lg listTitle">
		                                	<input class="form-control btn-danger" type="button" onclick="messageSendTest()" value="전송">
		                                </div>                                
		                                </div>
		                            </div>								
								</div>
								<div class="col-12">
		                            <div class="card mb-2">
		                                <div class="card-header py-3 text-center bg-info" >
		                                    <h6 class="m-0 font-weight-bold h5 text-white">접속중</h6>
		                                </div>
		                                <div class="card-body text-gray-900 row" id="connectUserList" >
																															
		                                </div>
		                            </div>								
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
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.6.1/sockjs.js" integrity="sha512-aHuAnb+FZ/yM5zYvdiA8q0sxLdsBQ3PRwO8D/08qsenCLQ2gWsosB43Cn1X8esAz0IpaC7Ns5cAPyKIdJQ0hNw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script type="text/javascript">
	var messageTestUrl = "${pageContext.request.contextPath }/messageWebSocketTest";
	var webSocket = new SockJS(messageTestUrl);
	console.log(webSocket);
	webSocket.onopen = function(){
		console.log("onopen");
		
	}
	webSocket.onmessage = function(evt){
		console.log("onmessage evt.data : " + evt.data);
		var msgdata = JSON.parse(evt.data);
		console.log(msgdata.msgComment);
		if(msgdata.msgComment == 'connect'){
			var conUserList = msgdata.msgUserId.split("++");
			console.log("conUserList : " + conUserList);
			console.log("conUserList.length : " + conUserList.length);
			for(var i = 0 ; i < conUserList.length; i++){
				console.log(conUserList[i].length);
				if(conUserList[i].length > 0){
					var connectOutput = "<div class=\"col-4\" id=\""+conUserList[i]+"\" >";
					connectOutput += "<div class=\"mt-2 font-weight-bold text-lg \">"+conUserList[i]+"</div>"+"</div>";
					$("#connectUserList").append(connectOutput);
				}
			}
			
			
		} else if(msgdata.msgComment == 'disConnect'){
			$("#"+msgdata.msgUserId).remove();
		} 
/*
 		<div class="my-2 p-2 font-weight-bold text-left ">
 			<p class="">보낸 사람</p>
 			<span class="bg-primary msgSty p-2 text-lg text-white">내가 받은 메세지</span>
 		</div>                               
*/
		else {
			var receiveMsg = "<div class=\"my-2 p-2 font-weight-bold text-left\">";
			receiveMsg += "<p>"+msgdata.msgUserId+"</p>";
			receiveMsg += "<span class=\"bg-primary msgSty p-2 text-lg text-white\">"+msgdata.msgComment+"</span>";
			receiveMsg += "</div>";
			$("#chatList").append(receiveMsg);
			$("#chatList").scrollTop( $("#chatList")[0].scrollHeight );
		}
		
	} 
	webSocket.onclose = function(evt){
		console.log("onclose evt.data : " + evt.data);
	} 
	</script>
	<script type="text/javascript">
		function messageSendTest(){
			var testMsg = $("#inputMsg").val();
			var userId = '${sessionScope.loginId}';
			if( testMsg.trim().length > 0 ){

				var msgData = {
						msgUserId : userId,
						msgComment : testMsg
				};
				webSocket.send(JSON.stringify(msgData));
/*
				<div class="my-2 p-2 font-weight-bold text-right">
					<span class="bg-warning msgSty p-2 text-lg">내가 입력한 메세지</span>
				</div>
*/
				var sendMsg = "<div class=\"my-2 p-2 font-weight-bold text-right\" >";
				sendMsg += "<span class=\"bg-warning msgSty p-2 text-lg\">"+testMsg+"</span>";
				sendMsg += "</div>";
				$("#chatList").append(sendMsg);
				$("#chatList").scrollTop( $("#chatList")[0].scrollHeight );
			}
			$("#inputMsg").val("");
		}
	
	</script>


</body>

</html>