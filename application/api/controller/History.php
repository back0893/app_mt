<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/3/14 0014
 * Time: 23:15
 */

namespace app\api\controller;


use app\admin\model\Outting;
use app\api\helper\Response;
use app\common\controller\Api;
use app\common\model\Category;
use app\common\model\Trade;

class History extends Api
{
    protected $noNeedRight = ['*'];
    protected $noNeedLogin='';
    public function index(){
        $page=input('page',1,'intval');
        $date=input('date','week');
        $model=new Trade();
        $history=$model->history($date,$this->auth->id,$page);
        return $this->success('成功',['history'=>$history]);
    }
    public function own(){
        $page=input('page',1,'intval');
        $user=$this->auth->getUser();
        $owner=unserialize($user['owner']);
        $code=Category::column('name','diyname');
        $owner=empty($owner)?[]:$owner;
        $owner=array_slice($owner,($page-1)*10,10);
        foreach ($owner as $k=>&$o){
            $o['price']=sprintf('%.2f',$o['price']/100);
            $o['name']=$code[$k];
            $o['money']=number_format($o['number']*$o['price'],2);
        }
        return Response::success('成功',['own'=>$owner]);
    }
    public function pageCount(){
        $uid=$this->auth->id;
        $page1=Trade::where(['uid'=>$uid])
            ->count();
        $owner=unserialize($this->auth->owner);
        $owner=empty($owner)?[]:$owner;
        $page2=count($owner);
        return $this->success('',['page1'=>$page1,'page2'=>$page2]);
    }
}