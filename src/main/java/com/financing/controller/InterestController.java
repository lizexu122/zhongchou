package com.financing.controller;

import com.financing.entity.Interest;
import com.financing.entity.Project;
import com.financing.entity.User;
import com.financing.service.InterestService;
import com.financing.service.ProjectService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class InterestController {
    private static final int SUCCESS_CODE = 1;
    private static final int FAIL_CODE = 0;

    @Autowired
    private InterestService interestService;

    @Autowired
    private ProjectService projectService;

    /**
     * 增加：重复性限制
     * 全局控制：使用USid与PJid
     * @param
     * @return
     */
    @RequestMapping(value = "/doGetInterest")
    @ResponseBody
    public Map<String,Object> doGetInterest(HttpSession session){
        User user = (User) session.getAttribute("user");
        List<Interest> interest = interestService.getInterestByUser(user);

        //获得当前用户的收藏记录并更改展示的图片。
        Map<String, Object> result = new HashMap<>();
        result.put("flag", SUCCESS_CODE);
        result.put("msg", "success");
        result.put("data", interest);
        return result;
    }

    /**
     * 添加/取消收藏
     * @param session
     * @param pid
     * @return
     */
    @RequestMapping(value = "/doAddCancelInterest-{pid}")
    @ResponseBody
    public Map<String,Object> doAddInterest(HttpSession session,@PathVariable("pid") String pid){
        User user = (User) session.getAttribute("user");
        Project project = new Project();
        project.setId(pid);
        Map<String, Object> result = new HashMap<String, Object>();
        //查询是否已有点赞记录
        List<Interest> list = interestService.getInterestByUP(user, project);
        if (list != null && list.size() > 0) {
            interestService.cancelInterest(list.get(0));
            Project p = projectService.getProject(pid);
            p.setPraise(p.getPraise() - 1);
            projectService.updateProject(p);
            //点过了是flag=0
            result.put("flag", FAIL_CODE);
            result.put("msg", "fail");
            result.put("data", "");
        } else {
            Interest interest = new Interest();
            Project p2 = projectService.getProject(pid);
            interest.setUser(user);
            interest.setProject(p2);
            //插入
            interestService.addInterest(interest);
            p2.setPraise(p2.getPraise() + 1);
            projectService.updateProject(p2);
            //没点过赞flag=1
            result.put("flag", SUCCESS_CODE);
            result.put("msg", "success");
            result.put("data", "");
        }
        return result;
    }

}
