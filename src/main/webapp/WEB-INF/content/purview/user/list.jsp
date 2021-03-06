<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <title>中翰内网</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="中翰内部管理系统">
    <meta name="author" content="blues">
    <link rel="icon" href="${pageContext.request.contextPath}/common/zhnw/content/index/index/img/logo.jpg">

    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/bootstrap-datetimepicker-master/bootstrap3/bootstrap/css/bootstrap.min.css">

    <!-- 可选的Bootstrap主题文件（一般不用引入） -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/bootstrap-datetimepicker-master/bootstrap3/bootstrap/css/bootstrap-theme.min.css">

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="${pageContext.request.contextPath}/common/bootstrap-datetimepicker-master/bootstrap3/jquery/jquery-1.8.3.min.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="${pageContext.request.contextPath}/common/bootstrap-datetimepicker-master/bootstrap3/bootstrap/js/bootstrap.min.js"></script>


    <script src="${pageContext.request.contextPath}/common/zhnw/content/purview/user/js/bootstrap-select.js"></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/common/zhnw/content/purview/user/css/bootstrap-select.css">

    <script language="javascript" type="text/javascript">
        if (window.self == window.top) {
            window.top.location = "${pageContext.request.contextPath}";
        }
    </script>

    <%-- 分页查询 js 方法  begin --%>
    <script type="text/javascript">
        function shouye(){
            $("#currentPageHidden").val("1");
            $("#pageSizeHidden").val("10");
            $("#pageAction").submit();
        }
        function weiye(){
            $("#pageSizeHidden").val("10");
            if($("#totalPage").val()<=0){
                $("#currentPageHidden").val(1);
            }else{
                $("#currentPageHidden").val($("#totalPage").val());
            }

            $("#pageAction").submit();
        }
        function shangyiye(){
            $("#pageSizeHidden").val("10");
            var dp = parseInt($("#currentPage").val());
            var dps = dp - 1;
            if(dps > parseInt($("#totalPage").val())){
                dps = parseInt($("#totalPage").val());
            }else if(dps < 1){
                dps = 1;
            }
            $("#currentPageHidden").val(dps);
            $("#pageAction").submit();
        }
        function xiayiye(){
            $("#pageSizeHidden").val("10");
            var dp = parseInt($("#currentPage").val());
            var dps = dp + 1;
            if(dps > parseInt($("#totalPage").val())){
                dps = parseInt($("#totalPage").val());
            }else if(dps < 1){
                dps = 1;
            }
            if(dps<=0){
                $("#currentPageHidden").val(1);
            }else{
                $("#currentPageHidden").val(dps);
            }

            $("#pageAction").submit();
        }
        function tiaozhuan(){
            $("#pageSizeHidden").val("10");
            var dp = parseInt($("#currentPage").val());
            var dps = dp - 1;
            if(dps > parseInt($("#totalPage").val())){
                dps = parseInt($("#totalPage").val());
            }else if(dps < 1){
                dps = 1;
            }
            $("#currentPageHidden").val(dps);
            $("#pageAction").submit();
        }
    </script>
    <%-- 分页查询 js 方法  end --%>

    <%-- 添加 方法  begin --%>
    <script>
        function beforeadd(){
            $("#input1").val("");
            $("#input3").val("");
            $("#input6").val("");
            $("#input7").val("");
            $("#input8").val("");
        }

        function savebtn(){
            var name = $.trim($("#input1").val());
            var trueName = $.trim($("#input3").val());
            var email = $.trim($("#input6").val());
            var phone = $.trim($("#input7").val());
            if(name==null||name==''){
                $("#addusernamespan").html("用户名不能为空！");
                $("#addusernamespan").css("display","block");
            }else if(trueName==null||trueName==''){
                $("#addtruenamespan").html("真实姓名不能为空！");
                $("#addtruenamespan").css("display","block");
            }else if(email==null||email==''){
                $("#addemailspan").html("邮箱地址不能为空！");
                $("#addemailspan").css("display","block");
            }else if(phone==null||phone==''){
                $("#addphonespan").html("联系电话不能为空！");
                $("#addphonespan").css("display","block");
            }else{
                $.ajax({
                    url:"${pageContext.request.contextPath}/user/userNameSingleAdd",
                    data:{name:name},
                    dataType:"json",
                    type:"post",
                    success:function(data){
                        if(data){
                            $("#addusernamespan").html("用户名已存在！");
                            $("#addusernamespan").css("display","block");
                        }else{
                            $("#addusernamespan").css("display","none");

                            $("#addIdCurrentPage").val($("#currentPageHidden").val());
                            $("#addIdpageSizes").val($("#pageSizeHidden").val());
                            $("#addIdUserName").val($("#souUserName").val());
                            $("#addIdTrueName").val($("#souTrueName").val());
                            $("#addIdActorName").val($("#souActorName").val());

                            $("#addForm").submit();
                        }
                    }
                });
            }
        }

        function addusernamefocus(){
            $("#addusernamespan").css("display","none");
        }

        function addtruenamefocus(){
            $("#addtruenamespan").css("display","none");
        }

        function addemailfocus(){
            $("#addemailspan").css("display","none");
        }

        function addphonefocus(){
            $("#addphonespan").css("display","none");
        }
    </script>
    <%-- 添加 方法  end --%>

    <%-- 分配角色 begin --%>
    <script>
        function beforeactor(){
            $("#actorIdCurrentPage").val($("#currentPageHidden").val());
            $("#actorIdpageSizes").val($("#pageSizeHidden").val());
            $("#actorIdUserName").val($("#souUserName").val());
            $("#actorIdTrueName").val($("#souTrueName").val());
            $("#actorIdActorName").val($("#souActorName").val());
        }
    </script>
    <%-- 分配角色 end --%>

    <%-- 删除 begin --%>
    <script>
        function delid(id){
            $("#deleteIdInput").val(id);

            $("#deleteIdCurrentPage").val($("#currentPageHidden").val());
            $("#deleteIdpageSizes").val($("#pageSizeHidden").val());
            $("#deleteIdUserName").val($("#souUserName").val());
            $("#deleteIdTrueName").val($("#souTrueName").val());
            $("#deleteIdActorName").val($("#souActorName").val());
        }
        function deleteById(){
            $("#deleteIdFormId").val($("#deleteIdInput").val());
            $("#deleteIdForm").attr("action","${pageContext.request.contextPath}/user/delete");
            $("#deleteIdForm").submit();
        }
    </script>
    <%-- 删除 end --%>

    <%-- 初始化 begin --%>
    <script>
        function chushihua(id){
            $("#hiddenUserIdChushihua").val(id);
        }

        function chushihuasuccess(){
            $.ajax({
                url:"${pageContext.request.contextPath}/user/initialize",
                data:{userId:$("#hiddenUserIdChushihua").val()},
                dataType:"json",
                type:"post",
                success:function(data){

                }
            });
        }
    </script>
    <%-- 初始化 end --%>

    <%-- update begin --%>
    <script>
        function xiugai(id,userName,trueName,email,phone,remark){
            $("#updateId").val(id);
            $("#input101").val(userName);
            $("#input103").val(trueName);
            $("#input106").val(email);
            $("#input107").val(phone);
            $("#input108").val(remark);


        }

        function updatebtn(){
            var name = $.trim($("#input101").val());
            var trueName = $.trim($("#input103").val());
            var email = $.trim($("#input106").val());
            var phone = $.trim($("#input107").val());
            if(name==null||name==''){
                $("#updateusernamespan").html("用户名不能为空！");
                $("#updateusernamespan").css("display","block");
            }else if(trueName==null||trueName==''){
                $("#updatetruenamespan").html("真实姓名不能为空！");
                $("#updatetruenamespan").css("display","block");
            }else if(email==null||email==''){
                $("#updateemailspan").html("邮箱地址不能为空！");
                $("#updateemailspan").css("display","block");
            }else if(phone==null||phone==''){
                $("#updatephonespan").html("联系电话不能为空！");
                $("#updatephonespan").css("display","block");
            }else{
                $.ajax({
                    url:"${pageContext.request.contextPath}/user/userNameSingleUpdate",
                    data:{id:$("#updateId").val(),name:name},
                    dataType:"json",
                    type:"post",
                    success:function(data){
                        if(data){
                            $("#updateusernamespan").html("用户名已存在！");
                            $("#updateusernamespan").css("display","block");
                        }else{
                            $("#updateusernamespan").css("display","none");

                            $("#updateIdCurrentPage").val($("#currentPageHidden").val());
                            $("#updateIdpageSizes").val($("#pageSizeHidden").val());
                            $("#updateIdUserName").val($("#souUserName").val());
                            $("#updateIdTrueName").val($("#souTrueName").val());
                            $("#updateIdActorName").val($("#souActorName").val());

                            $("#updateForm").submit();
                        }
                    }
                });
            }
        }

        function updateusernamefocus(){
            $("#updateusernamespan").css("display","none");
        }

        function updatetruenamefocus(){
            $("#updatetruenamespan").css("display","none");
        }

        function updateemailfocus(){
            $("#updateemailspan").css("display","none");
        }

        function updatephonefocus(){
            $("#updatephonespan").css("display","none");
        }
    </script>
    <%-- update end --%>

    <%-- 下拉框样式 begin --%>
    <script type="text/javascript">
        $(window).on('load', function () {
            $('.selectpicker').selectpicker({
                'selectedText': 'cat'
            });
        });
    </script>
    <%-- 下拉框样式 end --%>
