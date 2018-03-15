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
use think\Db;
use think\Exception;

class Comming extends Api
{
    protected $noNeedRight = ['*'];
    protected $noNeedLogin=['notify'];
    //充值
    public function comming(){
        $money=input('money',0,'intval');
        $user=$this->auth->getUser();
        $data=['money'=>$money];
        $data['uid']=$user->id;
        $data['charge']=0;
        $data['payed']=0;
        $model=new \app\admin\model\Comming();
        //保存
        $r=$model->allowField(true)
            ->save($data);
        //调用sdk
        if($r===false){
            return Response::error('充值失败,请稍后重试');
        }
        return Response::success('充值成功,请等待到账');
    }
    //sdk的回调
    public function notify(){
        $data=file_get_contents('php://input');
        //解析,获取交易的id
        //使用id主动查询,返回是支付成功才会写入数据库
        //数据库的金额,依据主动查询返回为准
        $data=json_decode($data,true);
        $traid=$data['tradid'];
        $model=\app\admin\model\Comming::get(['tradeId'=>$traid]);
        if($data['status']==200 && !empty($model)){
            $model->payed=1;
            $model->charge=1;
            $model->money=$data['money'];
            $user=\app\admin\model\User::get($model->uid);
            $user->money=$user->money+$data['money'];
            Db::startTrans();
            try{
                $r1=$user->isUpdate(true)
                    ->save();
                $r2=$model->isUpdate(true)
                    ->save();
                if($r1===false || $r2===false){
                    throw new Exception('更新失败');
                }
                Db::commit();
            }catch (\Exception $e){
                Db::rollback();
            }
            exit('success');
        }
        exit('fail');
    }
}