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

    // 定义时间戳字段名
    protected $createTime = 'date';
    protected $updateTime = false;
    
    // 追加属性
    protected $append = [
    ];
    protected $insert=['tradeId'];
    protected function setTradeIdAttr(){
        return uniqid('in_');
    }
    public function getFormatAttr($value,$data)
    {
        $date=$this->getAttr('date');
        $money=number_format($this->getAttr('money')/100,2);
        $payed=$this->getAttr('payed')?'成功':'失败';
        $charge=number_format($this->getAttr('charge')/100,2);
        $line="{$payed}于{$date}转入{$money},金额变化为{$charge}";
    }


}
