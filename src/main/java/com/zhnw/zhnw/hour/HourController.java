package com.zhnw.zhnw.hour;

import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import com.zhnw.util.DateUtil;
import com.zhnw.zhnw.project.project.Project;
import com.zhnw.zhnw.purview.user.User;

import java.text.ParseException;

/**
 * Created by guoyibin on 15/5/4.
 *
 * 工时管理
 */
public class HourController extends Controller {

    /**
     * 项目
     * */
    public void project(){
        User user = getSessionAttr("zhnw_loginUser");

        String currentPage = getPara("currentPage");
        String  pageSize = getPara("pageSize");
        String  selectClientSouName = getPara("selectClientSouName");
        String  selectBTypeSouName = getPara("selectBTypeSouName");
        String  selectContractSouName = getPara("selectContractSouName");

        if (currentPage == null) currentPage = "1";
        if (pageSize == null) pageSize = "10";

        Page<Project> projectPage  = Project.me.paginate(currentPage, pageSize, selectClientSouName, selectBTypeSouName, selectContractSouName, user);

        setAttr("projectList",projectPage.getList());
        setAttr("totalCount",projectPage.getTotalRow());
        setAttr("totalPage",projectPage.getTotalPage());
        setAttr("pageSize",projectPage.getPageSize());
        setAttr("currentPage",projectPage.getPageNumber());

        setAttr("selectClientSouName",selectClientSouName);
        setAttr("selectBTypeSouName",selectBTypeSouName);
        setAttr("selectContractSouName",selectContractSouName);

        renderJsp("/WEB-INF/content/hour/project.jsp");
    }


    /**
     * 工时管理主页
     * */
    public void index(){
        String  projectId = getPara("projectId");

        String currentPage = getPara("currentPage");
        String  pageSize = getPara("pageSize");

        String  name = getPara("name");



        if (currentPage == null||currentPage.trim().length()==0) currentPage = "1";
        if (pageSize == null||pageSize.trim().length()==0) pageSize = "10";

        Page<Hour> hourPage  = Hour.me.paginate(currentPage, pageSize, projectId, name);

        setAttr("hourList",hourPage.getList());

        setAttr("totalCount",hourPage.getTotalRow());
        setAttr("totalPage",hourPage.getTotalPage());
        setAttr("pageSize",hourPage.getPageSize());
        setAttr("currentPage",hourPage.getPageNumber());

        setAttr("projectId",projectId);
        setAttr("name",name);

        renderJsp("/WEB-INF/content/hour/hour.jsp");
    }

    /**
     * 添加
     * */
    public void add() throws ParseException {
        User user0 = getSessionAttr("zhnw_loginUser");

        String  projectId = getPara("projectId");

        String  dates = getPara("dates");
        String  name = getPara("name");
        String  begin = getPara("begin");
        String  end = getPara("end");
        String  detail = getPara("detail");


        User user = User.me.findById(name);
        Project project = Project.me.findById(projectId);
        Long contactId = project.get("contactId");
        User checkMan = User.me.findById(contactId);
        DateUtil dateUtil = new DateUtil();
        new Hour()
                .set("dates", dates)
                .set("name", user.get("trueName"))
                .set("detail", detail)
                .set("begin", begin)
                .set("end", end)
                .set("hour", dateUtil.getChaTime(end,begin))
                .set("checkName", checkMan.get("trueName"))
                .set("success", "否")
                .set("projectId", projectId)
                .set("checkId", contactId)
                .set("nameId", name)
                .set("zhId", user0.get("zhId"))
                .save();



        String currentPage = getPara("currentPage");
        String  pageSize = getPara("pageSize");

        String  name0 = getPara("name0");



        if (currentPage == null||currentPage.trim().length()==0) currentPage = "1";
        if (pageSize == null||pageSize.trim().length()==0) pageSize = "10";

        Page<Hour> hourPage  = Hour.me.paginate(currentPage, pageSize, projectId, name0);

        setAttr("hourList",hourPage.getList());

        setAttr("totalCount",hourPage.getTotalRow());
        setAttr("totalPage",hourPage.getTotalPage());
        setAttr("pageSize",hourPage.getPageSize());
        setAttr("currentPage",hourPage.getPageNumber());

        setAttr("projectId",projectId);
        setAttr("name",name0);

        renderJsp("/WEB-INF/content/hour/hour.jsp");
    }

    /**
     * 删除
     * */
    public void delete(){
        String id = getPara("id");
        Hour.me.deleteById(id);

        String  projectId = getPara("projectId");

        String currentPage = getPara("currentPage");
        String  pageSize = getPara("pageSize");

        String  name = getPara("name");



        if (currentPage == null||currentPage.trim().length()==0) currentPage = "1";
        if (pageSize == null||pageSize.trim().length()==0) pageSize = "10";

        Page<Hour> hourPage  = Hour.me.paginate(currentPage, pageSize, projectId, name);

        setAttr("hourList",hourPage.getList());

        setAttr("totalCount",hourPage.getTotalRow());
        setAttr("totalPage",hourPage.getTotalPage());
        setAttr("pageSize",hourPage.getPageSize());
        setAttr("currentPage",hourPage.getPageNumber());

        setAttr("projectId",projectId);
        setAttr("name",name);

        renderJsp("/WEB-INF/content/hour/hour.jsp");
    }

    /**
     * 更新
     * */
    public void update() throws ParseException {
        String  projectId = getPara("projectId");
        String  id = getPara("id");

        String  dates = getPara("dates");
        String  name = getPara("name");
        String  begin = getPara("begin");
        String  end = getPara("end");
        String  detail = getPara("detail");


        User user = User.me.findById(name);
        Project project = Project.me.findById(projectId);
        Long contactId = project.get("contactId");
        User checkMan = User.me.findById(contactId);
        DateUtil dateUtil = new DateUtil();
        new Hour()
                .set("id", id)
                .set("dates", dates)
                .set("name", user.get("trueName"))
                .set("detail", detail)
                .set("begin", begin)
                .set("end", end)
                .set("hour", dateUtil.getChaTime(end,begin))
                .set("nameId", name)
                .update();


        String currentPage = getPara("currentPage");
        String  pageSize = getPara("pageSize");

        String  name0 = getPara("name0");



        if (currentPage == null||currentPage.trim().length()==0) currentPage = "1";
        if (pageSize == null||pageSize.trim().length()==0) pageSize = "10";

        Page<Hour> hourPage  = Hour.me.paginate(currentPage, pageSize, projectId, name0);

        setAttr("hourList",hourPage.getList());

        setAttr("totalCount",hourPage.getTotalRow());
        setAttr("totalPage",hourPage.getTotalPage());
        setAttr("pageSize",hourPage.getPageSize());
        setAttr("currentPage",hourPage.getPageNumber());

        setAttr("projectId",projectId);
        setAttr("name",name0);

        renderJsp("/WEB-INF/content/hour/hour.jsp");
    }
}
