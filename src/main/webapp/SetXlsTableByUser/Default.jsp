<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
     <title>登录页面</title>
</head>
<body>
    <form id="form1"  action="SetDataRegionByUserName.jsp" method="post"> 
    <div style=" text-align:center;">
    <div>请选择登录用户：</div><br />
    <select name="userName">
        <option selected="selected" value="zhangsan">A部门经理</option>
        <option  value="lisi">B部门经理</option>
    </select><br /><br />
    <input type="submit"  value="打开文件" /><br /><br />
    <div style=" color:Red;">不同的用户登录后，在文档中可以编辑的单元格区域不同</div>
    </div>
    </form>
</body>

</html>