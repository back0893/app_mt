<?php

return array (
  'name' => 'FastAdmin',
  'beian' => '',
  'cdnurl' => '',
  'version' => '1.0.1',
  'timezone' => 'Asia/Shanghai',
  'forbiddenip' => '',
  'languages' => 
  array (
    'backend' => 'zh-cn',
    'frontend' => 'zh-cn',
  ),
  'fixedpage' => 'dashboard',
  'categorytype' => [
      'metal'=>'贵金属',
      'exchange'=>'外汇',
      'shares'=>'股票',

  ],
  'configgroup' =>
  array (
    'basic' => 'Basic',
    'email' => 'Email',
    'dictionary' => 'Dictionary',
    'user' => 'User',
    'example' => '出入金设置',
  ),
  'mail_type' => '1',
  'mail_smtp_host' => 'smtp.qq.com',
  'mail_smtp_port' => '465',
  'mail_smtp_user' => '10000',
  'mail_smtp_pass' => 'password',
  'mail_verify_type' => '2',
  'mail_from' => '10000@qq.com',
  'maxOutMoney' => '0',
  'maxOutCount' => '0',
  'limitMoney' => '50',
);