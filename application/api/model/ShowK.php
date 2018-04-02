<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/4/2 0002
 * Time: 22:50
 */

namespace app\api\model;


class ShowK
{
    static public function K($data,$type,$date){
        $key=[];
        $value=[];
        $count=0;
        $date=date('m/d',strtotime($date));
        foreach ($data as $time=>$price) {
            $count++;
            if($count==$type){
                $tmp=array_map(function($value){
                    return sprintf('%.2f',$value/100);
                },array_slice($price,0,4));
                $key[]=$date.' '.substr($time,0,2).':'.substr($time,2);
                $value[] = $tmp;
                $count=0;
            }

        }
        return [$key,$value];
    }
}