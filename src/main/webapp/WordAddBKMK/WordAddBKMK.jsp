<%@ page language="java"
	import="java.util.*,com.zhuozhengsoft.pageoffice.*,com.zhuozhengsoft.pageoffice.wordwriter.*"
	pageEncoding="utf-8"%>

<%
//******************************卓正PageOffice组件的使用*******************************
	PageOfficeCtrl poCtrl1 = new PageOfficeCtrl(request);
	poCtrl1.setServerPage(request.getContextPath()+"/poserver.zz"); //此行必须
	//隐藏菜单栏
	poCtrl1.setMenubar(false);
	//添加自定义按钮
	poCtrl1.addCustomToolButton("插入书签","addBookMark",5);
	poCtrl1.addCustomToolButton("删除书签","delBookMark",5);

	poCtrl1.webOpen("doc/template.doc", OpenModeType.docNormalEdit, "张三");

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>在word当前光标处插入书签</title>

</head>
<body>
    <form id="form1">
    <div style=" font-size:small; color:Red;">
        <label>关键代码：点右键，选择“查看源文件”，看js函数：</label>
        <label>function  addBookMark() 和 function delBookMark()</label>
        <br/>
    <label>插入书签时，请先输入要插入的书签名称和文本；删除书签时，请先输入相应的书签名称！</label><br />
        <label>书签名称：</label><input id="txtBkName" type="text" value="test" />
        &nbsp;&nbsp;<label>书签文本：</label><input id="txtBkText" type="text" value="[测试]" />
    </div>
    <input id="Button1" type="button" onclick="addBookMark();" value="插入书签" />
    <input id="Button2" type="button" onclick="delBookMark()" value="删除书签" />
    <div style=" width:auto; height:700px;">
          <%=poCtrl1.getHtmlCode("PageOfficeCtrl1")%>
    </div>
    </form>
   <script type="text/javascript">
        //        var range;
        //    function  addBookMark()
        //    {
        //        var obj = document.getElementById("PageOfficeCtrl1").Document;
        //        var bkName = document.getElementById("txtBkName").value;
        //        var bkText = document.getElementById("txtBkText").value;
        //        range = obj.Application.Selection.Range;
        //        range.Text = bkText;
        //        obj.Bookmarks.Add(bkName,  range);
        //        obj.Bookmarks(bkName).Select();
        //    }
        //    function delBookMark()
        //    {
        //        var bkName = document.getElementById("txtBkName").value;
        //        var obj = document.getElementById("PageOfficeCtrl1").Document;
        //        range = obj.Application.Selection.Range;
        //        if(obj.Bookmarks.Exists(bkName)){
        //            obj.Bookmarks(bkName).Select();
        //            obj.Application.Selection.Range.Text = "";
        //        }
        //
        //    }

        var bkName = document.getElementById("txtBkName").value;
        var bkText = document.getElementById("txtBkText").value;


        function addBookMark() {
	    bkName = document.getElementById("txtBkName").value;
            bkText = document.getElementById("txtBkText").value;

            var mac = "Function myfunc()" + " \r\n"
                    + "Dim r As Range " + " \r\n"
                    + "Set r = Application.Selection.Range " + " \r\n"
                    + "r.Text = \"" + bkText + "\"" + " \r\n"
                    + "Application.ActiveDocument.Bookmarks.Add Name:=\"" + bkName + "\", Range:=r " + " \r\n"
                    + "Application.ActiveDocument.Bookmarks(\"" + bkName + "\").Select " + " \r\n"
                    + "End Function " + " \r\n";
            document.getElementById("PageOfficeCtrl1").RunMacro("myfunc", mac);
        }
        function delBookMark() {
            var mac = "Function myfunc()" + " \r\n"
                    + "If  Application.ActiveDocument.Bookmarks.Exists(\"" + bkName + "\") Then " + " \r\n"
                    + "    Application.ActiveDocument.Bookmarks(\"" + bkName + "\").Select " + " \r\n"
                    + "    Application.Selection.Range.Text = \"\" " + " \r\n"
                    + "End If " + " \r\n"
                    + "End Function " + " \r\n";
            document.getElementById("PageOfficeCtrl1").RunMacro("myfunc", mac);
        }
    </script>
</body>
</html>