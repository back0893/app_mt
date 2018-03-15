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

class Outting extends Api
{
    protected $noNeedRight = ['*'];
    protected $noNeedLogin=['notify'];

    public function outting(){
        if($this->request->isPost()){
            $data=input('','','trim');
            $user=$this->auth->getUser();
            if($data['money']>$user->money){
                return Response::error('金额不足');
            }
            $data['uid']=$user->id;
            $data['payed']=0;
            $data['charge']=0;
            $model=new \app\admin\model\Outting();
            //调用sdk,发送提款信息,成功后保存mysql
            $r=$model->allowField(true)
                ->save($data);
            if($r===false){
                return Response::error('提款失败');
            }
            return Response::success('提款成功,请等待到账');
        }
        $user=$this->auth->getUser();
        //获取对应的绑定默认银行
        $bank=$user->bank;
        $free=$user['money'];
        //这里前台的银行最好使用纯js插件实现
        return Response::success('',['free'=>$free,'bank'=>$bank]);
    }
    public function notify(){
        $data=file_get_contents('php://input');
        //回调,主动查询,在保存进展状态
        $data=json_decode($data,true);
        $tradeid=$data['tradeid'];
        $out=\app\admin\model\Outting::get(['tradeId'=>$tradeid]);
        $user=\app\admin\model\User::get($out->uid);
        $user->money-=$data['money'];
        $out->money=$data['money'];
        $out->payed=1;
        $out->charge=1;
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