
	
	var fields = {};
	
	fields.mian = [ { code : 'A01', text : '어학' },
	                { code : 'A02', text : 'IT' },
	                { code : 'A03', text : '취업' },
	                { code : 'A04', text : '기타' }];
	
	fields.A01 = [ { code : 'B01', text : '영어' }, 
				   { code : 'B02', text : '일어' },
				   { code : 'B03', text : '중국어' },
				   { code : 'B04', text : '독일어' } ];
	fields.A02 = [ { code : 'B05', text : '프로그래밍' },
				   { code : 'B06', text : '자격증' } ];
	fields.A03 = [ { code : 'B07', text : '적성검사'},
	               { code : 'B08', text : '면접'}];
	
	fields.B01 = [ { code : 'C01', text : '회화'},
	               { code : 'C02', text : '문법'}];
	fields.B02 = fields.B01;
	fields.B03 = fields.B01;
	fields.B04 = fields.B01;
	fields.B05 = [ { code : 'C03', text : 'JAVA'},
	               { code : 'C04', text : 'C'},
	               { code : 'C05', text : 'DB'} ];
	fields.B06 = [ { code : 'C06', text : '정보처리기사'},
	               { code : 'C07', text : 'MOS'}];
	fields.B07 = [ { code : 'C08', text : 'SSAT'} ];
	fields.B08 = [ { code : 'C09', text : '기술면접'},
	               { code : 'C10', text : '영어면접'}];
		
				
	$(function(){
		$( "body" ).on( "change", "#field1", function() {
			var field2 = fields[$(this).val()];
			$("#field2").empty();
			if (field2 != undefined) {
				$("#field2").append($("<option selected disabled></option>").text('선택해 주세요'));
				for (var i=0, len = field2.length; i < len; i++) {
					$("#field2").append($("<option></option>").text(field2[i].text).val(field2[i].code));
				};
				$("#field2").prop("disabled", false);
			} else {
				$("#field2").prop("disabled", true);
			}
			$("#field3").empty();
			$("#field3").prop("disabled", true);
		});
		
		$( "body" ).on( "change", "#field2", function() {
			var field3 = fields[$(this).val()];
			$("#field3").empty();
			$("#field3").append($("<option selected disabled></option>").text('선택해 주세요'));
			for (var i=0, len = field3.length; i < len; i++) {
				$("#field3").append($("<option></option>").text(field3[i].text).val(field3[i].code));
			};
			$("#field3").prop("disabled", false);
		});
	});
