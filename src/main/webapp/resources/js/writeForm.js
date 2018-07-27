/**
 * 
 */
$(function() {
	//전역변수선언
    var editor_object = [];
    var ctx = getContextPath();

    nhn.husky.EZCreator.createInIFrame({
        oAppRef: editor_object,
        elPlaceHolder: "smarteditor",
        sSkinURI: ctx + "/resources/smarteditor/SmartEditor2Skin.html",
        htParams : {
            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseToolbar : true,             
            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer : true,     
            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger : true,
            fOnBeforeUnload : function(){
                
            }
        }
    });
    
  //전송버튼 클릭이벤트
    $("#addBtn").click(function(){
        //id가 smarteditor인 textarea에 에디터에서 대입
        editor_object.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD", []);
         
        // 이부분에 에디터 validation 검증
        var el = document.createElement('html');
        el.innerHTML = editor_object.getById["smarteditor"].elPlaceHolder.value;
        //폼 submit
        $("#frm").submit();
    });
    
    function getContextPath() {
    	return sessionStorage.getItem("contextpath");
    }
	});

	function changeArea(){
 		var area1 = ['문학·책','영화','미술·디자인','공연·전시','음악','드라마','스타·연예인','만화·애니','방송']; //9개
 		var area2 = ['일상·생각','육아·결혼','애완·반려동물','좋은글·이미지','패션·미용','인테리어·DIY','상품리뷰','원예·재배']; //8개
 		var area3 = ['게임','스포츠','사진','자동차','취미','국내여행','세계여행','맛집']; //8개
 		var area4 = ['IT·컴퓨터','사회·정치','건강·의학','비즈니스·경제','어학·외국어','교육·학문']; //6개
 		var formName = document.insertboard;
 		var area = formName.area;
 		var i=0;
		switch($('#bigarea').val()){
		case 'art':
			area.length=0;
			for(i=0; i<area1.length; i++){
				area.options[i] = new Option(area1[i],i)
			}
			break;
		case 'life':
			area.length=0;
			for(i=0; i<area2.length; i++){
				area.options[i] = new Option(area2[i],i+9)
			}
			break;
		case 'hobby':
			area.length=0;
			for(var i=0; i<area3.length; i++){
				area.options[i] = new Option(area3[i],i+17)
			}
			break;
		case 'int':
			area.length=0;
			for(var i=0; i<area4.length; i++){
				area.options[i] = new Option(area4[i],i+25)
			}
			break;
		default :
				area.length=0;
				area.options[0] = new Option('==선택하세요==',31)
		} 
	}
	
	//list
	$(document).ready(function(){
		$('.listBoard > #list')
		.bind('mouseover' , function () {$(this).addClass('gray');})
		.bind('mouseout' , function () {$(this).removeClass('gray');})
	});
	
	
	
	$(document).ready(function(){
		var subMenuCount = 0;
		$('div.subMenuDiv').mouseup(function(e){
			if(subMenuCount==0){
				if(e.which=='3'){
					$(this).find('ul.subMenu').stop().slideDown(200);
				}
				subMenuCount = 1;
			} else {
				if(e.which=='3'){
					$(this).find('ul.subMenu').stop().slideUp(200);
				}
				subMenuCount = 0;
			}
		});
		
		var subMenuCount1 = 0;
		$('div.div_add').mouseup(function(e){
			if(subMenuCount1==0){
				if(e.which=='3'){
					$(this).find('table.jjm494_add').stop().slideDown(200);
				}
				subMenuCount1 = 1;
			} else {
				if(e.which=='3'){
					$(this).find('table.jjm494_add').stop().slideUp(200);
				}
				subMenuCount1 = 0;
			}
		});
		
		var subMenuCount2 = 0;
		$('div.subMenuDiv_add').mouseup(function(e){
			if(subMenuCount2==0){
				if(e.which=='1'){
					$(this).find('table.jjm494_subAdd').stop().slideDown(200);
				}
				subMenuCount2 = 1;
			} else {
				if(e.which=='1'){
					$(this).find('table.jjm494_subAdd').stop().slideUp(200);
				}
				subMenuCount2 = 0;
			}
		});
		
	});