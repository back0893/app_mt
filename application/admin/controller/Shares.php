<?php

namespace app\admin\controller;

use app\common\controller\Backend;
use app\common\model\SharesDetail;
use think\Db;

/**
 * 
 *
 * @icon fa fa-circle-o
 */
class Shares extends Backend
{
    
    /**
     * Shares模型对象
     */
    protected $model = null;

    public function _initialize()
    {
        parent::_initialize();
        $this->model = model('app\common\model\Shares');

    }
    
    /**
     * 默认生成的控制器所继承的父类中有index/add/edit/del/multi五个基础方法、destroy/restore/recyclebin三个回收站方法
     * 因此在当前控制器中可不用编写增删改查的代码,除非需要自己控制这部分逻辑
     * 需要将application/admin/library/traits/Backend.php中对应的方法复制到当前控制器,然后进行修改
     */
    public function index()
    {
        //设置过滤方法
        $this->request->filter(['strip_tags']);
        if ($this->request->isAjax())
        {
            //如果发送的来源是Selectpage，则转发到Selectpage
            if ($this->request->request('pkey_name'))
            {
                return $this->selectpage();
            }
            $filter=json_decode(input('filter',[]),true);
            $offset=input('offset',0,'intval');
            $limit=input('limit',0,'intval');
            $where=[];
            foreach ($filter as $k=>$v){
                if($k=='date'){
                    preg_match_all('/(\d{4})-(\d{2})-\d{2}/',$v,$m);
                    list($startDate,$endDate)=$m[0];
                    $where['date']=[['>=',$startDate],['<=',$endDate],'and'];
                }else{
                    $where[$k]=$v;
                }
            }
            $total = $this->model
                ->with("category")
                ->where($where)
                ->order('date','desc')
                ->count();
            $list = $this->model
                ->with("category")
                ->where($where)
                ->limit($offset,$limit)
                ->select();
            if(!empty($list)){
                $list=collection($list)
                    ->toArray();
            }else{
                $list=[];
            }
            $result = array("total" => $total, "rows" => $list);

            return json($result);
        }
        return $this->view->fetch();
    }
    public function mk(){
        $id=input('id',0,'intval');
        $flag=input('flag',0,'intval');
        $model=\app\common\model\Shares::get(['id'=>$id]);
        $r=$model->makeDetail($flag);
        if($r){
            return $this->success('生成成功');
        }
        return $this->error('生成失败');
    }
    //这里后台显示k线图,用来后台自动重新生成k线图
    public function showK(){
        if($this->request->isPost()){
            $id=input('id',0,'intval');
            $model=\app\common\model\Shares::get(['id'=>$id]);
            $data=$model->detail->data;
            $key=[];
            $value=[];
            foreach ($data as $time=>$price){
                $key[]=substr($time,0,2).':'.substr($time,2);
                $value[]=$price;
            }
            return $this->success('','',['key'=>$key,'value'=>$value,'name'=>$model->category->name]);
        }
        $id=input('ids',0,'intval');
        $this->assign('id',$id);
        return $this->fetch('showK');
    }
    public function mk10day(){
        $id=input('ids',0,'intval');
        //先删除从今天起(不包括今天的数据),在添加,今天的数据应该作为基础数据
        $ids=\app\common\model\Shares::where(['cid'=>$id,'date'=>['>',date('Y-m-d')]])
            ->value('id');
        if(!empty($ids)){
            SharesDetail::where(['id'=>['in',$ids]])->delete();
            \app\common\model\Shares::where(['cid'=>$id,'date'=>['>',date('Y-m-d')]])->delete();
        }
        $now=new \DateTime('+1 day');
        $now_share=\app\common\model\Shares::where(['cid'=>$id,'date'=>date('Y-m-d')])
            ->find();
        $now_share->makeDetail();
        $interval=new \DateInterval('P1D');
        $daterange=new \DatePeriod($now,$interval,10);
        foreach ($daterange as $i=>$d){
            $model=\app\common\model\Shares::where(['cid'=>$id,'date'=>$d->format('Y-m-d')])
                ->find();
            $model->makeDetail();
        }
        return $this->success();
    }
}
