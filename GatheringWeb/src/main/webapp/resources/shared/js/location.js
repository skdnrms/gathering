var locations = [ "서울", "인천", "부산", "광주", "대구", "울산", "대전", "경기", "강원", "경상", "충청", "전라", "제주" ];
				
$(function(){
	for (var i=0, len = locations.length; i < len; i++) {
		$("#location").append($("<option></option>").text(locations[i]).val(locations[i]));
	};
});