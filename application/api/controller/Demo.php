<?php

namespace app\api\controller;

use app\common\controller\Api;
use think\Db;

/**
 * 示例接口
 */
class Demo extends Api
{

    //如果$noNeedLogin为空表示所有接口都需要登录才能请求
    //如果$noNeedRight为空表示所有接口都需要验证权限才能请求
    //如果接口已经设置无需登录,那也就无需鉴权了
    //
    // 无需登录的接口,*表示全部
    protected $noNeedLogin = [];
    // 无需鉴权的接口,*表示全部
    protected $noNeedRight = ['*'];

    public function message(){
        $uid=$this->auth->id;
        $status=input('status','','trim');
        if($status!='all'){
            list($_,$id)=explode('_',$status);
            if($_){
                \app\admin\model\Outting::where(['id'=>$id,'uid'=>$uid])
                    ->update(['readed'=>1]);
            }else{
                \app\admin\model\Comming::where(['id'=>$id,'uid'=>$uid])
                    ->update(['readed'=>1]);
            }
        }else{
            \app\admin\model\Outting::where(['uid'=>$uid])
                ->update(['readed'=>1]);
            \app\admin\model\Comming::where(['uid'=>$uid])
                ->update(['readed'=>1]);
            return $this->success('all');
        }
        return $this->success('');
    }
    public function getchildarea(){
        $pid=input('parent_id',0,'intval');
        $area=Db::name('area')
            ->where(['parent_id'=>$pid])
            ->column('shortname','area_name');

    }
}
