<?php

namespace app\common\model;

use think\helper\Time;
use think\Model;

class Trade extends Model
{
    protected $dateFormat='Y-m-d H:i:s';
    protected $codeText;
    public function __construct($data = [])
    {
        parent::__construct($data);
        $this->codeText=config('code');
    }

    protected function getCodeAttr($value){
        return $this->codeText[$value];
    }
    protected function getStatusAttr($value){
        $text=[2=>'卖出',1=>'买入'];
        return $text[$value];
    }
    protected function getCreatetimeAttr($value){
        return date($this->dateFormat,$value);
    }
    public function history($date,$uid){
        $date=strtolower($date);
        switch ($date){
            case 'year':
                list($start,$end)=Time::year();
                break;
            case 'lastweek':
                list($start,$end)=Time::lastWeek();
                break;
            default:
                list($start,$end)=Time::week();
        }
        return $this->where('createtime',['>= time',$start],['<= time',$end],'and')
            ->field('id,uid',true)
            ->where(['uid'=>$uid])
            ->select();
    }
}
