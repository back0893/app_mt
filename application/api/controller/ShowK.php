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
use Monolog\Handler\SlackWebhookHandlerTest;

class ShowK extends Api
{
    protected $noNeedLogin='*';
    public function index(){
        $type=input('type',5,'intval');
        switch($type){
            case 5:
                $type_limit=1;
                break;
            case 10:
                $type_limit=2;
                break;
            case 30:
                $type_limit=4;
                break;
            default:
                $type_limit=0;
        }
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
        if(strcmp(date('Hi'),'0600')>=0 && strcmp(date('Hi'),'2000')<=0){
           if($current==$date){
               $is_all=false;
           }else{
               $is_all=true;
           }
        }elseif(strcmp(date('Hi'),'0600')<0){
            if($current==$date) {
                $date = $prev;
                $is_all=true;
            }
        }else{
            $is_all=true;
        }
        $model=Shares::hasWhere('category',['diyname'=>$code])
            ->where(['date'=>$date])
            ->find();
        //获取之前的渲染480个

        $before=Shares::hasWhere('category',['diyname'=>$code])
            ->where(['date'=>['<',$date]]);
        if($type_limit){
            $before->limit(0,$type_limit);
        }
            $before=$before->select();
        $data=$model->detail->data;
        list($key,$value)=\app\api\model\ShowK::K($data,$type,$model->date);

        //在这里计算前面的k线
        $before_key=[];
        $before_value=[];
        foreach ($before as $b){
            list($a,$b)=\app\api\model\ShowK::K($b->detail->data,$type,$b->date);
            $before_key=array_merge($before_key,$a);
            $before_value=array_merge($before_value,$b);
        }

        $l=unserialize($this->auth->owner);
        $has=empty($l[$code])?0:$l[$code]['number'];
        return $this->success('',['key'=>$key,'value'=>$value,'name'=>$model->category->name,'is_all'=>$is_all,'prev'=>$prev,'next'=>$next,'has'=>$has,'current'=>$date,'before_key'=>$before_key,'before_value'=>$before_value,'date'=>date('m/d')]);
    }

}