</head>
<body>
<div class="container" style="width: 100%;max-width:95%;height: 100%;padding-top: 30px;">
    <div class="container-fluid" >
        <div class="row-fluid">
            <div class="span12">
                <form id="pageAction" action="${pageContext.request.contextPath}/user" method="post">
                    <div>
                        <button type="button" class="btn btn-success" data-target="#addModel" data-toggle="modal" onclick="beforeadd()">添加用户</button>
                        <button type="button" class="btn btn-success" data-target="#actorModel" data-toggle="modal" onclick="beforeactor()">分配角色</button>
                        用户名：<input type="text" id="souUserName" name="userName" value="${userName}">
                        真实姓名：<input type="text" id="souTrueName" name="trueName" value="${trueName}">
                        角色：<input type="text" id="souActorName" name="actorName" value="${actorName}">
                        <button type="submit" class="btn btn-primary">搜索用户</button>
                    </div>
                    <table class="table">
                        <thead>
                        <tr>
                            <th>用户名</th>
                            <th>真实姓名</th>
                            <th>邮箱</th>
                            <th>联系电话</th>
                            <th>角色</th>
                            <th>状态</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="user" items="${userList}">
                            <tr>
                                <td>${user.userName}</td>
                                <td>${user.trueName}</td>
                                <td>${user.email}</td>
                                <td>${user.phone}</td>
                                <td>${user.actorName}</td>
                                <td>${user.status}</td>
                                <td>
                                    <button type="button" class="btn btn-xs btn-primary" data-toggle="modal" data-target="#updateModel" onclick="xiugai('${user.id}','${user.userName}','${user.trueName}','${user.email}','${user.phone}','${user.remark}')">修改</button>
                                    <button type="button" class="btn btn-xs btn-primary" data-toggle="modal" data-target="#chushihuaModel" onclick="chushihua('${user.id}')">初始化密码</button>
                                    <button type="button" class="btn btn-xs btn-danger" data-toggle="modal" onclick="delid(${user.id})" data-target="#delModel">离职</button>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>

                    <p>
                        <input type="hidden" id="totalCount" value="${totalCount}"  />
                        <input type="hidden" id="totalPage" value="${totalPage}"  />
                        <input type="hidden" id="pageSize" value="${pageSize}"  />
                        <input type="hidden" id="currentPage" value="${currentPage}"  />
                        <input type="hidden" id="currentPageHidden" name="currentPage" value="${currentPage}"  />
                        <input type="hidden" id="pageSizeHidden" name="pageSize" value="${pageSize}"  />

                        <button type="button" class="btn btn-lg btn-default" onclick="shouye()">首页</button>
                        <button type="button" class="btn btn-lg btn-default" onclick="shangyiye()">上一页</button>
                        第<input type="text" onblur="tiaozhuan()" value="${currentPage}" style="width: 30px;height: 40px;">/${totalPage}页
                        <button type="button" class="btn btn-lg btn-default" onclick="xiayiye()">下一页</button>
                        <button type="button" class="btn btn-lg btn-default" onclick="weiye()">尾页</button>
                    </p>
                </form>
                <%-- delete begin --%>
                <div class="modal fade" id="delModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabel">提示框</h4>
                            </div>
                            <div class="modal-body">
                                您确定要删除此记录吗？
                            </div>
                            <input id="deleteIdInput" type="hidden">
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="deleteById()">确定</button>
                            </div>
                            <form style="display: none;" id="deleteIdForm" method="post">
                                <input type="hidden" id="deleteIdFormId" name="id">

                                <input type="hidden" id="deleteIdCurrentPage" name="currentPage" >
                                <input type="hidden" id="deleteIdpageSizes" name="pageSize" >
                                <input type="hidden" id="deleteIdUserName" name="userName" >
                                <input type="hidden" id="deleteIdTrueName" name="trueName" >
                                <input type="hidden" id="deleteIdActorName" name="actorName" >
                            </form>
                        </div>
                    </div>
                </div>
                <%-- delete end --%>

                <%-- add begin --%>
                <div class="modal fade bs-example-modal-lg" id="addModel" tabindex="-1" role="dialog" aria-labelledby="addModalLabel" aria-hidden="true" style="display: none;">
                    <div class="modal-dialog modal-lg" style="width: 90%;">
                        <div class="modal-content" >
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="addModalLabel">添加用户</h4>
                            </div>
                            <div class="modal-body">
                                <form method="post" id="addForm" action="${pageContext.request.contextPath}/user/add">
                                    <input type="hidden" id="addIdCurrentPage" name="currentPage1">
                                    <input type="hidden" id="addIdpageSizes" name="pageSize1" >
                                    <input type="hidden" id="addIdUserName" name="userName1" >
                                    <input type="hidden" id="addIdTrueName" name="trueName1" >
                                    <input type="hidden" id="addIdActorName" name="actorName1" >
                                    <fieldset>
                                        <table style="width: 100%;height: 300px;">
                                            <tr>
                                                <td><label for="input1" class="control-label">用户名</label></td>
                                                <td><div class="col-sm-10">
                                                    <input type="text" class="form-control" id="input1" placeholder="用户名" name="userName" onfocus="addusernamefocus()" required><span id="addusernamespan" style="color: red;display: none;"></span>
                                                </div></td>
                                                <td><label for="input2" class="control-label">密码</label></td>
                                                <td><div class="col-sm-10">
                                                    <input type="text" class="form-control" id="input2" placeholder="密码" name="password" value="123456" readonly/>
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><label for="input3" class=" control-label">真实姓名</label></td>
                                                <td><div class="col-sm-10">
                                                    <input  type="text" class="form-control" id="input3" placeholder="真实姓名" onfocus="addtruenamefocus()" name="trueName"  required/><span id="addtruenamespan" style="color: red;display: none;"></span>
                                                </div></td>
                                                <td><label for="input6" class="control-label">邮箱地址</label></td>
                                                <td><div class="col-sm-10">
                                                    <input type="email" class="form-control" id="input6" placeholder="邮箱地址" name="email" onfocus="addemailfocus()" required ><span id="addemailspan" style="color: red;display: none;"></span>
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><label for="input7" class=" control-label">联系电话</label></td>
                                                <td><div class="col-sm-10">
                                                    <input  type="text" class="form-control" id="input7" placeholder="联系电话" name="phone" onfocus="addphonefocus()" required/><span id="addphonespan" style="color: red;display: none;"></span>
                                                </div></td>
                                                <td>
                                                    <label for="input8" class="control-label">备注</label>
                                                </td>
                                                <td><div class="col-sm-10">
                                                    <input  type="text" class="form-control" id="input8" placeholder="备注" name="remark"  />
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td colspan="4"><input type="button" onclick="savebtn()" class="btn btn-primary" style="height: 50px;width: 92%;" value="保存" /></td>
                                            </tr>
                                        </table>
                                    </fieldset>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                            </div>
                        </div>
                    </div>
                </div>
                <%-- add end --%>

                <%-- update begin --%>
                <div class="modal fade bs-example-modal-lg" id="updateModel" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel" aria-hidden="true" style="display: none;">
                    <div class="modal-dialog modal-lg" style="width: 90%;">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="updateModalLabel">修改用户</h4>
                            </div>
                            <div class="modal-body">
                                <form method="post" id="updateForm" action="${pageContext.request.contextPath}/user/update">
                                    <input type="hidden" id="updateIdCurrentPage" name="currentPage1" >
                                    <input type="hidden" id="updateIdpageSizes" name="pageSize1" >
                                    <input type="hidden" id="updateIdUserName" name="userName1" >
                                    <input type="hidden" id="updateIdTrueName" name="trueName1" >
                                    <input type="hidden" id="updateIdActorName" name="actorName1">

                                    <input type="hidden" id="updateId"  name="id" />
                                    <fieldset>
                                        <table style="width: 100%;height: 300px;">
                                            <tr>
                                                <td><label for="input101" class="control-label">用户名</label></td>
                                                <td><div class="col-sm-10">
                                                    <input type="text" class="form-control" id="input101" placeholder="用户名" name="userName" onfocus="updateusernamefocus()" ><span id="updateusernamespan" style="color: red;display: none;"></span>
                                                </div></td>
                                                <td><label for="input102" class="control-label">密码</label></td>
                                                <td><div class="col-sm-10">
                                                    <input type="text" class="form-control" id="input102" placeholder="密码" name="password" value="" readonly/>
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><label for="input103" class=" control-label">真实姓名</label></td>
                                                <td><div class="col-sm-10">
                                                    <input  type="text" class="form-control" id="input103" placeholder="真实姓名" name="trueName" onfocus="updatetruenamefocus()"/><span id="updatetruenamespan" style="color: red;display: none;"></span>
                                                </div></td>
                                                <td><label for="input106" class="control-label">邮箱地址</label></td>
                                                <td><div class="col-sm-10">
                                                    <input type="email" class="form-control" id="input106" placeholder="邮箱地址" name="email" onfocus="updateemailfocus()" ><span id="updateemailspan" style="color: red;display: none;"></span>
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td><label for="input107" class=" control-label">联系电话</label></td>
                                                <td><div class="col-sm-10">
                                                    <input  type="text" class="form-control" id="input107" placeholder="联系电话" name="phone" onfocus="updatephonefocus()" /><span id="updatephonespan" style="color: red;display: none;"></span>
                                                </div></td>
                                                <td>
                                                    <label for="input108" class="control-label">备注</label>
                                                </td>
                                                <td><div class="col-sm-10">
                                                    <input  type="text" class="form-control" id="input108" placeholder="备注" name="remark" value="${remark}" />
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td colspan="4"><input type="button" onclick="updatebtn()" class="btn btn-primary" style="height: 50px;width: 92%;" value="保存" /></td>
                                            </tr>
                                        </table>
                                    </fieldset>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                            </div>
                        </div>
                    </div>
                </div>
                <%-- update end --%>

                <%-- actor begin --%>
                <div class="modal fade bs-example-modal-lg" id="actorModel" tabindex="-1" role="dialog" aria-labelledby="actorModalLabel" aria-hidden="true" style="display: none;">
                    <div class="modal-dialog modal-lg" style="width: 90%;">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="actorModalLabel">分配角色</h4>
                            </div>
                            <div class="modal-body">
                                <form method="post" id="actorForm" action="${pageContext.request.contextPath}/user/userActor">
                                    <input type="hidden" id="actorIdCurrentPage" name="currentPage1" >
                                    <input type="hidden" id="actorIdpageSizes" name="pageSize1" >
                                    <input type="hidden" id="actorIdUserName" name="userName1" >
                                    <input type="hidden" id="actorIdTrueName" name="trueName1" >
                                    <input type="hidden" id="actorIdActorName" name="actorName1" >
                                    <fieldset>
                                        <table style="width: 100%;height: 300px;">
                                            <tr>
                                                <td><label for="input101" class="control-label">用户名：</label></td>
                                                <td><div class="col-sm-10">
                                                    <select id="userNameSelect" name="userId" class="selectpicker bla bla bli"  data-live-search="true">
                                                        <c:forEach var="user" items="${users}">
                                                            <option value="${user.id}">${user.userName}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div></td>
                                                <td><label for="input102" class="control-label">角色：</label></td>
                                                <td><div class="col-sm-10">
                                                    <select id="actorNameSelect" name="actorId" class="selectpicker bla bla bli"  data-live-search="true">
                                                        <c:forEach var="actor" items="${actors}">
                                                            <option value="${actor.id}">${actor.actorName}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div></td>
                                            </tr>
                                            <tr>
                                                <td colspan="4"><input type="submit" class="btn btn-primary" style="height: 50px;width: 85%;" value="保存" /></td>
                                            </tr>
                                        </table>
                                    </fieldset>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                            </div>
                        </div>
                    </div>
                </div>
                <%-- actor end --%>

                <%-- chushihua begin --%>
                <div class="modal fade" id="chushihuaModel" tabindex="-1" role="dialog" aria-labelledby="chushihuaModalLabel" aria-hidden="true" style="display: none;">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="chushihuaModalLabel">提示框</h4>
                            </div>
                            <div class="modal-body">
                                确定初始化密码为123456？
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="chushihuasuccess()">确定</button>
                                <input type="hidden" id="hiddenUserIdChushihua" />
                            </div>
                        </div>
                    </div>
                </div>
                <%-- chushihua end --%>
            </div>
        </div>
    </div>
</div>
</body>
</html>
