<?php if (!defined('THINK_PATH')) exit(); /*a:4:{s:60:"E:\app_mt\public/../application/admin\view\shares\showK.html";i:1522042056;s:52:"E:\app_mt\application\admin\view\layout\default.html";i:1521100758;s:49:"E:\app_mt\application\admin\view\common\meta.html";i:1521100758;s:51:"E:\app_mt\application\admin\view\common\script.html";i:1521100758;}*/ ?>
<!DOCTYPE html>
<html lang="<?php echo $config['language']; ?>">
    <head>
        <meta charset="utf-8">
<title><?php echo (isset($title) && ($title !== '')?$title:''); ?></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
<meta name="renderer" content="webkit">

<link rel="shortcut icon" href="/assets/img/favicon.ico" />
<!-- Loading Bootstrap -->
<link href="/assets/css/backend<?php echo \think\Config::get('app_debug')?'':'.min'; ?>.css?v=<?php echo \think\Config::get('site.version'); ?>" rel="stylesheet">

<!-- HTML5 shim, for IE6-8 support of HTML5 elements. All other JS at the end of file. -->
<!--[if lt IE 9]>
  <script src="/assets/js/html5shiv.js"></script>
  <script src="/assets/js/respond.min.js"></script>
<![endif]-->
<script type="text/javascript">
    var require = {
        config:  <?php echo json_encode($config); ?>
    };
</script>
    </head>

    <body class="inside-header inside-aside <?php echo defined('IS_DIALOG') && IS_DIALOG ? 'is-dialog' : ''; ?>">
        <div id="main" role="main">
            <div class="tab-content tab-addtabs">
                <div id="content">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <section class="content-header hide">
                                <h1>
                                    <?php echo __('Dashboard'); ?>
                                    <small><?php echo __('Control panel'); ?></small>
                                </h1>
                            </section>
                            <?php if(!IS_DIALOG): ?>
                            <!-- RIBBON -->
                            <div id="ribbon">
                                <ol class="breadcrumb pull-left">
                                    <li><a href="dashboard" class="addtabsit"><i class="fa fa-dashboard"></i> <?php echo __('Dashboard'); ?></a></li>
                                </ol>
                                <ol class="breadcrumb pull-right">
                                    <?php foreach($breadcrumb as $vo): ?>
                                    <li><a href="javascript:;" data-url="<?php echo $vo['url']; ?>"><?php echo $vo['title']; ?></a></li>
                                    <?php endforeach; ?>
                                </ol>
                            </div>
                            <!-- END RIBBON -->
                            <?php endif; ?>
                            <div class="content">
                                <div id='main2' style="width:100%;height: 420px"></div>
<div class="layui-form-item">
    <label for="ll" class="layui-form-label">随机值</label>
    <div class="layui-input-block">
        <input type="text" name="flag" id="ll">
    </div>
    <button class="layui-btn layui-btn-normal" id="random">重新生成</button>
</div>
<script src="/assets/js/echarts.js"></script>
<script src="/assets/libs/jquery/dist/jquery.min.js"></script>
<script>
    function getQueryVariable(variable){
        var query = window.location.search.substring(1);
        var vars = query.split("&");
        for (var i=0;i<vars.length;i++) {
            var pair = vars[i].split("=");
            if(pair[0] == variable){return pair[1];}
        }
        return(false);
    }
    function init(id,myChart){
        $.post('/admin/shares/showK.html',{id:id},function(response){
            $('#name').text(response.data.name);
            myChart.hideLoading();
            var c=new Date();
            var h=c.getHours();
            var m=c.getMinutes();
            if(h<10){
                h='0'+h;
            }
            if(m<10){
                m='0'+m;
            }
            var tmp={
                xAxis:{
                    data:response.data.key
                },
                series:[
                    {
                        name:'shares',
                        data:response.data.value
                    }
                ]
            };
            myChart.setOption(tmp);
        });
    }
    $(function(){
        var myChart = echarts.init($('#main2')[0]);
        var option = {
            backgroundColor: '#21202D',
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    animation: false,
                    type: 'cross',
                    lineStyle: {
                        color: '#376df4',
                        width: 2,
                        opacity: 1
                    }
                },
                formatter:function(params){
                    return '时间:'+params[0].axisValue+'<br/>价格:'+params[0].data;
                }
            },
            xAxis: {
                type: 'category',
                axisLine: { lineStyle: { color: '#8392A5' } }
            },
            yAxis: {
                scale: true,
                axisLine: { lineStyle: { color: '#8392A5' } },
                splitLine: { show: false },
                type:'value',
                min:function(value){
                    return value.min*0.8;
                },
                max:function(value){
                    return value.max*1.2;
                }
            },
            grid: {
                bottom: 80
            },
            animation: false,
            series: [
                {
                    name: 'shares',
                    type: 'line',
                    smooth: true,
                    showSymbol: false,
                    lineStyle: {
                        normal: {
                            width: 1
                        }
                    }
                }
            ]
        };
        myChart.setOption(option, true);
        myChart.showLoading();
        var id=<?php echo $id; ?>;
        init(id,myChart);
        $('#random').click(function(){
            $.post("<?php echo url('shares/mk'); ?>",{id:id,flag:$('#id').val()},function(response){
                if(response.code){
                    init(id,myChart);
                }else{
                    layer.msg('生成失败',{time:3*1000});
                }
            })
        });
    });
</script>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="/assets/js/require<?php echo \think\Config::get('app_debug')?'':'.min'; ?>.js" data-main="/assets/js/require-backend<?php echo \think\Config::get('app_debug')?'':'.min'; ?>.js?v=<?php echo $site['version']; ?>"></script>
    </body>
</html>