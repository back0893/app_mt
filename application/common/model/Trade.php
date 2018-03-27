<?php

namespace app\common\model;

use think\Db;
use think\helper\Time;
use think\Model;

class Trade extends Model
{
    protected $dateFormat='Y-m-d H:i:s';
    protected $codeTmp=[];
    public function __construct($data = [])
    {
        parent::__construct($data);
        $this->codeTmp=Category::column('name','diyname');
    }

    protected function getCodeAttr($value){
        return !empty($this->codeTmp[$value])?$this->codeTmp[$value]:'未知';
    }
    protected function getStatusAttr($value){
        $text=[2=>'卖出',1=>'买入'];
        return $text[$value];
    }
    protected function getCreatetimeAttr($value){
        return date($this->dateFormat,$value);
    }
    public function history($date,$uid,$page){
        $date=strtolower($date);
        switch ($date){
            case 'year':
                list($start,$end)=Time::year();
                break;
            case 'lastweek':
                list($start,$end)=Time::lastWeek();
                break;
            default:
                list($start,$end)=[0,0];
        }
        if(!empty($start)&& !empty($end)){
            $this->where('createtime',['>= time',$start],['<= time',$end],'and');
        }
       return $this->field('id,uid',true)
            ->where(['uid'=>$uid])
            ->order(['createtime'=>'desc'])
            ->page($page,10)
            ->select();
    }
    protected function getMoneyAttr($value){
        return number_format($value/100,2);
    }
    protected function getPriceAttr($value){
        return number_format($value/100,2);
    }
}
