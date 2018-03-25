<?php
/**
 * Created by PhpStorm.
 * User: WX-C
 * Date: 2018/3/24
 * Time: 14:08
 */

namespace app\common\model;


use think\Model;

class Shares extends Model
{
    protected $name='shares';
    public function getCurrentPriceAttr($value){
        $data=$this->detail->getAttr('data');
        $currentTime=date('md');
        try{
            $c=$data[$currentTime];
        }catch (\Exception $e){
            $c=array_pop($data);
        }
        return $c;
    }
    public function detail(){
        return $this->hasOne('SharesDetail','id','id');
    }
    public function category(){
        return $this->hasOne('Category','id','cid');
    }
    protected function getNameAttr($value){
        return $this->category->getData('name');
    }
    protected function getCodeAttr($value){
        return $this->category->diyname;
    }
    public function makeDetail(){
        //从每天 上午9点半到下午3点半,分钟
        $tmp=date('Y-m-d 09:30:00');
        $t=strtotime($tmp);
        $s=strtotime(date('Y-m-d 15:30:00'));
        $intval=intval(($s-$t)/60);
        $start=new \DateTime();
        $start->setTimestamp($t);
        $category=Category::get(['id'=>$this->getData('cid')]);
        $flag=$category->getData('flag');
        $open_price=$this->getData('open_price');
        $max=empty($this->getData('maxPrice'))?$category->getData('maxprice'):$this->getData('maxPrice');
        $min=empty($this->getData('minPrice'))?$category->getData('minprice'):$this->getData('minPrice');
        $last_price=$open_price;
        $data=['09:30'=>$open_price];
        $m1=new \DateInterval('PT1M');
        for($i=0;$i<$intval;$i++){
            $start->add($m1);
            $high1=50+$flag;
            $high2=-50+$flag;
            $hhh=array_merge(range(1,$high1,1),range($high2,-1));
            $go=$hhh[array_rand($hhh)]>0?1:-1;
            $k=intval((1+($go*(rand(1,3)/100)))*$last_price);
            if($k>=$max){
                $k=$max;
                $flag=-1;
            }
            elseif($k<=$min){
                $k=$min;
                $flag=1;
            }
            $data[$start->format('Hi')]=$k;
            $last_price=$k;
        }
        $save=['id'=>$this->getData('id'),'date'=>date('Y-m-d'),'data'=>$data];
        $detail=new SharesDetail();
        $detail->allowField(true)->save($save);
        $this->isUpdate(true)
            ->save(['end_price'=>$last_price]);
        $save=['date'=>date('Y-m-d',strtotime('+1 day')),'open_price'=>$last_price,'end_price'=>0,'maxPrice'=>0,'minPrice'=>0,
            'cid'=>$this->getData('cid')];
        $this->insert($save);
    }
}