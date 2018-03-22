<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/3/23 0023
 * Time: 01:12
 */

namespace app\admin\iface;


interface IFormat
{
    public function getFormatAttr($value,$data);
}