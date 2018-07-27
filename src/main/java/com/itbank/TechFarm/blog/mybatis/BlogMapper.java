package com.itbank.TechFarm.blog.mybatis;
import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.itbank.TechFarm.blog.dto.Blog_BoardDTO;
import com.itbank.TechFarm.blog.dto.Blog_BoardReplyDTO;
import com.itbank.TechFarm.blog.dto.Blog_MakeBoardDTO;
import com.itbank.TechFarm.blog.dto.Blog_NeighborDTO;
import com.itbank.TechFarm.blog.dto.Blog_OptionDTO;

public class BlogMapper {

  private static SqlSessionFactory sqlMapper;

  static {
    try {
    	String resource = "com/itbank/TechFarm/SqlMapConfig_tfblog.xml";
    	Reader reader = Resources.getResourceAsReader(resource);
    	sqlMapper = new SqlSessionFactoryBuilder().build(reader); 
    } catch (IOException e) {
   
      throw new RuntimeException("Something bad happened while building the SqlMapClient instance." + e, e);
    }
  }
  
  public static int makeBlog(Blog_OptionDTO dto){
	  SqlSession session = sqlMapper.openSession();
	  int res = session.insert("makeBlog",dto);
	  session.commit();
	  session.close();
	  return res;
  }
  
  public static Blog_OptionDTO getBlog(String id){
	  SqlSession session = sqlMapper.openSession();
	  Blog_OptionDTO dto = session.selectOne("getBlog",id);
	  session.close();
	  return dto;
	  
  }
  
  public static int deleteBlog(String id){
	  SqlSession session = sqlMapper.openSession();
	  int res = session.delete("deleteBlog",id);
	  session.commit();
	  session.close();
	return res;  
  }
  
  public static int deleteAllmyBoard(String id){
	  SqlSession session = sqlMapper.openSession();
	  int res = session.delete("deleteAllmyBoard",id);
	  session.commit();
	  session.close();
	return res;  
  }
  
  public static int makeBoard(Blog_MakeBoardDTO dto){
	  SqlSession session = sqlMapper.openSession();
	  int res = session.insert("makeBoard",dto);
	  session.commit();
	  session.close();
	  return res;
  }
  
  public static List<Blog_MakeBoardDTO> listBoardTitle(String id){
	  SqlSession session = sqlMapper.openSession();
	  List<Blog_MakeBoardDTO> list = (List)session.selectList("listBoardTitle",id);
	  session.close();
	  return list;
  }
  
  public static int editBlog_pf_int(Blog_OptionDTO dto){
	  SqlSession session = sqlMapper.openSession();
	  int res = session.update("editBlog_pf_int",dto);
	  session.commit();
	  session.close();
	  return res;
  }
  
  public static int editBlog_layout(Blog_OptionDTO dto){
	  SqlSession session = sqlMapper.openSession();
	  int res = session.update("editBlog_layout",dto);
	  session.commit();
	  session.close();
	  return res;
  }
  
  public static int editBlog_skin(Blog_OptionDTO dto){
	  SqlSession session = sqlMapper.openSession();
	  int res = session.update("editBlog_skin",dto);
	  session.commit();
	  session.close();
	  return res;
  }
  
  public static int editBlog_headerword(Blog_OptionDTO dto){
	  SqlSession session = sqlMapper.openSession();
	  int res = session.update("editBlog_headerword",dto);
	  session.commit();
	  session.close();
	  return res;
  }
  
  public static Blog_MakeBoardDTO getBoardT(int boardno){
	  SqlSession session = sqlMapper.openSession();
	  Blog_MakeBoardDTO dto = session.selectOne("getBoardT", boardno);
	  session.close();
	  return dto;
  }
  
  public static List<Blog_BoardDTO> listMyBoard(String id){
	  SqlSession session = sqlMapper.openSession();
	  List<Blog_BoardDTO> list = session.selectList("listMyBoard", id);
	  session.close();
	  return list;
  }
  
  public static int editBoardT(Blog_MakeBoardDTO dto){
	  SqlSession session = sqlMapper.openSession();
	  int res = session.update("editBoardT",dto);
	  session.commit();
	  session.close();
	  return res;
  }
  
  public static List<Blog_BoardDTO> listBoard(int boardno,int startRow,int endRow){
	  SqlSession session = sqlMapper.openSession();
	  Map<String, Object> parameters = new HashMap<String, Object>();
	  parameters.put("boardno", boardno);
	  parameters.put("startRow", startRow);
	  parameters.put("endRow", endRow);
	  List<Blog_BoardDTO> list = (List)session.selectList("listBoard",parameters);
	  session.close();
	  return list;
  }
  
  public static int boardNumber(int boardno){
	  SqlSession session = sqlMapper.openSession();
	  int res = session.selectOne("boardNumber", boardno);
	  session.close();
	  return res;
  }
  
