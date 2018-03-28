<?php
/**
 * Created by PhpStorm.
 * User: WX-C
 * Date: 2018/3/28
 * Time: 11:01
 */

namespace app\api\Inface;


interface Pay
{
    /**
     * 预约下单
     */
    public function makeOrder($data);
    /**
     * 支付成功后的回调
     */
    public function notify($notify);

}