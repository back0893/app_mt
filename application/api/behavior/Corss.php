<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/3/21 0021
 * Time: 22:00
 */

namespace  app\api\behavior;

/**
 * 结局跨域问题
 * Class Corss
 * @package app\api\behavior
 */
class Corss
{
    public function responseSend(){
        header('Access-Control-Allow-Origin:*');
    }
}