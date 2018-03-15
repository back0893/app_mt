<?php
/**
 * Created by PhpStorm.
 * User: WX-C
 * Date: 2018/3/15
 * Time: 16:11
 */

namespace app\api\controller;




use app\common\controller\Api;
use function fast\e;
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
            return '';
        }
        $user=$this->auth->getUser();
        $tradeModel=new \app\api\model\Trade();
        $data=[
            'money'=>$number*$price,
            'number'=>$number,
            'price'=>$price,
            'status'=>1,
            'code'=>$code,
            'uid'=>$user->uid,
        ];
        //检查用户是否有足够的钱
        $free=$user->free-$data['money'];
        if($free<0){
            return 'no money';
        }
        $user->free=$free;
        $owner=unserialize($user->owner);
        if(key_exists($data['code'],$owner)){
            $total=$owner['code']*$owner['number'];
            $owner['code']['number']+=$number;
            $owner['code']['price']=(int)$total/$owner['code']['number'];
        }else{
            $owner[$data['code']]=['number'=>$number,'price'=>$number];
        }
        $user->owner=serialize($owner);
        Db::startTrans();
        try {
            $r1=$user->save();
            $r2=$tradeModel->isUpdate(false)
                ->allowField(true)
                ->save($data);
            if($r1===false || $r2===false){
                throw new Exception('插入失败');
            }
        }catch (\Exception $e){
            Db::rollback();
            return '';
        }
        Db::commit();
        return '';
    }

    //卖出
    public function sail(){
        $code=input('code',0,'intval');
        $user=$this->auth->getUser();
        $owner=unserialize($user->owner);
        if(!key_exists($code,$owner)){
            return '';
        }
        $product=$owner[$code];
        if($this->request->isPost()){
            $number=input('number',0,'intval');
            $price=input('price',0,'intval');
            if($number>$product['number']){
                return '';
            }
            $total=$number*$price;
            $user->free+=$total;
            $product['number']-=$number;
            if($product['number']!=0){
                unset($owner[$code]);
            }else{
                $owner[$code]=$product;
            }
            $tradeModel=new \app\api\model\Trade();
            $data=[
                'money'=>$total,
                'number'=>$number,
                'price'=>$price,
                'status'=>2,
                'code'=>$code,
                'uid'=>$user->uid,
            ];
            Db::startTrans();
            try{
                $r1=$tradeModel->allowField(true)
                    ->isUpdate(false)
                    ->save($data);
                $r2=$user->save();
                if($r1===false || $r2===false){
                    throw new Exception('卖出失败');
                }
            }catch (\Exception $e){
                Db::rollback();
                return '';
            }
            Db::commit();
            return '';
        }
        $data=['code'=>$code,'number'=>$product['number'],'price'=>$product['price']];
        return '';
    }
}