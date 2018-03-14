<?php

namespace app\admin\model;

use think\Model;

class Message extends Model
{
    // 表名
    protected $name = 'message';
    
    // 自动写入时间戳字段
    protected $autoWriteTimestamp = true;

    // 定义时间戳字段名
    protected $createTime = false;
    protected $updateTime = 'edit_time';
    
    // 追加属性
    protected $append = [
        'public_time_text',
        'edit_time_text'
    ];
    

    



    public function getPublicTimeTextAttr($value, $data)
    {
        $value = $value ? $value : $data['public_time'];
        return is_numeric($value) ? date("Y-m-d H:i:s", $value) : $value;
    }


    public function getEditTimeTextAttr($value, $data)
    {
        $value = $value ? $value : $data['edit_time'];
        return is_numeric($value) ? date("Y-m-d H:i:s", $value) : $value;
    }

    protected function setPublicTimeAttr($value)
    {
        return $value && !is_numeric($value) ? strtotime($value) : $value;
    }

    protected function setEditTimeAttr($value)
    {
        return $value && !is_numeric($value) ? strtotime($value) : $value;
    }


}
