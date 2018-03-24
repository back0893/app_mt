<?php
/**
 * Created by PhpStorm.
 * User: WX-C
 * Date: 2018/3/24
 * Time: 10:23
 */

namespace app\api\controller;


use app\api\model\Shares;
use app\common\controller\Api;

class ShowK extends Api
{
    protected $noNeedRight='*';
    protected $noNeedLogin='*';
    public function index(){
        //开始时将分类查出来
        $type=input('type');
        $model=Shares::get(['id'=>1]);
        $data=$model->detail->data;
        $c=date('Y');
        $key=[];
        $value=[];
        foreach ($data->data as $x){
            list($time,$price,$number)=explode(chr(32),$x);
            $key[]=substr($time,0,2).':'.substr($time,2);
            $value[]=$price;
        }
        return $this->success('',['key'=>$key,'value'=>$value]);
    }
}