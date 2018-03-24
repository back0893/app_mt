<?php
/**
 * Created by PhpStorm.
 * User: WX-C
 * Date: 2018/3/24
 * Time: 14:08
 */

namespace app\api\model;


use think\Model;

class SharesDetail extends Model
{
    protected $name='shares_detail';
    protected $autoWriteTimestamp=true;
    protected $dateFormat='Ymd';
    protected $insert='date';
    protected $update=false;
    public function getDataAttr($value){
        return json_decode($value);
    }
    public function setDataAttr($value,$data){
        //在写入的是把涨跌计算了
        $yesterday=$data['yesterday'];
        $tmp=[];
        foreach ($value as $v){
            list($date,$price,$number)=explode(chr(32),$v);
            $updown=number_format($yesterday-$price,2);
            $updownB=number_format(($updown/$yesterday)/100,2);
            $tmp[$date]=[$price,$number,$updown,$updownB];
        }
        return json_encode($tmp);
    }
}