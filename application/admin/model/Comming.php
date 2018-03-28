<?php

namespace app\admin\model;

use app\admin\iface\IFormat;
use think\Model;
use think\Request;

class Comming extends Model implements IFormat
{
    // 表名
    protected $name = 'comming';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = true;
    protected $dateFormat='Y-m-d H:i:s';
    // 定义时间戳字段名
    protected $createTime = 'date';
    protected $updateTime = false;
    
    // 追加属性
    protected $append = [
    ];
    protected function getMoneyAttr($value){
        return $value/100;
    }
    protected function getChargeAttr($value){
        return $value/100;
    }
    protected function getPayedAttr($value){
        if($value==-1){
            return '失败';
        }
        return $value?'成功':'处理中';
    }
    public function getFormatAttr($value,$data)
    {
        $date=$this->getAttr('date');
        $money=number_format($this->getData('money')/100,2);
        $payed=$this->getAttr('payed');
        $charge=number_format($this->getData('charge')/100,2);
        $line="{$payed}于{$date}转入{$money},金额变化为{$charge}";
        return $line;
    }


}
