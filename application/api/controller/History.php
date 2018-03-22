<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/3/14 0014
 * Time: 23:15
 */

namespace app\api\controller;


use app\admin\model\Outting;
use app\api\helper\Response;
use app\common\controller\Api;
use app\common\model\Trade;

class History extends Api
{
    protected $noNeedRight = ['*'];
    protected $noNeedLogin='';
    public function index(){
        $user=$this->auth->getUser();
        //计算当前用户持有金额,和出金
        $owner=unserialize($user['owner']);
        $ownerMoney=0;
        $code=config('code');
        $owner=empty($owner)?[]:$owner;
        foreach ($owner as $c=>$o){
            $ownerMoney+=$o['number']*$o['price'];
            $o['name']=$code[$c];
            $o['money']=number_format($o['number']*$o['price']/100,2);
        }
        $free=number_format($user['money']/100,2);
        $totalMoney=number_format(($user['money']+$ownerMoney)/100,2);
        //总出金
        $totalOut=Outting::where(['uid'=>$user['id']])
            ->count('money');
        $totalOut=number_format($totalOut/100,2);
        //交易订单
        $date=input('date','week');
        $model=new Trade();
        $history=$model->history($date,$this->auth->id);
        return $this->success('成功',['history'=>$history,'totalMoney'=>$totalMoney,'totalOut'=>$totalOut, 'free'=>$free]);
    }
    public function own(){
        $user=$this->auth->getUser();
        $owner=unserialize($user['owner']);
        $code=config('code');
        $owner=empty($owner)?[]:$owner;
        foreach ($owner as $k=>&$o){
            $o['name']=$code[$k];
            $o['money']=$o['number']*$o['price'];
        }
        return Response::success('成功',['own'=>$owner]);
    }
}