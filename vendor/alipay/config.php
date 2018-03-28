<?php
$config = array (	
		//应用ID,您的APPID。
		'app_id' => "2016090800465178",

		//商户私钥，您的原始格式RSA私钥
		'merchant_private_key' => "MIIEpAIBAAKCAQEAqm99IGRZnFJYOOkyjApQcfiVFbirfTwVki7KXDzTz2KPDKkllzPdvNgiIK61Fk7BV66h1nZg+sKLn3eZ8zbgUwP3TbDfVZinQC3Jr5xkTVFZXopNC0MRd+ByUnHlHSQvEl4rKJLrcGi0ZBFMbLrM8VV29rGzp5R0Iq640FdR+IE9mfhb9UCP9oaeCb9+4nOTcZGcms4ynOXcDWqUY8+5/iDGVk495QKVjut6nbfDJsckruSOxG9+HqM4V7Djo94jtmCa0h97NNq/q9ntl88ZFGEexpU/zHr9s81Id/ETvAuAZd6ZWAue8MjdFRJavsymZRoQz2UhdaPLDDIKAhFlqQIDAQABAoIBAQCO+Hc+dO+28lyPYQ/F6eERujVVw1QX+g8eUaHvPhdwIH1fYYTnEdswTx5RzDycOfR2WUfpX+R6djgpzWqXW7FR8kHCKl0usJ+cdsx5Q/ff5B3T8LAwglJk/SLphiFsEK5r+hK6NoTKBwtL5jb1/r1stQTWbLsIGMBTV74xBw78Jg90RkTSYzW+0TEcg7AKicNHCRlIeKWKncroF16rikPaUwUw9lVhSDuhBnSeA1UpNFN/jlZtuitlpikamFQEztGaTbiP4KCXN6rn78EG935wavLIZsPekVgM1UTwPr/BwiICLxj96nqplonutd0+cunlCjJVrG5LkeBfLcko56sBAoGBANrE01hsldTyMBdWQFwmQvAH1AO4+NgFFyl+wsWFNhGzyaLEeD7//JgKhBWfiYmUGkY3fH1e3L8/cdPDUx/HLBZxY7b1kZ6b85uxg/fkKp46f3PJrv++jfCZLuCN+6DkPO1ottAldXDX9iamLA6ciPsTWNlW0XkmT8u0cAjkWuPjAoGBAMdw6Iw17b9ULODJ5n2QtTF9pn/EPu/i5Kab6CYtFk62tqgrorTgHf7QsALGMKs1pgemVhWWXxIrZ5BilxDp8blVh/pfkOoL03YVoSsXN2EJEvm5bX6dLN8Rd5SXY8p1c4LgKvAHW4Emv/7T7f2Cv3VEGesHe8wcEVWKWv/RfX4DAoGAD63Vm9vEbUuiSLnkyPXxDDTzbATgyNKsk0vDd9aRRnmFNQYxvAoqt1bhmo8hk1uq+mdVo8KdvZM1fEDef0OOFFmyFNXKxvxUXE8/rw+KQmbc5ZaJ1Uh58cl4w51JcIGLIFTF7WsR3LGNsb1tIOr1IlGDp6gCQVWOmIHpGaoMHZMCgYEAv4zRzNh+36QY9kzz8uVpIX9syonRaNSihuJ2tTPYmQEjraE7RD18kaAdbIytccK1E+POCi3CYdEORr5qGPSYFUjwsKfYpvF0x5U+lgRWS/xLHU3avCB5WEWOdEhyr6DesHRcyOxIFmMBQ96IVVOeTyJ5QiKN5BuRCnc3rzulK8ECgYA/pvnntYmTMu+w9lFTUfbUj//SohLKXxOXuxkUXlhaxM00GwrkEF8kyT0xiQE7ui+JgLtmPkwyOM6pu33K6UmFZV2BEVHC+ZY+30eWM6TDY5mOnp/pvZ6v0jKOTbkvDsbJ0QujWug1rrbgTo5fBh/knOFdH+jmMuwOPZMHuH966w==",
		
		//异步通知地址
		'notify_url' => "http://wap.huamie.com/pay/alipaynotify_test.html",
		
		//同步跳转
		'return_url' => "http://wap.huamie.com",

		//编码格式
		'charset' => "UTF-8",

		//签名方式
		'sign_type'=>"RSA2",

		//支付宝网关
		'gatewayUrl' => "https://openapi.alipaydev.com/gateway.do",

		//支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
		'alipay_public_key' => "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAnaqRvu6doBV8D+89nhg/7kkpbZIzvNkZbnkGuCaVF614XvlPsG+DwCYWYPIDhjouZJafqLZvImvFXn7DcBS9l9y+Ng6qZKZCgmpCyZMxBvFlLOMp34ihCq84CzMmoRz+EsGYYGTC0/9UVzpJXD8BIw/IUNcZf7NcZH/UBRlAzDekLYM1DxhqtgkdhoAV/K+gd8Zaf3Q1Z5SiSbzAbWiLe6WNRWKnMHa4XiTmmafd9v9sujh+3a+Isknh2+xF3DJ+YktGXO21Ec0KalUqp9XPMAepmO/iEzyO/B7MHsIT8rYcjubd6fssWJvxddigBuq93SYssVmsGl+84bMe4ZFmkQIDAQAB",
		
	
);