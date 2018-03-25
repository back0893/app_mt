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
                        {field: 'end_price', title: '收盘价格', operate:'BETWEEN'},
                        {field: 'maxPrice', title: __('Maxprice'), operate:'BETWEEN'},
                        {field: 'minPrice', title: __('Minprice'), operate:'BETWEEN'},
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