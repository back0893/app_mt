<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/3/25 0025
 * Time: 01:59
 */

namespace app\common\traits;

trait Price
{
    protected function setMaxpriceAttr($value){
        return $this->setPrice($value);
    }
    protected function setMinpriceAttr($value){
        return $this->setPrice($value);
    }
    protected function getMaxpriceAttr($value){
        return $this->getPrice($value);
    }
    protected function getMinpriceAttr($value){
        return $this->getPrice($value);
    }
    protected function setPrice($price){
        return intval($price*100);
    }
    protected function getPrice($price){
        return number_format($price/100,2,'.','');
    }
    protected function getOpenPriceAttr($value){
        return $this->getPrice($value);
    }
    protected function setOpenPriceAttr($value){
        return $this->setPrice($value);
    }
    protected function getEndpriceAttr($value){
        return $this->getPrice($value);
    }
    protected function setEndpriceAttr($value){
        return $this->setPrice($value);
    }
}