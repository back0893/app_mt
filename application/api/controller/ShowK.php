<?php
/**
 * Created by PhpStorm.
 * User: WX-C
 * Date: 2018/3/24
 * Time: 10:23
 */

namespace app\api\controller;


use app\common\model\Shares;
use app\common\controller\Api;

class ShowK extends Api
{
    protected $noNeedLogin='*';
    public function index(){
        //开始时将分类查出来,还需要把名称
        $code=input('code','','trim');
        $current=date('Y-m-d');
        $date=input('date',date('Y-m-d'),'trim');
        if(empty($date)){
            $date=date('Y-m-d');
        }
        $str2time=strtotime($date);
        $prev=date('Y-m-d',strtotime('-1 day',$str2time));
        $next=date('Y-m-d',strtotime('+1 day',$str2time));
        $is_all=true;
        if(strcmp($date,$current)>=0){
            $date=$current;
            $next='';
            $is_all=false;
        }
        if(strcmp(date('Hi'),'0930')>=0 && strcmp(date('Hi'),'1530')<=0){
           if($current==$date){
               $is_all=false;
           }else{
               $is_all=true;
           }
        }elseif(strcmp(date('Hi'),'0930')<0){
            if($current==$date) {
                $date = $prev;
            }
        }else{
            $is_all=true;
        }
        $model=Shares::hasWhere('category',['diyname'=>$code])
            ->where(['date'=>$date])
            ->find();
        $data=$model->detail->data;
        $key=[];
        $value=[];
        foreach ($data as $time=>$price) {
            $key[] = substr($time, 0, 2) . ':' . substr($time, 2);
            $value[] = $price;
        }
        $l=unserialize($this->auth->owner);
        $has=empty($l[$code])?0:$l[$code]['number'];
        return $this->success('',['key'=>$key,'value'=>$value,'name'=>$model->category->name,'is_all'=>$is_all,'prev'=>$prev,'next'=>$next,'has'=>$has,'current'=>$date]);
    }
}