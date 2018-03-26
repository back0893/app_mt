define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'shares/index',
                    add_url: 'shares/add',
                    edit_url: 'shares/edit',
                    del_url: 'shares/del',
                    multi_url: 'shares/multi',
                    table: 'shares'
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'id',
                columns: [
                    [
                        {checkbox: true},
                        {field: 'code', title: __('Code')},
                        {field: 'name', title: __('Name')},
                        {field: 'date', title: __('Date')},
                        {field: 'open_price', title: __('Open_price'), operate:'BETWEEN'},
                        {field: 'endprice', title: '收盘价格', operate:'BETWEEN'},
                        {field: 'maxprice', title: __('Maxprice'), operate:'BETWEEN'},
                        {field: 'minprice', title: __('Minprice'), operate:'BETWEEN'},
                        {field: 'id', title: '走势图', table: table, buttons: [
                            {name: 'detail', text: '走势图', title: '弹窗标题', icon: 'fa fa-list', classname: 'btn btn-xs btn-primary btn-dialog', url: 'shares/showK', callback:function(data){}}
                        ], operate:false, formatter: Table.api.formatter.buttons},
                        {field: 'operate', title: __('Operate'), table: table, events: Table.api.events.operate, formatter: Table.api.formatter.operate}
                    ]
                ]
            });

            // 为表格绑定事件
            Table.api.bindevent(table);
        },
        add: function () {
            Controller.api.bindevent();
        },
        edit: function () {
            Controller.api.bindevent();
        },
        api: {
            bindevent: function () {
                Form.api.bindevent($("form[role=form]"));
            }
        }
    };
    return Controller;
});