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
        $date=input('date',date('Y-m-d'),'trim');
        $model=Shares::hasWhere('category',['diyname'=>$code])
            ->where(['date'=>$date])
            ->find();
        $data=$model->detail->data;
        $key=[];
        $value=[];
        foreach ($data as $time=>$price){
            $key[]=substr($time,0,2).':'.substr($time,2);
            $value[]=$price;
        }
        return $this->success('',['key'=>$key,'value'=>$value,'name'=>$model->category->name,'is_all'=>0]);
    }
}