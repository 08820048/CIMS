package cn.edu.hzvtc.pojo;

import java.util.HashMap;
import java.util.Map;

/**
 * 用于标识异步请求的操作结果
 */
public class ReturnMsg {
    private Integer code;           //状态码，用于标识操作的状态，100-成功 200-失败 300-数据不存在
    private String msg;             //提示消息
    private String target;          //目标地址


    //用于存放请求处理结果的数据
    private Map<String,Object> extend = new HashMap<String, Object>();

    public static ReturnMsg success(){
        ReturnMsg result = new ReturnMsg();
        result.setCode(100);
        result.setMsg("操作成功！");

        return result;
    }

    public static ReturnMsg fail(){
        ReturnMsg result = new ReturnMsg();
        result.setCode(200);
        result.setMsg("操作失败！");

        return result;
    }

    public ReturnMsg add(String key,Object value){
        this.getExtend().put(key,value);
        return this;
    }


    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getExtend() {
        return extend;
    }

    public void setExtend(Map<String, Object> extend) {
        this.extend = extend;
    }

    public String getTarget() {
        return target;
    }

    public void setTarget(String target) {
        this.target = target;
    }
}