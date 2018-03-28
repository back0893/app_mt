<?php

namespace app\api\model;

class PayFactory{
    static public function instance($name){
        if($name=='ali'){
            return new PayAli();
        }
        return new PayWx();
    }
}

