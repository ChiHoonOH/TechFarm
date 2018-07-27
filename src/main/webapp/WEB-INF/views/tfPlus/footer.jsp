<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

		<!-- 하단 시작 -->
		<footer>
		
			<div class="wrapper">
				<ul  class="widget-cols clearfix">
					<li class="first-col">
						<div class="widget-block">
							<div class="recent-post">
								<a href="#" onclick="check('myAccount');" class="thumb"><img src="resources/home/imgs/account.png" style="width:50px; height:50px;"></a>
								<div class="post-head">
									<a href="#">내계정</a><span>내계정</span>
								</div>
							</div>
							<div class="recent-post">
								<a href="home" class="thumb"><img src="resources/home/imgs/search.png" style="width:50px; height:50px;"></a>
								<div class="post-head">
									<a href="#">검색</a><span>검색</span>
								</div>
							</div>
							<div class="recent-post">
								<a href="#" onclick="check('listJames');" class="thumb"><img src="resources/home/imgs/mail.png" style="width:50px; height:50px;"></a>
								<div class="post-head">
									<a href="#">메일</a><span>메일</span>
								</div>
							</div>
						</div>
					</li>
					<li class="first-col">
						<div class="widget-block">
							<div class="recent-post">
								<a href="#" class="thumb" onclick="check('tfPlusIndex');"><img src="resources/home/imgs/social.png" style="width:50px; height:50px;"></a>
								<div class="post-head">
									<a href="#" onclick="check('tfPlusIndex');">SNS</a><span>SNS</span>
								</div>
							</div>
							<div class="recent-post">
								<a href="tftube_main" class="thumb"><img src="resources/home/imgs/utube.png" style="width:50px; height:50px;"></a>
								<div class="post-head">
									<a href="tftube_main">영상</a><span>영상</span>
								</div>
							</div>
							<div class="recent-post">
								<a href="blogmain" class="thumb"><img src="resources/home/imgs/document.png" style="width:50px; height:50px;"></a>
								<div class="post-head">
									<a href="blogmain">블로그</a><span>블로그</span>
								</div>
							</div>
						</div>
					</li>
					<li class="first-col">
						<div class="widget-block">
							<div class="recent-post">
								<a href="#" onclick="check('tfNoteIndex?id=${sessionScope.memberDTO.id}');" class="thumb"><img src="resources/home/imgs/memo.png" style="width:50px; height:50px;"></a>
								<div class="post-head">
									<a href="#" onclick="check('tfNoteIndex?id=${sessionScope.memberDTO.id}');">메모</a><span>메모</span>
								</div>
							</div>
							<div class="recent-post">
								<a href="#"  onclick="check('tfchat_main');" class="thumb"><img src="resources/home/imgs/chatting.png" style="width:50px; height:50px;"></a>
								<div class="post-head">
									<a href="#" onclick="check('tfchat_main');">채팅</a><span>채팅</span>
								</div>
							</div>
							<div class="recent-post">
								<a href="#" onclick="check('listContacts');" class="thumb"><img src="resources/home/imgs/calendar.png" style="width:50px; height:50px;"></a>
								<div class="post-head">
									<a href="#" onclick="check('listContacts');">연락처</a><span>연락처</span>
								</div>
							</div>
						</div>
					</li>
					
					<li class="fourth-col">
						<div class="widget-block">
							<h4>tfPlus</h4>
							<p>관심있는 분야에 대해 정보를 받을 수 있는 사이트.<a href="#">↑↑↑</a></p>
						</div>
					</li>
				</ul>
				
				<div class="footer-bottom">
					<div class="left">메인 홈페이지<a href="#">TechFarm</a></div>
					<div class="right">
					</div>
				</div>
			</div>
			
		</footer>
		<!-- 하단 끝 -->
		
	</body>
</html>