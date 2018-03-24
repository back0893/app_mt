<?php

use think\migration\Migrator;
use think\migration\db\Column;

class Shares extends Migrator
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
     * 股票的数据来源腾讯的数据接口
     * 这股票的
     */
    public function change()
    {
        $this->table('shares_detail',['engine'=>'myisam'])
            ->addColumn('date','string',['comment'=>'时间'])
            ->addColumn('data','text',['comment'=>'一天的涨跌分钟数据'])
            ->create();
        $this->table('shares',['engine'=>'myisam'])
            ->addColumn('code','string',['comment'=>'股票的编号'])
            ->addColumn('name','string',['comment'=>'名称'])
            ->addColumn('date','string',['comment'=>'时间'])
            ->addColumn('open_price','decimal',['comment'=>'开盘价格','precision'=>5,'scale'=>2])
            ->addColumn('yesterday_price','decimal',['comment'=>'昨收价格','precision'=>5,'scale'=>2])
            ->addColumn('maxPrice','decimal',['comment'=>'最高','precision'=>5,'scale'=>2])
            ->addColumn('minPrice','decimal',['comment'=>'最低','precision'=>5,'scale'=>2])
            ->create();
    }
}
