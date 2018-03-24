<?php
/**
 * Created by PhpStorm.
 * User: WX-C
 * Date: 2018/3/24
 * Time: 14:08
 */

namespace app\api\model;


use think\Model;

class Shares extends Model
{
    protected $name='shares';
    protected $autoWriteTimestamp=true;
    protected $dateFormat='Ymd';
    protected $insert='date';
    protected $update=false;
    public function getCurrentPrice($value,$data){
        $data=$this->detail->cache(true,3600)
            ->data;
        $currentTime=date('md');
        return $data[$currentTime];
    }
    public function detail(){
        return $this->hasOne('SharesDetail','id','id');
    }
}