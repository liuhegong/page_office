﻿<%@ page language="java"
	import="java.util.*,com.zhuozhengsoft.pageoffice.*,com.zhuozhengsoft.pageoffice.excelwriter.*"
	pageEncoding="UTF-8"%>
<%
	//******************************卓正PageOffice组件的使用*******************************
	PageOfficeCtrl poCtrl1 = new PageOfficeCtrl(request);
	//此行必须，设置PageOffice服务器地址
	poCtrl1.setServerPage(request.getContextPath() + "/poserver.zz"); 

	//添加自定义按钮
	poCtrl1.addCustomToolButton("保存", "Save", 1);
	poCtrl1.addCustomToolButton("签字", "AddHandSign()", 3);
	poCtrl1.addCustomToolButton("删除签字", "DeleteHandSign()", 21);
	poCtrl1.addCustomToolButton("验证印章", "VerifySeal()", 5);
	poCtrl1.addCustomToolButton("修改密码", "ChangePsw()", 0);
	//设置保存页面
	poCtrl1.setSaveFilePage("SaveFile.jsp");
	poCtrl1.webOpen("test.xls", OpenModeType.xlsNormalEdit,"李志");//参数"李志"为您开发项目的登录用户名。
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

	<head>
		<title>1.常规签字。</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">

	</head>

	<body>
		<div style="font-size: 12px; line-height: 20px; border-bottom: dotted 1px #ccc; border-top: dotted 1px #ccc; padding: 5px;">
			<span style="color: red;">操作说明：</span>点“签字”按钮即可，插入印章时的用户名为：李志，密码默认为：111111。
			<br /> 关键代码：点右键，选择“查看源文件”，看js函数
			<span style="background-color: Yellow;"> AddHandSign()</span>			
		</div>
		<br />
			<script type="text/javascript">
				function Save() {
					document.getElementById("PageOfficeCtrl1").WebSave();
					document.getElementById("PageOfficeCtrl1").Alert("文件保存成功。");
				}

				function AddHandSign() {
					document.getElementById("PageOfficeCtrl1").ZoomSeal.AddHandSign();
				}

				function DeleteHandSign(){
					var iCount = document.getElementById("PageOfficeCtrl1").ZoomSeal.Count;//获取当前文档中加盖的印章数量
					if(iCount > 0){
						document.getElementById("PageOfficeCtrl1").ZoomSeal.Item(iCount-1).DeleteSeal();//删除最后一个印章，Item 参数下标从 0 开始
						alert("成功删除了最新的签字。");
					}else{
						alert("请先在文档中签字后，再执行删除操作。");
					}
				}
				
				
				function VerifySeal() {
					document.getElementById("PageOfficeCtrl1").ZoomSeal.VerifySeal();
				}

				function ChangePsw() {
					document.getElementById("PageOfficeCtrl1").ZoomSeal.ShowSettingsBox();
				}
			</script>
			<div style="width: auto; height: 750px;">
			    <%=poCtrl1.getHtmlCode("PageOfficeCtrl1")%>
		    </div>
	</body>

</html>