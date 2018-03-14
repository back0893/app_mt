<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/3/15 0015
 * Time: 00:22
 */

namespace app\api\controller;


use app\common\controller\Api;

class Comming extends Api
{
    protected $noNeedRight = ['*'];
    protected $noNeedLogin='';
    //充值
    public function commin(){
        $data=input('','','trim');
        $model=new \app\admin\model\Comming();
        //保存
        $model->allowField(true)
            ->insert($data);
        //调用sdk
    }
    //sdk的回调
    public function notify(){
        $data=file_get_contents('php://input');
        //解析,获取交易的id
        //使用id主动查询,返回是支付成功才会写入数据库
        $traid=0;
        $model=\app\admin\model\Comming::get($traid);
        $user=$this->auth->getUser();
        $user['money']+=$model['money'];
    }
}