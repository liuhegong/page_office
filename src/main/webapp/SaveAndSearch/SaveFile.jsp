<%@ page language="java" import="java.util.*,com.zhuozhengsoft.pageoffice.*,javax.servlet.*,javax.servlet.http.*,java.sql.*" pageEncoding="utf-8"%>
<%
FileSaver fs=new FileSaver(request,response);
fs.saveToFile(request.getSession().getServletContext().getRealPath("SaveAndSearch/doc/")+"/"+fs.getFileName());
fs.setCustomSaveResult("ok");
String strDocumentText = fs.getDocumentText(); 
//更新数据库中文档的文本内容
int  id=Integer.parseInt(request.getParameter("id"));
Class.forName("org.sqlite.JDBC");
String strUrl = "jdbc:sqlite:"
			+ this.getServletContext().getRealPath("demodata/") + "\\SaveAndSearch.db";
Connection conn = DriverManager.getConnection(strUrl);
Statement stmt = conn.createStatement();
String strsql="update word set Content='"+strDocumentText+"' where id="+id;
stmt.executeUpdate(strsql);
stmt.close();
conn.close();
fs.close();
%>

