<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/3/23 0023
 * Time: 23:07
 */

namespace app\api\validate;


use think\Validate;

class Bank extends Validate
{
    protected $scene=[
        'ali'=>'payee_account'
    ];
    protected $rule=[
        'payee_account'=>'require|telOrEmail'
    ];
    protected $message=[
        'payee_account.payee_account'=>'支付宝账户必填',
        'payee_account.telOrEmail'=>'请填写正确的帐号'
    ];
    protected function telOrEmail($value){
        $r1=filter_var($value,FILTER_VALIDATE_EMAIL);
        $r2=preg_match('/^[1][0-9]{10}$/',$value);
        return($r1||$r2);
    }
}