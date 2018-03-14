<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/3/15 0015
 * Time: 00:22
 */

namespace app\api\controller;



use app\api\helper\Response;
use app\common\controller\Api;

class Outting extends Api
{
    protected $noNeedRight = ['*'];
    protected $noNeedLogin='';

    public function outting(){
        if($this->request->isPost()){
            $data=input('','','trim');
            $model=new \app\admin\model\Outting();
            //调用sdk,发送提款信息,成功后保存mysql
            $model->allowField(true)
                ->insert($data);
        }
        $user=$this->auth->getUser();
        //获取对应的绑定默认银行
        $bank=$user->bank;
        $free=$user['money'];
        return Response::success('',['free'=>$free,'bank'=>$bank]);
    }
    public function notify(){
        $data=file_get_contents('php://input');
        //回调,主动查询,在保存进展状态
    }
}