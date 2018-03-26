<?php

namespace app\api\controller;

use app\common\controller\Api;
use app\common\model\Category;
use app\common\model\Shares;

/**
 * 首页接口
 */
class Index extends Api
{
    protected $noNeedLogin = ['*'];
    protected $noNeedRight = ['*'];

    /**
     * 毛的首页,直接显示贵金属,股票,外汇
     * 
     */
    public function index()
    {
       $type=input('type','shares','trim');
       $page=input('page',1,'intval');
        $my=input('my',0);
       $current=date('Hi');
       if(strcmp($current,'0930')<0){
           $date=date('Y-m-d',strtotime('-1 day'));
       }else{
           $date=date('Y-m-d');
       }

       $hasWhere=['type'=>$type];
        if(!empty($my)){
            $owner=unserialize($this->auth->owner);
            $ids=array_keys($owner);
            $hasWhere['diyname']=['in',$ids];
        }
       $shares=Shares::hasWhere('category',$hasWhere)
            ->where(['date'=>['<=',$date]])
           ->page($page,10)
           ->order(['date'=>'desc'])
           ->with('detail,category')
           ->group('cid')
           ->select();
       $flip=config('site.categorytype');
       $tmp=[];
       foreach ($shares as $share){
           $tmp[$share->category->diyname]=[
               'name'=>$share->category->name,
               'type'=>$flip[$type],
               'open_price'=>$share->open_price,
               'current_price'=>number_format($share->current_price/100,2),
               'up'=>number_format((($share->current_price-$share->open_price*100)/100),2),
               'image'=>$share->category->image
           ];
       }
        return $this->success('',$tmp);
    }
    public function total(){
        $type=input('type','shares','trim');
        $my=input('my',0);
        $count=Category::where(['type'=>$type]);
        if($my){
            $owner=unserialize($this->auth->owner);
            $ids=array_keys($owner);
            $count->where(['diyname'=>['in',$ids]]);
        }
        $count=$count->count();
        return $this->success('',['count'=>$count]);
    }
}
