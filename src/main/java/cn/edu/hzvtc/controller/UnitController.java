package cn.edu.hzvtc.controller;

import cn.edu.hzvtc.pojo.ReturnMsg;
import cn.edu.hzvtc.pojo.Unit;
import cn.edu.hzvtc.pojo.UnitType;
import cn.edu.hzvtc.pojo.User;
import cn.edu.hzvtc.service.UnitService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.*;
import java.util.ArrayList;
import java.util.List;


@RequestMapping("/unit")
@Controller
public class UnitController {

    @Autowired
    private UnitService unitService;

    @RequestMapping("/unitIndex")
    public String index() {
        return "unit/unitIndex";
    }

    @RequestMapping("/unitType")
    public String unitType() {
        return "unit/unitType";
    }

    @RequestMapping("/unitManager")
    public String unitManager() {
        return "unit/unitManager";
    }

    @RequestMapping("/userManager")
    public String userManager() {
        return "unit/userManager";
    }


    @RequestMapping("/unitTypes")
    @ResponseBody
    public ReturnMsg getUnitTypes(HttpSession session){
        User user = (User)session.getAttribute("loginUser");
        List<UnitType>  unitTypes = unitService.getUnitTypesByAreaId(user.getUserAreaId());
        System.out.println("调试-->控制层地域id:"+user.getUserAreaId());
        Long unitTypeCount = unitService.getCount(user.getUserAreaId());
        return ReturnMsg.success().add("unitTypes",unitTypes).add("unitTypeCount",unitTypeCount);
    }


    @RequestMapping(value = "/unitType", method = RequestMethod.POST)
    @ResponseBody
    public ReturnMsg saveUnitType(@Valid UnitType unitType, BindingResult result, HttpSession session) {
        User loginUser = (User) session.getAttribute("loginUser");
        unitType.setUnitTypeAreaId(loginUser.getUserAreaId());
        if (unitService.addUnitType(unitType)) {
            return ReturnMsg.success();
        }
        return ReturnMsg.fail();
    }


    @RequestMapping("/getUnitType")
    @ResponseBody
    public ReturnMsg getUnitType(@RequestParam(value="id") Integer id){
        UnitType unitType = unitService.getUnitTypeById(id);
        return ReturnMsg.success().add("unitType",unitType);
    }


    @RequestMapping(value = "/unitType/{id}",method = RequestMethod.DELETE)
    @ResponseBody
    public ReturnMsg delUnitTypes(@PathVariable("id") Integer id){
        if(unitService.delUnitType(id)){
            return ReturnMsg.success();
        }
        return ReturnMsg.fail();
    }


    @RequestMapping(value = "/unitType/{id}", method = RequestMethod.PUT)
    @ResponseBody
    public ReturnMsg update(@Valid UnitType unitType, @PathVariable("id") Integer id, HttpSession session) {
        User loginUser = (User) session.getAttribute("loginUser");
        unitType.setUnitTypeAreaId(loginUser.getUserAreaId());
        unitType.setId(id);
        if (unitService.modifyUnitType(unitType)) {
            return ReturnMsg.success();
        }
        return ReturnMsg.fail();
    }


    @RequestMapping(value = "/validName", method = RequestMethod.POST)
    @ResponseBody
    public ReturnMsg validName(@RequestParam(value = "unitTypeName") String unitTypeName, HttpSession session) {
        UnitType unitType = new UnitType();
        unitType.setUnitTypeName(unitTypeName);
        User loginUser = (User) session.getAttribute("loginUser");
        unitType.setUnitTypeAreaId(loginUser.getUserAreaId());
        UnitType unitType1 = unitService.getUnitTypeName(unitType);
        if (unitType1 != null) {
            return ReturnMsg.success().add("unitType", unitType1);
        } else {
            return ReturnMsg.fail().add("fieldErrors", "用户不存在");
        }
    }

