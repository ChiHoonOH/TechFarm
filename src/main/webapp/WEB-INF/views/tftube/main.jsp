<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%-- <%@ incldue file="header.jsp"%> --%>
<%@ include file="top.jsp"%>

<div id="2-2" class="rdiv"> <!-- start of 2-2 -->
<!-- <div id="2-2-1">start of 2-2-1 -->
<div align="center">
<div id="caption" align="center">
<b>AD</b><br>
</div>
<div id="youngsang">
<video src="resources/tftube/advertise/2017 메이킨 광고 20초A.mp4" autoplay
 controls muted width="300" height="200"> </video>
</div>
</div>
<h3><b>인기</b></h3>

<c:set var="count" value="0"/>
<c:if test="${list.size()!=0}" >
<table>
<tr>
<c:forEach var="dto" items="${list}" begin="0" end="4"> 
<td width="210">
<a href="tftube_videoView?no=${dto.no}">
<img src="resources/tftube/Image/${dto.image}" width="196" height="100"><br>
${dto.title}</a><br>
<a href="tftube_mychannel">${dto.channel}</a><br>
${dto.readcount}회  ＊ ${dto.uploaddate}
</td>
<c:set var="count" value="${count=count+1}"/>
</c:forEach>
<c:if test="${count>=5}">
<c:set var="count" value="0"/><td><button class="not_realize">더보기</button></td>
</c:if>
</tr>
</table>
</c:if>
<p>
<p>

<c:set var="count_music" value="0"/>
<c:if test="${list_music.size()!=0}">
<h3><b><a href="tftube_category?category=music">음악</a></b></h3>
<table>
<tr>
<c:forEach var="dto" items="${list_music}"  begin="0" end="4"> 
<td width="210">
<a href="tftube_videoView?no=${dto.no}">
<img src="resources/tftube/Image/${dto.image}" width="196" height="100"><br>
${dto.title}</a><br>
<a href="tftube_mychannel">${dto.channel}</a><br>
${dto.readcount}회  ＊ ${dto.uploaddate}
</td>
<c:set var="count_music" value="${count_music=count_music+1}"/>
</c:forEach>
<c:if test="${count>=5}">
<c:set var="count_music" value="0"/><td><a href="tftube_category?category=music">더보기</a></td>
</c:if>
</tr>
</table>
</c:if>
<p>
<p>

<c:set var="count_sport" value="0"/>
<c:if test="${list_sport.size()!=0}">
<h3><b><a href="tftube_category?category=sport">스포츠</a></b></h3>
<table>
<tr>
<c:forEach var="sport_dto" items="${list_sport}"  begin="0" end="4"> 
<td width="210">
<a href="tftube_videoView?no=${sport_dto.no}">
<img src="resources/tftube/Image/${sport_dto.image}" width="196" height="100"><br>
${sport_dto.title}</a><br>
<a href="tftube_mychannel">${sport_dto.channel}</a><br>
${sport_dto.readcount}회  ＊ ${sport_dto.uploaddate}
</td>
<c:set var="count_sport" value="${count_sport=count_sport+1}"/>
</c:forEach>
<c:if test="${count>=5}">
<c:set var="count_sport" value="0"/><td><a href="tftube_category?category=sport">더보기</a></td>
</c:if>
</tr>
</table>
</c:if>
<p>
<p>

