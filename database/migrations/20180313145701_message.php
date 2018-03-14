<?php

use think\migration\Migrator;
use think\migration\db\Column;

class Message extends Migrator
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
        $table=$this->table('message',['engine'=>'innodb']);
        $table->addColumn('title','string',['comment'=>'标题'])
            ->addColumn('author','string',['default'=>'管理员','comment'=>'作者'])
            ->addColumn('public_time','integer',['comment'=>'发布时间'])
            ->addColumn('edit_time','integer',['comment'=>'最后编辑时间'])
            ->create();
    }
}
