<?php
/**
 * Created by PhpStorm.
 * User: WX-C
 * Date: 2018/3/24
 * Time: 14:08
 */

namespace app\common\model;


use think\Model;

class SharesDetail extends Model
{
    protected $name='shares_detail';
    public function getDataAttr($value){
        return json_decode($value,true);
    }
    public function setDataAttr($value){
        return json_encode($value);
    }
}