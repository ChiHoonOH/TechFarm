<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/views/tfchat/header.jsp" %>
<html>
	<head>
		<meta charset="UTF-8">
		<script src="resources/js/jquery-3.1.1.min.js"></script>     
		<script src="resources/js/socket.io.js"></script>
        
        <script>
            var host;
            var port;
            var socket;
            
         	// 문서 로딩 후 실행됨
            $(function() {
			
                 host = '52.79.140.54';//192.168.52.35
                 port = '3000';
                 connectToServer();
                 
                 var id = $('#idInput').val();
                 var output = {id:id};
                 console.log('서버로 보낼 데이터 : ' + JSON.stringify(output));
                 if (socket == undefined) {
                     alert('서버에 연결되어 있지 않습니다. 먼저 서버에 연결하세요.');
                     return;
                 }
                 socket.emit('login', output);
                 

				// 전송 버튼 클릭 시 처리
                $("#sendButton").bind('click', function(event) {
	            	send();
	          	});
				
             	
             	//초대하기 버튼 클릭시
                $("#inviteButton").bind('click', function(event) {
                	$('#roomIdInput').val('${sessionScope.memberDTO.id}');
                    var roomId = $('#roomIdInput').val();
                    var roomName = $('#roomNameInput').val();
                    var id = $('#idInput').val();
                    var inviteId=[];
                    var chk_id=document.getElementsByName("chkId");
                    var chk_id_leng=chk_id.length;
                    for(i=0;i<chk_id_leng;i++){
                    	if(chk_id[i].checked==true){
                    		inviteId.push(chk_id[i].value);
                    	}
                    }
                    var inviteRoom=$('#roomIdInput').val();
                    var inviteRoomOwner=$('#idInput').val();
                    var output = {command:'create', roomId:roomId, roomName:roomName, roomOwner:id};
                    console.log('서버로 보낼 데이터 : ' + JSON.stringify(output));
	                var inviteinfo={inviteId:inviteId, inviteRoom:inviteRoom, inviteRoomOwner:inviteRoomOwner};
	                console.log('서버로 보낼 데이터 : ' + JSON.stringify(inviteinfo));
                    if (socket == undefined) {
                        alert('서버에 연결되어 있지 않습니다. 먼저 서버에 연결하세요.');
                        return;
                    }
                    socket.emit('room', output);
                    socket.emit('invite', inviteinfo);
                    $('#recepientInput').val(roomId);
                    $('#dataInput').removeAttr('disabled');
                    $('#sendButton').removeAttr('disabled');
                });
             	
             	// 방나가기 버튼 클릭 시 처리
                $("#leaveRoomButton").bind('click', function(event) {
                    var roomId = $('#roomIdInput').val();
                    var leaveId=$('#idInput').val();

                    var output = {command:'leave', roomId:roomId, leaveId:leaveId};
                    console.log('서버로 보낼 데이터 : ' + JSON.stringify(output));

                    if (socket == undefined) {
                        alert('서버에 연결되어 있지 않습니다. 먼저 서버에 연결하세요.');
                        return;
                    }
                    socket.emit('room', output);
                    $('#recepientInput').val('');
                    $('#roomIdInput').val('');
                    $('#dataInput').attr('disabled','disabled');
                    $('#sendButton').attr('disabled','disabled');
                });
             	
                $('#dataInput').keypress(function(event){
        			var keycode = (event.keyCode ? event.keyCode : event.which);
        			if(keycode == '13'){
        				send();	
        			}
        			event.stopPropagation();
        		});
                
                document.onunLoad
             	
            });
            
			// 서버에 연결하는 함수 정의
            function connectToServer() {

                var options = {'forceNew':true};
                var url = 'http://' + host + ':' + port;
                socket = io.connect(url, options);

                socket.on('connect', function() {
                	println('웹소켓 서버에 연결되었습니다. : ' + url);

                	socket.on('message', function(message) {
                    	console.log(JSON.stringify(message));

                    	println('<p>수신 메시지 : ' + message.sender + ', ' + message.recepient + ', ' + message.command + ', ' + message.data + '</p>');
    	            	if(!('${sessionScope.memberDTO.id}'==message.sender)){
    	            		addToDiscussion('other', message.sender, message.data);
    	            	}
                    	
                    });
                    
                    socket.on('invite', function(data) {
                        console.log(JSON.stringify(data));
                        var roomId=data.inviteRoom;
                        println(roomId);
                        var output = {command:'join', roomId:roomId};
                        console.log('서버로 보낼 데이터 : ' + JSON.stringify(output));

                        if (socket == undefined) {
                            alert('서버에 연결되어 있지 않습니다. 먼저 서버에 연결하세요.');
                            return;
                        }
                        socket.emit('room', output);
                        $('#roomIdInput').val(roomId);
                        $('#recepientInput').val(roomId);
                        $('#dataInput').removeAttr('disabled');
                        $('#sendButton').removeAttr('disabled');
                    });

                    socket.on('response', function(response) {
                    	console.log(JSON.stringify(response));
                    	println('응답 메시지를 받았습니다. : ' + response.command + ', ' + response.code + ', ' + response.message);
                    });

                    // 그룹 채팅에서 방과 관련된 이벤트 처리
                    socket.on('room', function(data) {
                        console.log(JSON.stringify(data));

                        println('<p>방 이벤트 : ' + data.command + '</p>');
                        println('<p>방 리스트를 받았습니다.</p>');
                        if (data.command == 'list') { // 방 리스트
                        	var roomCount = data.rooms.length;
                        	$("#roomList").html('<p>방 리스트 ' + roomCount + '개</p>');
                        	for (var i = 0; i < roomCount; i++) {
                        		$("#roomList").append('<p>방 #' + i + ' : ' + data.rooms[i].id + ', ' + data.rooms[i].name + ', ' + data.rooms[i].owner + '</p>');
                        	}
                        }
                    });
                    // 현재 접속 아이디 받아오기
                    socket.on('currentId', function(data) {
                        console.log(JSON.stringify(data));
                        if (data.command == 'list') { // 방 리스트
                        	var idCount = data.ids.length;
                        	$("#idList").html('<h3>접속자 리스트 ' + idCount + '명</h3>');
                        	for (var i = 0; i < idCount; i++) {
                        		$("#idList").append('<input type="checkbox" name="chkId" value='+ data.ids[i]+'><font size="5">'+data.ids[i]+'</font><br>');
                        		/* $("#idList").append('<p>접속자 #' + i + ' : ' + data.ids[i]+'</p>'); */
                        	}
                        }
                    });

                });

                socket.on('disconnect', function() {
                    println('웹소켓 연결이 종료되었습니다.');
                });

            }
			
            function addToDiscussion(writer, sender, msg) {
    			println("addToDiscussion 호출됨 : " + writer + ", " + msg);
    			var msg2=makeMsg(msg);
    			if(sender=='system'){
    				var contents = "<div align='center'><p>-------"+msg2+"-------<p></div>";
    				println("추가할 HTML : " + contents);
       			    $(".discussion").append(contents);
    			}else{
    				var time=currentTime();
    				var contents = "<li class='" + writer + "'>"
        			 + "  <div class='messages'>"
        			 +      sender + ": <br>"
          		 	 + "    <p>" + msg2 + "</p>"
        			 + "  </div>"
        			 + "  <div class='time'>"
        			 + "    <time datetime=''>"+time+"</time>"
        			+ "  </div>"
      			 	 + "</li>";
   			   	println("추가할 HTML : " + contents);
   			    $(".discussion").append(contents);
    			}
			    var maxScroll=document.getElementById('result').scrollHeight;
			    $("#result").scrollTop(maxScroll);
    		}
            
            function send(){
            	var sender = $('#senderInput').val();
            	var recepient = $('#recepientInput').val();
            	var data = $('#dataInput').val();

          		var output = {sender:sender, recepient:recepient, command:'groupchat', type:'text', data:data};
            	console.log('서버로 보낼 데이터 : ' + JSON.stringify(output));

           		if (socket == undefined) {
             		alert('서버에 연결되어 있지 않습니다. 먼저 서버에 연결하세요.');
           			return;
             	}

           		socket.emit('message', output);
           		
           		addToDiscussion('self', sender, data);
           		$('#dataInput').val('');
            }
            
			function println(data) {
				console.log(data);
				// $('#result').append('<p>' + data + '</p>');
			}
			function currentTime(){
				var time=new Date();
				var currentTime=time.getHours()+'시 '+time.getMinutes()+'분';
				return currentTime;
			}
			
			function disconnect(){
				var id = $('#idInput').val();
				var output = {id:id};
                console.log('서버로 보낼 데이터 : ' + JSON.stringify(output));
                if (socket == undefined) {
                    alert('서버에 연결되어 있지 않습니다. 먼저 서버에 연결하세요.');
                    return;
                }
                socket.emit('disconnect');
			}
			function makeMsg(msg){
				var msg2='';
    			var count;
    			if(msg.length/42>1){
    				for(var i=0;i<(msg.length/42)-1;i++){
    					count=(i+1)*42;
    					msg2=msg2+msg.substring((42*i),count)+"<br>";
    				}
    				msg2=msg2+msg.substring(count,msg.length);
    			}else{
    				msg2=msg;
    			}
    			return msg2;
			}
        </script>
	</head>
<body onunload="disconnect();">
	<input type="hidden" id="idInput" value="${sessionScope.memberDTO.id}" />
	<input type="hidden" id="roomIdInput" value="${sessionScope.memberDTO.id}" />
	<input type="hidden" id="roomNameInput" value="${sessionScope.memberDTO.id}" />
	<input type="hidden" id="senderInput" value="${sessionScope.memberDTO.id }" />
	<input type="hidden" id="chattype" value="groupchat">
	<input type="hidden" id="recepientInput"/>
	<div id="idresult">
	<h2>현재 접속인원</h2>
    <div id="idList">
	</div>
		<input type="button" id="inviteButton" style="width:200px; height:50px; background:#ffffff URL('resources/tfchat/img/invite.jpg'); background-size:cover"/>
	</div>
    <br>
        
    <div id="chatresult">
    <div class="ui segment" id="result">	
	  <ol class="discussion">
	  </ol>
	</div>
	<input type="text" id="dataInput" disabled="disabled"/>
    <input type="button" id="sendButton" value="전송" disabled="disabled"/>
    <input type="button" id="leaveRoomButton" value="나가기" />
	</div>
    
        
</body>
</html>