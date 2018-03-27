<?php
/**
 * Created by PhpStorm.
 * User: WX-C
 * Date: 2018/3/15
 * Time: 16:17
 */
namespace app\api\model;

use think\Model;

class Trade extends Model
{
    protected $name='trade';
    protected function getMoneyAttr($value){
        return number_format($value/100,2);
    }
}