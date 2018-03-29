<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/3/15 0015
 * Time: 00:22
 */

namespace app\api\controller;



use app\api\helper\Response;
use app\api\model\Bank;
use app\api\model\TransferAli;
use app\common\controller\Api;
use think\Db;
use think\Exception;

class Outting extends Api
{
    protected $noNeedRight = ['*'];
    protected $noNeedLogin=['notify'];

    public function outting(){
        $data=input('','','trim');
        $user=$this->auth->getUser();
        $data['money']=intval($data['money'])*100;
        if($data['money']>$user->getData('money')){
            return Response::error('金额不足');
        }
        $bind=Bank::where(['uid'=>$user->id])->find();
        if(empty($bind)){
            return $this->error('请先绑定支付宝');
        }
        $data['uid']=$user->id;
        $data['payed']=0;
        $data['charge']=0;
        $data['name']=$bind->getData('name');
        $data['payee_account']=$bind->payee_account;
        $data['tradeId']=uniqid('out_');
        $model=new \app\admin\model\Outting();
        $model->allowField(true)
            ->save($data);
        $transfer=new TransferAli();
        $r=$transfer->transfer($data);
        if($r===false){
            return Response::error('提款失败,确保帐号正确');
        }
        return Response::success('提款成功,请等待到账');
    }
    public function notify(){
        $data=file_get_contents('php://input');
        //回调,主动查询,在保存进展状态
        $data=json_decode($data,true);
        $tradeid=$data['tradeid'];
        $out=\app\admin\model\Outting::get(['tradeId'=>$tradeid]);
        $user=\app\admin\model\User::get($out->uid);
        $userMoney= $user->getData('money');
        $userMoney-=$data['money'];
        if($userMoney<0){
            $out->payed=-1;
        }else{
            $out->payed=1;
            $out->money=$data['money'];
            $out->readed=0;
            $out->charge= $userMoney;
            $user->money=$userMoney;
        }
        Db::startTrans();
        try{
            $r1=$user->isUpdate(true)
                ->save();
            $r2=$out->isUpdate(true)
                ->save();
            if($r1===false || $r2===false){
                throw new Exception();
            }
            Db::commit();
            return 'success';
        }
       catch (\Exception $e){
            Db::rollback();
       }
       return 'fail';
    }
}