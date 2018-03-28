<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/3/15 0015
 * Time: 00:22
 */

namespace app\api\controller;


use app\api\helper\Response;
use app\api\model\PayAli;
use app\api\model\PayFactory;
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
        $factory=input('payway','ali','trim');
        $user=$this->auth->getUser();
        $data=['money'=>$money*100];
        $data['uid']=$user->id;
        $data['charge']=0;
        $data['payed']=0;
        $data['tradeId']=uniqid('in_');
        $payModel=PayFactory::instance($factory);
        $payData=[
            'amount'=>$data['money'],
            'body'=>'积分兑换',
            'subject'=>'积分兑换',
            'out_trade_no'=>$data['tradeId']
        ];
        $r=$payModel->makeOrder($payData);
        if(empty($r)){
            return Response::error('充值失败,请稍后重试');
        }
        $model=new \app\admin\model\Comming();
        //保存
        $r=$model->allowField(true)
            ->save($data);

//        if($r===false){
//            return Response::error('充值失败,请稍后重试');
//        }
//        return Response::success('充值成功,请等待到账');
    }
    //sdk的回调
    public function notify(){
        //解析,获取交易的id
        //使用id主动查询,返回是支付成功才会写入数据库
        //数据库的金额,依据主动查询返回为准
       $payModel=new PayAli();
       echo $payModel->notify([]);
    }
}