<?php
/**
 * Created by PhpStorm.
 * User: WX-C
 * Date: 2018/3/28
 * Time: 11:00
 */

namespace app\api\model;


use app\api\Inface\Pay;
use function GuzzleHttp\Psr7\parse_query;
use think\Db;

class PayAli implements Pay
{
    private $payRequestBuilder = null;
    private $payResponse = null;
    private $config=[];
    public function __construct(){
        //设置支付宝
        $this->config=[
            'app_id'=>config('ali.app_id'),
            'charset'=>'UTF-8',
            'sign_type'=>'RSA2',
            'gatewayUrl'=>config('ali.gatewayurl'),
            //异步通知地址
            'notify_url' => config('ali.notify'),
            'alipay_public_key' => config('ali.alipay_public_key'),
            'merchant_private_key' => config('ali.merchant_private_key')
        ];
        vendor('alipay.wappay.service.AlipayTradeService');
        vendor('alipay.wappay.buildermodel.AlipayTradeWapPayContentBuilder');
        //生成一个请求主体的者
        $this->payRequestBuilder=new \AlipayTradeWapPayContentBuilder();
        $this->payResponse=new \AlipayTradeService($this->config);
    }
    public function notify($notify)
    {
        $data=input();
        if($data['trade_status']!='TRADE_SUCCESS'){
            return 'fail';
        }
        $traid=$data['out_trade_no'];
        $model=\app\admin\model\Comming::get(['tradeId'=>$traid,'payed'=>0]);
        if(!empty($model)){
            $user=\app\admin\model\User::get($model->uid);
            $model->payed=1;
            $model->charge=$user->getData('money')+$model->getData('money');
            $model->readed=0;
            $user->money=$user->getData('money')+$model->getData('money');
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
            return 'success';
        }
        return 'fail';
    }
    public function makeOrder($data){
        $amount=sprintf('%.2f',$data['amount']/100);
        $this->payRequestBuilder->setBody($data['body']);//商品描述
        $this->payRequestBuilder->setSubject($data['subject']);//订单名称
        $this->payRequestBuilder->setOutTradeNo($data['out_trade_no']);//商户订单号
        $this->payRequestBuilder->setTotalAmount($amount);//付款金额
        $this->payRequestBuilder->setTimeExpress('10m'); //超时时间
        $result=$this->payResponse->wapPay($this->payRequestBuilder,'',$this->config['notify_url']);
        return $result;
    }
}