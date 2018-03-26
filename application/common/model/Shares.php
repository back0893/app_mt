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
    public function makeDetail($flag=0){
        if(empty($this->data)){
            return false;
        }
        //从每天 上午9点半到下午3点半,分钟
        $tmp=date($this->getData('date').' 09:30:00');
        $t=strtotime($tmp);
        $s=strtotime(date($this->getData('date').' 15:30:00'));
        $intval=intval(($s-$t)/60);
        $start=new \DateTime();
        $start->setTimestamp($t);
        $maxPrice=0;
        $minPrice=10000000;
        $category=Category::get(['id'=>$this->getData('cid')]);
        $flag=empty($flag)?$category->getData('flag'):$flag;
        $open_price=$this->getData('open_price');
        $max=empty($this->getData('maxprice'))?$category->getData('maxprice'):$this->getData('maxprice');
        $min=empty($this->getData('maxprice'))?$category->getData('minprice'):$this->getData('maxprice');
        $data=['0930'=>$open_price];
        $m1=new \DateInterval('PT1M');
        $high1=50+$flag;
        $high2=-50+$flag;
        $hhh=array_merge(range($high2,0),range(0,$high1));
        do{
            $up=0;
            $down=0;
            $last_price=$open_price;
            for($i=0;$i<$intval;$i++){
                shuffle($hhh);
                $start->add($m1);
                $go=$hhh[array_rand($hhh)]>0?1:-1;
                $go==1?$up++:$down++;
                $k=intval((1+($go*(rand(1,3)/100)))*$last_price);
                if($k>=$max){
                    $k=$max;
                }
                elseif($k<=$min){
                    $k=$min;
                }
                $data[$start->format('Hi')]=$k;
                if($maxPrice<$k){
                    $maxPrice=$k;
                }
                elseif($minPrice>$k){
                    $minPrice=$k;
                }
                $last_price=$k;
            }
            if($flag>0){
                $more=$up-$down;
            }else{
                $more=$down-$up;
            }
        }while($more>abs($flag));
        $save=['id'=>$this->getData('id'),'date'=>$this->getData('date'),'data'=>$data];
        $detail=SharesDetail::find(['id'=>$save['id']]);
        if(empty($detail)){
            $save['data']=json_encode($save['data']);
            SharesDetail::insert($save);
        }else{
            $detail->allowField(true)->save($save);
        }
        $this->isUpdate(true)
            ->save(['endprice'=>$last_price/100,'maxprice'=>$maxPrice/100,'minprice'=>$minPrice/100]);
        $nextDay=new \Datetime($this->getData('date'));
        $ttt=new \DateInterval('P1D');
        $nextDay->add($ttt);
        $save=['date'=>$nextDay->format('Y-m-d'),'open_price'=>$last_price,'endprice'=>0,'maxprice'=>0,'minprice'=>0,
            'cid'=>$this->getData('cid')];
        $next=$this->find(['cid'=>$save['cid'],'date'=>$save['date']]);
        if(empty($next)){
            $this->insert($save);
        }
       else{
           $this->update($save,['cid'=>$save['cid'],'date'=>$save['date']]);
       }
       return true;
    }
}