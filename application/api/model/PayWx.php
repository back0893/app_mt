<?php
/**
 * Created by PhpStorm.
 * User: WX-C
 * Date: 2018/3/28
 * Time: 16:10
 */

namespace app\api\model;


use app\api\Inface\Pay;
use think\Request;

class PayWx implements Pay
{
    private function _weixin_config(){//微信支付公共配置函数
        define('WXPAY_APPID', "wx14fbe72d03b000fb");//微信公众号APPID
        define('WXPAY_MCHID', "1491261032");//微信商户号MCHID
        define('WXPAY_KEY', "59f93ed99b1c259f93ed99b204dw51d2");//微信商户自定义32位KEY
        define('WXPAY_APPSECRET', "00cf15ec61ae300f1a04ee3beca1f95e");//微信公众号appsecret
        //证书路劲的配置
        $vendor_url = VENDOR_PATH;
        define('SSLCERT_PATH', "wxpay/apiclient_cert.pem");//微信公众号appsecret
        define('SSLKEY_PATH', "wxpay/apiclient_key.pem");//微信公众号appsecret
        vendor('wxpay.WxPay_Data');
        vendor('wxpay.WxPay_Api');
    }

    public function makeOrder($data)
    {
        $this->_weixin_config();
        $request=Request::instance();
        $scene_info=[
            'h5_info'=>[
                'type'=>'Wap',
                'wap_url'=>$request->domain(),
                'wap_name'=>config('webName')
            ]
        ];
        //②、统一下单
        $input = new \WxPayUnifiedOrder();
        $input->SetBody($data['body']);
        $input->SetOut_trade_no($data['out_trade_no']);
        $input->SetTotal_fee($data['amount']);
        $input->SetTrade_type('MWEB');
        $input->SetTime_start(date('YmdHis'));
        $input->SetNotify_url(config('wx.notify'));
        $input->SetScene_info($scene_info);
        $WxPayApi = new \WxPayApi();

        $order = $WxPayApi->unifiedOrder($input);
        if($order['return_code'] == 'SUCCESS' && $order['result_code']=='SUCCESS'){
            echo  $order['mweb_url'];
            return 1;
        }
        return false;
    }

    public function notify($notify)
    {

    }
}