<?php

namespace app\common\model;

use think\helper\Time;
use think\Model;

class Trade extends Model
{
    protected $autoWriteTimestamp=true;
    protected $createTime='createtime';
    protected $updateTime=false;
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
        $text=[1=>'卖出',0=>'买入'];
        return $text[$value];
    }
    public function history($date){
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
        return $this->where(['createtime'=>['>= time'=>$start,'<= time'=>$end],'and']);
    }
}
