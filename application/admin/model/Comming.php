<?php

namespace app\admin\model;

use think\Model;

class Comming extends Model
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
    

    







}
