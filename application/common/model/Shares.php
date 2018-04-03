<?php
/**
 * Created by PhpStorm.
 * User: WX-C
 * Date: 2018/3/24
 * Time: 14:08
 */

namespace app\common\model;


use app\common\traits\Price;
use think\Model;

class Shares extends Model
{
    use Price;
    protected $name='shares';
    public function getCurrentPriceAttr(){
        $date=$this->getData('date');
        if($date<date('Y-m-d')){
            return $this->getData('endprice');
        }
        $data=$this->detail->getAttr('data');
        $currentTime=date('Hi');
        try{
            $c=$data[$currentTime];
        }catch (\Exception $e){
            $c=array_pop($data);
        }
        return array_pop($c);
    }
    public function detail(){
        return $this->hasOne('SharesDetail','id','id');
    }
    public function category(){
        return $this->hasOne('Category','id','cid')->setEagerlyType(0);
    }
//    protected function getNameAttr($value){
//        return $this->category->getData('name');
//    }
//    protected function getCodeAttr($value){
//        return $this->category->diyname;
//    }
    public function makeDetail($flag=0){
        if(empty($this->data)){
            return false;
        }
        //从每天 上午9点半到下午3点半,分钟
        //修改成上午6点到晚上8点
        $tmp=date($this->getData('date').' 06:00:00');
        $t=strtotime($tmp);
        $s=strtotime(date($this->getData('date').'20:00:00'));
        $intval=intval(($s-$t)/60);
        $start=new \DateTime();
        $start->setTimestamp($t);
        $category=Category::get(['id'=>$this->getData('cid')]);
        $flag=empty($flag)?$category->getData('flag'):$flag;
        $open_price=$this->getData('open_price');
        $max=empty($this->getData('maxprice'))?$category->getData('maxprice'):$this->getData('maxprice');
        $min=empty($this->getData('minprice'))?$category->getData('minprice'):$this->getData('minprice');
        $m1=new \DateInterval('PT1M');
        //减去1min
        $start->sub($m1);
        $high1=50+$flag;
        $high2=-50+$flag;
        $hhh=array_merge(range($high2,0),range(0,$high1));
        $last_price=$open_price;
        $shareMin=99999;
        $shareMax=0;
        for($i=0;$i<$intval;$i++){
            shuffle($hhh);
            $start->add($m1);
            $go=$hhh[array_rand($hhh)]>0?1:-1;
            if($go==-1){
                $t=rand(1,3);
            }else{
                $t=rand(1,3);
            }
            $k=intval((1+($go*$t/100))*$last_price);
            if($k>=$max){
                $k=$max;
                $flag=-5;
            }
            elseif($k<=$min){
                $k=$min;
                $flag=1;
            }
            //每分钟的开始,结束,最高,最低,走势线
            $tmpM=[$k*mt_rand(90,110)/100,$k*mt_rand(90,110)/100,$k*mt_rand(90,110)/100,$k*mt_rand(90,110)/100];
            sort($tmpM);
            $tmpM=array_map(function($value){
                return intval($value);
            },$tmpM);
            $mm=mt_rand(1,2);
            $data[$start->format('Hi')]=[
                $tmpM[$mm],
                $tmpM[3-$mm],
                $tmpM[3],
                $tmpM[0],
                $k
            ];
            if($shareMax<$tmpM[3]){
                $shareMax=$tmpM[3];
            }
            if($shareMin>$tmpM[0]){
                $shareMin=$tmpM[0];
            }
            $last_price=$k;
        }
        $save=['id'=>$this->getData('id'),'date'=>$this->getData('date'),'data'=>$data];
        $detail=SharesDetail::find(['id'=>$save['id']]);
        if(empty($detail)){
            $save['data']=json_encode($save['data']);
            SharesDetail::insert($save);
        }else{
            $detail->allowField(true)->save($save);
        }
        $share_data=['endprice'=>$last_price/100];
        if(empty($this->getData('maxprice')) && empty($this->getData('minprice'))){
            $share_data['maxprice']=$shareMax/100;
            $share_data['minprice']=$shareMin/100;
        }
        $this->isUpdate(true)
            ->save($share_data);
        $nextDay=new \Datetime($this->getData('date'));
        $nextDay->add(new \DateInterval('P1D'));
        $save=['date'=>$nextDay->format('Y-m-d'),'open_price'=>$last_price/100,'endprice'=>0,'maxprice'=>0,'minprice'=>0, 'cid'=>$this->getData('cid')];
        $next=$this->where(['cid'=>$save['cid'],'date'=>$save['date']])->find();
        if(empty($next)){
            $save['open_price']= $save['open_price']*100;
            $this->insert($save);
        }
       else{
           $this->update($save,['cid'=>$save['cid'],'date'=>$save['date']]);
       }
       return true;
    }
}