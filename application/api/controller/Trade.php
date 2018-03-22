<?php
/**
 * Created by PhpStorm.
 * User: WX-C
 * Date: 2018/3/15
 * Time: 16:11
 */

namespace app\api\controller;




use app\api\helper\Response;
use app\common\controller\Api;
use Cron\CronExpression;
use think\Db;
use think\Exception;

class Trade extends Api
{
    protected $noNeedLogin='';
    protected $noNeedRight='*';

    //买入
    public function buy(){
        $number=input('number',0,'intval');
        $price=input('price',0,'intval');
        $code=input('code',0,'intval');
        if($number<=0 || $price<=0){
            return Response::error('金额不足');
        }
        $user=$this->auth->getUser();
        $tradeModel=new \app\api\model\Trade();
        $data=[
            'money'=>$number*$price,
            'number'=>$number,
            'price'=>$price,
            'status'=>1,
            'code'=>$code,
            'uid'=>$user->id,
            'createtime'=>time()
        ];
        //检查用户是否有足够的钱
        $money=$user->money-$data['money'];
        if($money<0){
            return Response::error('金额不足');
        }
        $user->money=$money;
        $owner=unserialize($user->owner);
        $owner=empty($owner)?[]:$owner;
        if(key_exists($data['code'],$owner)){
            $product=$owner[$data['code']];
            $total=$product['price']*$product['number']+$data['money'];
            $product['number']+=$number;
            $product['price']=(int)$total/$product['number'];
            $owner[$data['code']]=$product;
        }else{
            $owner[$data['code']]=['number'=>$number,'price'=>$number];
        }
        $user->owner=serialize($owner);
        Db::startTrans();
        try {
            $r1=$user->save();
            $r2=$tradeModel
                ->allowField(true)
                ->save($data);
            if($r1===false || $r2===false){
                throw new Exception('交易失败');
            }
        }catch (\Exception $e){
            Db::rollback();
            return Response::error('交易失败');
        }
        Db::commit();
        return Response::success('购买成功');
    }

    //卖出
    public function sail(){
        $code=input('code',0,'intval');
        $user=$this->auth->getUser();
        $owner=unserialize($user->owner);
        $owner=empty($owner)?[]:$owner;
        if(!key_exists($code,$owner)){
            return Response::error('交易失败');
        }
        $product=$owner[$code];
        if($this->request->isPost()){
            $number=input('number',0,'intval');
            $price=input('price',0,'intval');
            if($number>$product['number']){
                return Response::error('数量不足');
            }
            $total=$number*$price;
            $user->money+=$total;
            $product['number']-=$number;
            if($product['number']==0){
                unset($owner[$code]);
            }else{
                $owner[$code]=$product;
            }
            $user->owner=serialize($owner);
            $tradeModel=new \app\api\model\Trade();
            $data=[
                'money'=>$total,
                'number'=>$number,
                'price'=>$price,
                'status'=>2,
                'code'=>$code,
                'uid'=>$user->id,
            ];
            Db::startTrans();
            try{
                $r1=$tradeModel->allowField(true)
                    ->isUpdate(false)
                    ->save($data);
                $r2=$user->isUpdate(true)
                    ->save();
                if($r1===false || $r2===false){
                    throw new Exception('卖出失败');
                }
            }catch (\Exception $e){
                Db::rollback();
                return Response::error($e->getMessage());
            }
            Db::commit();
            return Response::success('卖出成功');
        }
        $data=['code'=>$code,'number'=>$product['number'],'price'=>$product['price']];
        return Response::success($data);
    }
}