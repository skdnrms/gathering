$(function() {

	/*
	 * initialize the external events
	 * -----------------------------------------------------------------
	 */
	function ini_events(ele) {
		ele.each(function() {
			// create an Event Object
			// (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
			// it doesn't need to have a start or end
			var eventObject = {
				title : $.trim($(this).text())
			// use the element's text as the event title
			};
		});
	}
	ini_events($('#external-events div.external-event'));

	/*
	 * initialize the calendar
	 * -----------------------------------------------------------------
	 */
	// 모임의 주소값을 가져온다
	var userGatheringGids = new Array();
	$(".gatheingGids").each(function (index){
		userGatheringGids[index] = $(this).val();
	});

	$.getJSON("gatheringDate.ajax?gid=" + userGatheringGids, function(curri){
		var curris = new Array();
		for (var int = 0; int < curri.length; int++) {
			curris[int] = {
					title : curri[int].title,
					start : new Date(curri[int].date),
					backgroundColor : "#f56954", // red
					borderColor : "#0073b7" // red 
			};
		}
		
		
		// Date for the calendar events (dummy data)
		var date = new Date();
		var d = date.getDate(), m = date.getMonth(), y = date.getFullYear();
		$('#calendar')
				.fullCalendar(
						{
							// 헤더 설정
							header : {
								left : 'prev,next',
								center : 'title',
								right : 'today'
							},
							
							// 버튼설정
							buttonText : {
								prev : "<span class='glyphicon glyphicon-chevron-left'></span>",
								next : "<span class='glyphicon glyphicon-chevron-right'></span>",
								today : "<span class='glyphicon glyphicon-flag'> 오늘</span>"
							},
							
							// 월/요일 설정
							monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
							monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
							dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'],
							dayNamesShort: ['일','월','화','수','목','금','토'],
							
							// 제목설정
							titleFormat: {
								month: 'MMMM',
								week: "한주",
								day: 'MMM/d dddd'
							},
							
							// 이벤트 설정
							events : curris
						});
	});
});