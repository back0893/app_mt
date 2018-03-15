<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/3/15 0015
 * Time: 00:15
 */
namespace app\api\helper;

class Response
{
    static public function success($msg=null,$data=[]){
        $msg=empty($msg)?'成功':$msg;
        $data['code']=1;
        $data['msg']=$msg;
        return json($data,200,['Access-Control-Allow-Origin'=>'*']);
    }
    static public function error($msg=null,$data=[]){
        $msg=empty($msg)?'失败':$msg;
        $data['code']=0;
        $data['msg']=$msg;
        return json($data,200,['Access-Control-Allow-Origin'=>'*']);
    }
}