  public static int insertBoard(Blog_BoardDTO dto){
	  SqlSession session = sqlMapper.openSession();
	  int res = session.insert("insertBoard",dto);
	  session.commit();
	  session.close();
	  return res;
  }
  
  public static Blog_BoardDTO getBoard(int no){
	  SqlSession session = sqlMapper.openSession();
	  Blog_BoardDTO dto = session.selectOne("getBoard", no);
	  session.close();
	  return dto;
  }
  
  public static int updateBoard(Blog_BoardDTO dto){
	  SqlSession session = sqlMapper.openSession();
	  int res = session.update("updateBoard",dto);
	  session.commit();
	  session.close();
	  return res;
  }
  
  public static int deleteBoard(int no){
	  SqlSession session = sqlMapper.openSession();
	  int res = session.delete("deleteBoard",no);
	  session.commit();
	  session.close();
	return res;
	  
  }
  
  public static int insertReply(Blog_BoardReplyDTO dto){
	  SqlSession session = sqlMapper.openSession();
	  int res = session.insert("insertReply",dto);
	  session.commit();
	  session.close();
	  return res;
  }
  
  public static int updateRestep(){
	  SqlSession session = sqlMapper.openSession();
	  int res = session.update("updateRestep");
	  session.commit();
	  session.close();
	  return res;
  }
  
  public static int updateRerestep(int re_step){
	  SqlSession session = sqlMapper.openSession();
	  int res = session.update("updateRerestep",re_step);
	  session.commit();
	  session.close();
	  return res;
  }
  
  public static int updateReplyNumber(int no){
	  SqlSession session = sqlMapper.openSession();
	  int res = session.update("updateReplyNumber",no);
	  session.commit();
	  session.close();
	  return res;
  }
  
  public static int updateVisitornum(String id){
	  SqlSession session = sqlMapper.openSession();
	  int res = session.update("updateVisitornum",id);
	  session.commit();
	  session.close();
	  return res;
  }
  
  public static int minusReplyNumber(int no){
	  SqlSession session = sqlMapper.openSession();
	  int res = session.update("minusReplyNumber",no);
	  session.commit();
	  session.close();
	  return res;
  }
  
  /*public static List<Blog_BoardReplyDTO> listReply(int no){
	  SqlSession session = sqlMapper.openSession();
	  List<Blog_BoardReplyDTO> list = (List)session.selectList("listReply",no);
	  session.close();
	  return list;
  }*/
  
  public static List<Blog_BoardReplyDTO> listReply(int no,int startRow,int endRow){
	  SqlSession session = sqlMapper.openSession();
	  Map<String, Object> parameters = new HashMap<String, Object>();
	  parameters.put("no", no);
	  parameters.put("startRow", startRow);
	  parameters.put("endRow", endRow);
	  List<Blog_BoardReplyDTO> list = (List)session.selectList("listReply",parameters);
	  session.close();
	  return list;
  }
  
  public static int updateReadcount(int no){
	  SqlSession session = sqlMapper.openSession();
	  int res = session.update("updateReadcount",no);
	  session.commit();
	  session.close();
	  return res;
  }
  
  public static int deleteReply(int replyno){
	  SqlSession session = sqlMapper.openSession();
	  int res = session.delete("deleteReply",replyno);
	  session.commit();
	  session.close();
	  return res;
  }
  
  public static int replyNumber(int no){
	  SqlSession session = sqlMapper.openSession();
	  int res = session.selectOne("replyNumber", no);
	  session.close();
	  return res;
  }
   
  public static List<Blog_BoardDTO> listNewBoard(){
	  SqlSession session = sqlMapper.openSession();
	  List<Blog_BoardDTO> list = (List)session.selectList("listNewBoard");
	  session.close();
	  return list;
  }
  
  public static List<Blog_BoardDTO> listHotBoard(){
	  SqlSession session = sqlMapper.openSession();
	  List<Blog_BoardDTO> list = (List)session.selectList("listHotBoard");
	  session.close();
	  return list;
  }
  
  public static List<String> listHotProfile(){
	  SqlSession session = sqlMapper.openSession();
	  List<String> list = (List)session.selectList("listHotProfile");
	  session.close();
	  return list;
  }
  
  public static List<String> listNewProfile(){
	  SqlSession session = sqlMapper.openSession();
	  List<String> list = (List)session.selectList("listNewProfile");
	  session.close();
	  return list;
  }
  
  public static List<Blog_OptionDTO> listHotBlog(){
	  SqlSession session = sqlMapper.openSession();
	  List<Blog_OptionDTO> list = (List)session.selectList("listHotBlog");
	  session.close();
	  return list;
  }
  
  public static List<Blog_BoardDTO> listAreaBoard1(int startRow,int endRow){
	  SqlSession session = sqlMapper.openSession();
	  Map<String, Object> parameters = new HashMap<String, Object>();
	  parameters.put("startRow", startRow);
	  parameters.put("endRow", endRow);
	  List<Blog_BoardDTO> list = (List)session.selectList("listAreaBoard1",parameters);
	  session.close();
	  return list;
  }
  
