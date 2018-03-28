<?php
/**
 * Created by PhpStorm.
 * User: WX-C
 * Date: 2018/3/28
 * Time: 17:30
 */

namespace app\api\model;


use app\admin\model\Outting;
use app\admin\model\User;
use app\api\Inface\Iout;

class TransferAli implements Iout
{
    protected $client;
    protected $request;
    public function __construct()
    {
        vendor('alipay.aop.AopClient');
        vendor('alipay.aop.request.AlipayFundTransToaccountTransferRequest');
        $this->client=new \AopClient();
        $c=$this->client;
        $c->gatewayUrl=config('ali.gatewayurl');
        $c->appId=config('ali.app_id');
        $c->format='json';
        $c->postCharset='utf-8';
        $c->signType='RSA2';
        $c->apiVersion='1.0';
        $c->rsaPrivateKey=config('ali.merchant_private_key');
        $c->alipayrsaPublicKey=config('ali.alipay_public_key');
        $request=new \AlipayFundTransToaccountTransferRequest();
        $this->request=$request;
    }
    public function transfer($data)
    {
        $postData=[
            'out_biz_no'=>$data['tradeId'],
            'payee_type'=>'ALIPAY_LOGONID',
            'payee_account'=>$data['payee_account'],
//            'payee_real_name'=>$data['name'],
            'remark'=>'转账备注',
            'amount'=>sprintf('%.2f',$data['money']/100),
            'payer_show_name'=>'退款'
        ];
        $this->request->setBizContent(json_encode($postData,JSON_UNESCAPED_UNICODE));
        $result=$this->client->execute($this->request);
        $responseNode=str_replace('.','_',$this->request->getApiMethodName().'_response');
        $resultCode=$result->$responseNode->code;
        $o=Outting::where(['tradeId'=>$data['tradeId']])
            ->find();
        if(!empty($resultCode)&& $resultCode==10000){
            $u=User::where(['id'=>$o->uid])
                ->find();
            $o->readed=0;
            $o->payed=1;
            $o->charge=$u->getData('money')-$data['money'];
            $u->money=$u->getData('money')-$data['money'];
            $o->save();
            $u->save();
            return true;
        }else{
            $o->payed=-1;
            $o->save();
        }

        return false;
    }
}