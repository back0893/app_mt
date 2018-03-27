<?php

namespace app\admin\controller;

use app\admin\model\User;
use app\common\controller\Backend;

/**
 * 控制台
 *
 * @icon fa fa-dashboard
 * @remark 用于展示当前系统中的统计数据、统计报表及重要实时数据
 */
class Dashboard extends Backend
{

    /**
     * 查看
     */
    public function index()
    {
        $seventtime = \fast\Date::unixtime('day', -7);
        $paylist = $createlist = [];
        for ($i = 0; $i < 7; $i++)
        {
            $day = date("Y-m-d", $seventtime + ($i * 86400));
            $createlist[$day] = mt_rand(20, 200);
            $paylist[$day] = mt_rand(1, mt_rand(1, $createlist[$day]));
        }
        $hooks = config('addons.hooks');
        $comming=\app\admin\model\Comming::where(['payed'=>1])->count('money');
        $outing=\app\admin\model\Outting::where(['payed'=>1])->count('money');
        $this->view->assign([
            'totaluser'        => User::count(),
            'comming'=>$comming,
            'outing'=>$outing,
            'totalorderamount'=>$comming-$outing
        ]);

        return $this->view->fetch();
    }

}