  public static List<Blog_BoardDTO> listAreaBoard2(int startRow,int endRow){
	  SqlSession session = sqlMapper.openSession();
	  Map<String, Object> parameters = new HashMap<String, Object>();
	  parameters.put("startRow", startRow);
	  parameters.put("endRow", endRow);
	  List<Blog_BoardDTO> list = (List)session.selectList("listAreaBoard2",parameters);
	  session.close();
	  return list;
  }
  
  public static List<Blog_BoardDTO> listAreaBoard3(int startRow,int endRow){
	  SqlSession session = sqlMapper.openSession();
	  Map<String, Object> parameters = new HashMap<String, Object>();
	  parameters.put("startRow", startRow);
	  parameters.put("endRow", endRow);
	  List<Blog_BoardDTO> list = (List)session.selectList("listAreaBoard3",parameters);
	  session.close();
	  return list;
  }
  
  public static List<Blog_BoardDTO> listAreaBoard4(int startRow,int endRow){
	  SqlSession session = sqlMapper.openSession();
	  Map<String, Object> parameters = new HashMap<String, Object>();
	  parameters.put("startRow", startRow);
	  parameters.put("endRow", endRow);
	  List<Blog_BoardDTO> list = (List)session.selectList("listAreaBoard4",parameters);
	  session.close();
	  return list;
  }
  
  public static List<Blog_OptionDTO> listSearchBlog(String search_option,String search_text){
	  SqlSession session = sqlMapper.openSession();
	  Map<String, Object> parameters = new HashMap<String, Object>();
	  parameters.put("search_option", search_option);
	  parameters.put("search_text", search_text);
	  List<Blog_OptionDTO> list = (List)session.selectList("searchBlog",parameters);
	  session.close();
	  return list;
  }
  
  public static List<Blog_BoardDTO> listSearchBoard(String search_option,String search_text){
	  SqlSession session = sqlMapper.openSession();
	  Map<String, Object> parameters = new HashMap<String, Object>();
	  parameters.put("search_option", search_option);
	  parameters.put("search_text", search_text);
	  List<Blog_BoardDTO> list = (List)session.selectList("searchBoard",parameters);
	  session.close();
	  return list;
  }
  
  public static int areaboardNumber1(){
	  SqlSession session = sqlMapper.openSession();
	  int res = session.selectOne("areaboardNumber1");
	  session.close();
	  return res;
  }
  
  public static int areaboardNumber2(){
	  SqlSession session = sqlMapper.openSession();
	  int res = session.selectOne("areaboardNumber2");
	  session.close();
	  return res;
  }
  
  public static int areaboardNumber3(){
	  SqlSession session = sqlMapper.openSession();
	  int res = session.selectOne("areaboardNumber3");
	  session.close();
	  return res;
  }
  
  public static int areaboardNumber4(){
	  SqlSession session = sqlMapper.openSession();
	  int res = session.selectOne("areaboardNumber4");
	  session.close();
	  return res;
  }
  
  public static List<Blog_BoardDTO> imsiBoard(String id){
	  SqlSession session = sqlMapper.openSession();
	  List<Blog_BoardDTO> list = (List)session.selectList("imsiboard",id);
	  session.close();
	  return list;
  }
  
  public static int myBoardNumber(String id){
	  SqlSession session = sqlMapper.openSession();
	  int res = session.selectOne("myBoardNumber",id);
	  session.close();
	  return res;
  }
  
  public static int myReplyNumber(String id){
	  SqlSession session = sqlMapper.openSession();
	  int res = session.selectOne("myReplyNumber",id);
	  session.close();
	  return res;
  }
  
  public static int addNeighbor(Blog_NeighborDTO neighborDTO){
	  SqlSession session = sqlMapper.openSession();
	  int res = session.insert("addNeighbor", neighborDTO);
	  session.commit();
	  session.close();
	  return res;
  }
  
  public static List<Blog_NeighborDTO> neighborList(String id){
	  SqlSession session = sqlMapper.openSession();
	  List<Blog_NeighborDTO> list = (List)session.selectList("neighborList",id);
	  session.close();
	  return list;
  }
  
  public static List<String> listNeighborProfile(String id){
	  SqlSession session = sqlMapper.openSession();
	  List<String> list = (List)session.selectList("listNeighborProfile",id);
	  session.close();
	  return list;
  }
  
  public static int deleteNeighbor(int neighborno){
	  SqlSession session = sqlMapper.openSession();
	  int res = session.delete("deleteNeighbor", neighborno);
	  session.commit();
	  session.close();
	  return res;
  }
  
  public static int editReply_pf(Blog_BoardReplyDTO dto){
	  SqlSession session = sqlMapper.openSession();
	  int res = session.update("editReply_pf", dto);
	  session.commit();
	  session.close();
	  return res;
  }
  
}