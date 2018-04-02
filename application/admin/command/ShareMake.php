<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/4/3 0003
 * Time: 00:37
 */
namespace app\admin\command;


use app\common\model\Shares;
use think\console\Command;
use think\console\Input;
use think\console\Output;

class ShareMake extends Command
{
    protected function configure()
    {
        $this->setName('Share')->setDescription('share make');
    }
    protected function execute(Input $input,Output $output){
        if(!in_array(date('w'),[0,6])){
            $model=new Shares();
            $shares=$model->alias('a')
                ->join('(select `cid`,max(`date`) as `date` from `fa_shares` group by `cid`) b','a.cid=b.cid and b.date=a.date')
                ->select();
            foreach ($shares as $share){
                $share->makeDetail($share->category->flag);
            }
        }
    }
}