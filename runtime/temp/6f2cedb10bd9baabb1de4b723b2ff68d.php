<?php if (!defined('THINK_PATH')) exit(); /*a:4:{s:59:"E:\app_mt\public/../application/admin\view\shares\edit.html";i:1522027161;s:52:"E:\app_mt\application\admin\view\layout\default.html";i:1521100758;s:49:"E:\app_mt\application\admin\view\common\meta.html";i:1521100758;s:51:"E:\app_mt\application\admin\view\common\script.html";i:1521100758;}*/ ?>
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
                                <form id="edit-form" class="form-horizontal" role="form" data-toggle="validator" method="POST" action="">

    <div class="form-group">
        <label for="c-code" class="control-label col-xs-12 col-sm-2"><?php echo __('Code'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-code" data-rule="required" data-multiple="false" data-source="category/selectpage" class="form-control selectpage" name="row[cid]" type="text" value="<?php echo $row['code']; ?>">
        </div>
    </div>
    <div class="form-group">
        <label for="c-date" class="control-label col-xs-12 col-sm-2"><?php echo __('Date'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-date" data-rule="required" class="form-control datetimepicker" data-date-format="YYYY-MM-DD"  name="row[date]" type="text" value="<?php echo $row['date']; ?>">
        </div>
    </div>
    <div class="form-group">
        <label for="c-open_price" class="control-label col-xs-12 col-sm-2"><?php echo __('Open_price'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-open_price" data-rule="required" class="form-control" step="0.01" name="row[open_price]" type="number" value="<?php echo $row['open_price']; ?>">
        </div>
    </div>
    <div class="form-group">
        <label for="c-end_price" class="control-label col-xs-12 col-sm-2">收盘价格:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-end_price" data-rule="required" class="form-control" step="0.01" name="row[endprice]" type="number" value="<?php echo $row['end_price']; ?>">
        </div>
    </div>
    <div class="form-group">
        <label for="c-maxPrice" class="control-label col-xs-12 col-sm-2"><?php echo __('Maxprice'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-maxPrice" data-rule="required" class="form-control" step="0.01" name="row[maxPrice]" type="number" value="<?php echo $row['maxPrice']; ?>">
        </div>
    </div>
    <div class="form-group">
        <label for="c-minPrice" class="control-label col-xs-12 col-sm-2"><?php echo __('Minprice'); ?>:</label>
        <div class="col-xs-12 col-sm-8">
            <input id="c-minPrice" data-rule="required" class="form-control" step="0.01" name="row[minPrice]" type="number" value="<?php echo $row['minPrice']; ?>">
        </div>
    </div>
    <div class="form-group layer-footer">
        <label class="control-label col-xs-12 col-sm-2"></label>
        <div class="col-xs-12 col-sm-8">
            <button type="submit" class="btn btn-success btn-embossed disabled"><?php echo __('OK'); ?></button>
            <button type="reset" class="btn btn-default btn-embossed"><?php echo __('Reset'); ?></button>
        </div>
    </div>
</form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="/assets/js/require<?php echo \think\Config::get('app_debug')?'':'.min'; ?>.js" data-main="/assets/js/require-backend<?php echo \think\Config::get('app_debug')?'':'.min'; ?>.js?v=<?php echo $site['version']; ?>"></script>
    </body>
</html>