<c:set var="count_game" value="0"/>
<c:if test="${list_game.size()!=0}">
<h3><b><a href="tftube_category?category=game">게임</a></b></h3>
<table>
<tr>
<c:forEach var="game_dto" items="${list_game}"  begin="0" end="4"> 
<td width="210">
<a href="tftube_videoView?no=${game_dto.no}">
<img src="resources/tftube/Image/${game_dto.image}" width="196" height="100"><br>
${game_dto.title}</a><br>
<a href="tftube_mychannel">${game_dto.channel}</a><br>
${game_dto.readcount}회  ＊ ${game_dto.uploaddate}
</td>
<c:set var="count_game" value="${count_game=count_game+1}"/>
</c:forEach>
<c:if test="${count>=5}">
<c:set var="count_game" value="0"/><td><a href="tftube_category?category=game">더보기</a></td>
</c:if>
</tr>
</table>
</c:if>
<p>
<p>
<c:set var="count_comedy" value="0"/>
<c:if test="${list_comedy.size()!=0}">
<h3><b><a href="tftube_category?category=comedy">코미디</a></b></h3>
<table>
<tr>
<c:forEach var="comedy_dto" items="${list_comedy}"  begin="0" end="4"> 
<td width="210">
<a href="tftube_videoView?no=${comedy_dto.no}">
<img src="resources/tftube/Image/${comedy_dto.image}" width="196" height="100"><br>
${comedy_dto.title}</a><br>
<a href="tftube_mychannel">${comedy_dto.channel}</a><br>
${comedy_dto.readcount}회  ＊ ${comedy_dto.uploaddate}
</td>
<c:set var="count_comedy" value="${count_comedy=count_comedy+1}"/>
</c:forEach>
<c:if test="${count>=5}">
<c:set var="count_comedy" value="0"/><td><a href="tftube_category?category=comedy">더보기</a></td>
</c:if>
</tr>
</table>
</c:if>
<p>
<p>
<c:set var="count_movie" value="0"/>
<c:if test="${list_movie.size()!=0}">
<h3><b><a href="tftube_category?category=movie">영화</a></b></h3>
<table>
<tr>
<c:forEach var="movie_dto" items="${list_movie}"  begin="0" end="4"> 
<td width="210">
<a href="tftube_videoView?no=${movie_dto.no}">
<img src="resources/tftube/Image/${movie_dto.image}" width="196" height="100"><br>
${movie_dto.title}</a><br>
<a href="tftube_mychannel">${movie_dto.channel}</a><br>
${movie_dto.readcount}회  ＊ ${movie_dto.uploaddate}
</td>
<c:set var="count_movie" value="${count_movie=count_movie+1}"/>
</c:forEach>
<c:if test="${count>=5}">
<c:set var="count_movie" value="0"/><td><a href="tftube_category?category=movie">더보기</a></td>
</c:if>
</tr>
</table>
</c:if>
<p>
<p>
<c:set var="count_news" value="0"/>
<c:if test="${list_news.size()!=0}">
<h3><b><a href="tftube_category?category=news">뉴스</a></b></h3>
<table>
<tr>
<c:forEach var="news_dto" items="${list_news}"  begin="0" end="4"> 
<td width="210">
<a href="tftube_videoView?no=${news_dto.no}">
<img src="resources/tftube/Image/${news_dto.image}" width="196" height="100"><br>
${news_dto.title}</a><br>
<a href="tftube_mychannel">${news_dto.channel}</a><br>
${news_dto.readcount}회  ＊ ${news_dto.uploaddate}
</td>
<c:set var="count_news" value="${count_news=count_news+1}"/>
</c:forEach>
<c:if test="${count>5}">
<c:set var="count_news" value="0"/><td><a href="tftube_category?category=news">더보기</a></td>
</c:if>
</tr>
</table>
</c:if>
<p>
<p>
<c:set var="count_animation" value="0"/>
<c:if test="${list_ani.size()!=0}">
<h3><b><a href="tftube_category?category=animation">애니메이션</a></b></h3>
<table>
<tr>
<c:forEach var="ani_dto" items="${list_ani}"  begin="0" end="4"> 
<td width="210">
<a href="tftube_videoView?no=${ani_dto.no}">
<img src="resources/tftube/Image/${ani_dto.image}" width="196" height="100"><br>
${ani_dto.title}</a><br>
<a href="tftube_mychannel">${ani_dto.channel}</a><br>
${ani_dto.readcount}회  ＊ ${ani_dto.uploaddate}
</td>
<c:set var="count_animation" value="${count_animation=count_animation+1}"/>
</c:forEach>
<c:if test="${count>=5}">
<c:set var="count_animation" value="0"/><td><a href="tftube_category?category=animation">더보기</a></td>
</c:if>
</tr>
</table>
</c:if>
<p>
<p>

<!-- src="동영상주소" : 동영상 주소를 입력합니다. 예 - http://www.domain.com/동영상.mp4 

controls : 동영상을 재생하고 탐색하기 위한 조정 바를 표시합니다.

loop : 반복 설정합니다. 동영상이 계속 반복됩니다.


muted : 음소거가 되도록 합니다.

autoplay : 페이지가 로드되면 바로 동영상이 재생되도록 합니다.

poster="이미지파일" : 동영상이 플레이 되기 전 대표로 보여줄 이미지파일을 지정합니다. -->
<!-- </div>end of 2-2-1 -->
</div><!-- end of 2-2 -->

<%@ include file="bottom.jsp"%> 