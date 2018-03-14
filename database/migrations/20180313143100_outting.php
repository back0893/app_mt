<?php

use think\migration\Migrator;
use think\migration\db\Column;

class Outting extends Migrator
{
    /**
     * Change Method.
     *
     * Write your reversible migrations using this method.
     *
     * More information on writing migrations is available here:
     * http://docs.phinx.org/en/latest/migrations.html#the-abstractmigration-class
     *
     * The following commands can be used in this method and Phinx will
     * automatically reverse them when rolling back:
     *
     *    createTable
     *    renameTable
     *    addColumn
     *    renameColumn
     *    addIndex
     *    addForeignKey
     *
     * Remember to call "create()" or "update()" and NOT "save()" when working
     * with the Table class.
     */
    public function change()
    {
        $table=$this->table('outting',['engine'=>'innodb']);
        $table->addColumn('uid','integer',['comment'=>'充值用户id'])
            ->addColumn('money','integer',['default'=>0,'comment'=>'转出金额(分)'])
            ->addColumn('orderId','string',['comment'=>'转出单号'])
            ->addColumn('tradeId','string',['comment'=>'订单号'])
            ->addColumn('name','string',['comment'=>'姓名'])
            ->addColumn('bank','string',['comment'=>'银行名称'])
            ->addColumn('bankName','string',['comment'=>'收款开户行名称'])
            ->addColumn('date','integer',['comment'=>'交易时间'])
            ->addColumn('payed','boolean',['default'=>0,'comment'=>'是否转出成功'])
            ->addColumn('charge','boolean',['default'=>0,'comment'=>'余额更新'])
            ->create();
    }
}
