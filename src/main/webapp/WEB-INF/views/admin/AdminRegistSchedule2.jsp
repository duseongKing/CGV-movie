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

    <title>관리자_스케쥴 등록 페이지</title>

	<%@ include file="/WEB-INF/views/includes/commonCss.jsp" %>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
	<style type="text/css">
		.listArea{
			min-height: 300px;
			max-height: 300px;
			overflow: scroll;
		}	
		.listArea div:hover{
			cursor: pointer;
		}
		.listArea div{
			border-radius: 15px;
		}
		.ui-datepicker{
			width:100%;
		}	
		.scTimeBtn{
			color : black;
			border: 2px solid darkgrey;
		}		
		.listTitle{
			overflow: hidden;
			text-overflow: ellipsis;
			white-space: nowrap;
			max-width: 100%;		
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
                        <h1 class="h3 mb-0 text-gray-800">관리자 스케쥴 등록 - AdminRegistSchedule.jsp</h1>
                    </div>
                    <!-- Content Row -->
                    <!-- 영화, 극장, 날짜선택 -->
                    <form action="adminRegistSchedule" method="post" onsubmit="return registScFormCheck();">
                    
					<div class="row" style="min-height: 400px;" >
						<div class="col-xl-4 col-lg-4"> 
                            <div class="card mb-2">
                                <div class="card-header py-3 text-center bg-danger" >
                                    <h6 class="m-0 font-weight-bold h5 text-white">영화
                                    </h6>
                                </div>
                                <div class="card-body listArea text-gray-900" id="mvList" >
                                	<c:forEach items="${mvList }" var="movie">
                                    <div title="${movie.mvname }" class="p-2 font-weight-bold text-lg listTitle" onclick="selectMovie(this,'${movie.mvcode }')" >${movie.mvname }</div>
                                    </c:forEach>
                                </div>
                            </div>
						</div>
						
						<div class="col-xl-4 col-lg-4">
                            <div class="card mb-2">
                                <div class="card-header py-3 text-center bg-danger" >
                                    <h6 class="m-0 font-weight-bold h5 text-white">극장
                                    </h6>
                                </div>
                                <div class="card-body listArea text-gray-900" id="thList" >
                                	<c:forEach items="${thList }" var="theater">
                                    <div class="p-2 font-weight-bold text-lg listTitle" onclick="selectTheater(this,'${theater.thcode }')">${theater.thname }</div>
                                    </c:forEach>                                
                                </div>
                            </div>
						</div>
						
						<div class="col-xl-4 col-lg-4">
                            <div class="card mb-2">
                                <div class="card-header py-3 text-center bg-danger" >
                                    <h6 class="m-0 font-weight-bold h5 text-white">날짜</h6>
                                </div>
                                <div class="card-body listArea " >
                                
								<div id="datepicker" ></div>
                                </div>
                            </div>
						</div>
					</div>

                    <!-- Content Row -->
					<div class="row" style="min-height: 400px;" >
						<div class="col-xl-8 col-lg-8"> 
                            <div class="card mb-2">
                                <div class="card-header py-3 text-center bg-danger" >
                                    <h6 class="m-0 font-weight-bold h5 text-white">상영관 및 시간</h6>
                                </div>
                                <div class="card-body listArea text-gray-900" id="roomTimeList" >
                     
                                
                                </div>
                            </div>
						</div>
						<div class="col-xl-4 col-lg-4">
                            <div class="card mb-2">
                                <div class="card-header py-3 text-center bg-danger" >
                                    <h6 class="m-0 font-weight-bold h5 text-white">선택 확인
                                    </h6>
                                </div>
                                <div class="card-body listArea text-gray-900"  >
                                <div class="font-weight-bold text-lg listTitle">
                                	<input class="form-control" id="scmvcode" name="scmvcode" type="text"  readonly="readonly" placeholder="영화코드">
                                </div>
                                <div class="font-weight-bold text-lg listTitle">
                                	<input class="form-control" id="scthcode" name="scthcode" type="text"  readonly="readonly" placeholder="극장코드">
                                </div>
                                <div class="font-weight-bold text-lg listTitle">
                                	<input class="form-control" id="scdate" name="scdate" type="text"  readonly="readonly" placeholder="날짜">
                                </div>
                                <div class="font-weight-bold text-lg listTitle">
                                	<input class="form-control btn-danger" type="submit"  value="스케쥴등록">
                                </div>                                
                                </div>
                            </div>
						</div>

					</div>
                    <!-- Content Row -->
					</form>
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
	
	<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>
	<script type="text/javascript">
	$.datepicker.setDefaults({
		  dateFormat: 'yy-mm-dd',
		  prevText: '이전 달',
		  nextText: '다음 달',
		  monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		  monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		  dayNames: ['일', '월', '화', '수', '목', '금', '토'],
		  dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
		  dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		  showMonthAfterYear: true,
		  yearSuffix: '년'
		});
	$(function() {
		$("#datepicker").datepicker({
			onSelect:function(selDate){
				selectScheduleDate = selDate;
				$("#scdate").val(selectScheduleDate);
				getScRoomTimeList();
			}
		});
	});

	
	</script>	
	
	<script type="text/javascript">
		var selectMovieCode = "";
		var selectTheaterCode = "";
		var selectScheduleDate = "";
	
		function selectMovie(selObj, mvcode){
			/* 영화목록 CSS 변경 */
			$("#mvList div").removeClass("bg-secondary").css("color","");
			$(selObj).addClass("bg-secondary").css("color","white");
			$("#scmvcode").val(mvcode);
			selectMovieCode = mvcode;
			getScRoomTimeList();
		}
		
		function selectTheater(selObj, thcode){
			/* 극장목록 CSS 변경 */
			$("#thList div").removeClass("bg-secondary").css("color","");
			$(selObj).addClass("bg-secondary").css("color","white");
			$("#scthcode").val(thcode);
			selectTheaterCode = thcode;
			getScRoomTimeList();
		}
		/* 
		$("#datepicker").datepicker(); */
		
		function selectScRoomTime(selObj){
			if($(selObj).hasClass("bg-secondary")){
				$(selObj).removeClass("bg-secondary").css("color","");
			} else {
				$(selObj).addClass("bg-secondary").css("color","white");
			}
		}
		

		
		function getScRoomTimeList(){
			if( selectMovieCode.length > 0 && selectTheaterCode.length > 0 && selectScheduleDate.length >0 ){
				
				var thRoomList = ['1관', '2관', '3관', '4관','5관'];
				var thTimeList = ['09:00', '11:30', '14:00', '16:30', '19:00', '21:30'];
				
				//1. 스케쥴 테이블 조회 
				/*
				SELECT SCROOM, TO_CHAR(SCDATE, 'HH24:MI') AS SCDATE, MVNAME
				FROM SCHEDULES, MOVIES
				WHERE SCTHCODE = 'TH01' AND TO_CHAR(SCDATE,'YYYY-MM-DD') = '2022-06-17';
				>> 1관 09:00
				>> 2관 11:30
				>> 2관 14:00
				>> 3관 19:00
				>> 3관 21:30
				*/
				var result = []; //1. 스케쥴 테이블 조회 result[i].scroom
				var output = "";
				for(var roomIdx = 0 ; roomIdx < thRoomList.length; roomIdx++){
					output += "<div class=\"p-1 font-weight-bold text-lg\">"+thRoomList[roomIdx]+"</div>";
					
					var registTime = [];
					for( var i = 0; i < result.length; i++ ){
						if( thRoomList[roomIdx] == result[i].scroom  ){ 
							registTime.push(result[i].scdate);
						}
					}
					
					for( var timeIdx = 0; timeIdx < thTimeList.length; timeIdx++){
						
						output += "<input class=\"d-none\" id=\""+thRoomList[roomIdx]+thTimeList[timeIdx]+"\" type=\"checkbox\" name=\"scRoomTime\" value=\""+thRoomList[roomIdx]+" "+thTimeList[timeIdx]+"\">"
						output += "<label class=\"btn btn-sm scTimeBtn font-weight-bold mx-1 my-2\" for=\""+thRoomList[roomIdx]+thTimeList[timeIdx]+"\" onclick=\"selectScRoomTime(this)\">"+thTimeList[timeIdx]+"</label>";
						
					}
					
				}
				$("#roomTimeList").html(output);

				
			}
		}
		
		
		function registScFormCheck(){
			if(selectMovieCode.length == 0){
				alert("영화가 선택되지 않았습니다.");
				return false;
			}
			
			if(selectTheaterCode.length == 0){
				alert("극장이 선택되지 않았습니다.");
				return false;				
			}
			
			if(selectScheduleDate.length == 0){
				alert("날짜가 선택되지 않았습니다.");
				return false;				
			}

			var checkBox = $("input[name=scRoomTime]").is(":checked");
			console.log(checkBox);
			if(!checkBox){
				alert("상영관 및 시간이 선택되지 않았습니다.");
				return false;				
			}
			
			
		}
	
	</script>
	
	
	




</body>

</html>