    @RequestMapping("/units")
    @ResponseBody
    public ReturnMsg getUnits(@RequestParam(value = "unitTypeId", defaultValue = "0") Integer unitTypeId,
                              @RequestParam(value = "unitName", defaultValue = "") String unitName,
                              @RequestParam(value = "pn", defaultValue = "1") Integer pn,
                              HttpSession session) {
        User user = (User) session.getAttribute("loginUser");
        PageHelper.startPage(pn, 5);
        List<Unit> units = unitService.getUnits(unitTypeId, unitName, user.getUserAreaId());
        PageInfo pageInfo = new PageInfo(units, 5);
        return ReturnMsg.success().add("pageInfo", pageInfo);
    }


    @RequestMapping(value = "/unit", method = RequestMethod.POST)
    @ResponseBody
    public ReturnMsg saveUnit(@Valid Unit unit) {
        System.out.println(unit.toString());
        if (unitService.addUnit(unit)) {
            return ReturnMsg.success();
        }
        return ReturnMsg.fail();
    }

    @RequestMapping(value = "/delUnit/{ids}", method = RequestMethod.DELETE)
    @ResponseBody
    public ReturnMsg delUnit(@PathVariable("ids") String ids) {
        if (unitService.delUnit(ids)) {
            return ReturnMsg.success();
        }
        return ReturnMsg.fail();
    }


    @RequestMapping(value = "/getUnit", method = RequestMethod.GET)
    @ResponseBody
    public ReturnMsg getAreaAdmin(@RequestParam(value = "id") Integer id) {
        Unit unit = unitService.getUnit(id);
        if (unit != null) {
            return ReturnMsg.success().add("unit", unit);
        }
        return ReturnMsg.fail();
    }


    @RequestMapping(value = "/unit/{id}", method = RequestMethod.PUT)
    @ResponseBody
    public ReturnMsg update(@PathVariable("id") Integer id,
                            @RequestParam(value = "unitTypeIdOld") Integer unitTypeIdOld,
                            @Valid Unit unit) {
        if (unit.getUnitTypeId() == null) {
            unit.setUnitTypeId(unitTypeIdOld);
        }
        if (unitService.modifyUnit(unit)) {
            return ReturnMsg.success();
        }
        return ReturnMsg.fail();
    }


    @RequestMapping(value = "/fileImport")
    @ResponseBody
    public ReturnMsg fileImport(@RequestParam("unitFile") MultipartFile multipartFile,
                                HttpSession session) {
        String originalFilename = multipartFile.getOriginalFilename();
        String[] filename = new String[0];
        if (originalFilename != null) {
            /*截取后缀名*/
            filename = originalFilename.split("\\.");
        }
        if (!"csv".equals(filename[filename.length - 1])) {
            return ReturnMsg.fail().add("msg", "文件类型不正确");
        }
        File file = new File(session.getServletContext().getRealPath("/upload/") + originalFilename);
        try {
            multipartFile.transferTo(file);
            List<Unit> units = new ArrayList<>();
            DataInputStream in = new DataInputStream(new FileInputStream(file));
            BufferedReader br = new BufferedReader(new InputStreamReader(in, "UTF-8"));
            String line = "";
            while ((line = br.readLine()) != null) {
                System.out.println(line);
                String[] str = line.split(",");
                Unit unit = new Unit();
                try {
                    unit.setUnitName(str[0]);
                    unit.setUnitTypeId(Integer.parseInt(str[1]));
                    unit.setUnitSortNum(Integer.parseInt(str[2]));
                } catch (Exception e) {
                    return ReturnMsg.fail().add("msg", "数据有误！");
                }
                units.add(unit);
            }
            in.close();
            br.close();
            for (Unit u : units) {
                unitService.addUnit(u);
            }
            return ReturnMsg.success();
        } catch (IOException e) {
            e.printStackTrace();
            return ReturnMsg.fail().add("msg", "出错了！");
        }
    }
}
