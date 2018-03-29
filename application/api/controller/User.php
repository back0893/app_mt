<?php

namespace app\api\controller;

use app\api\model\Bank;
use app\common\controller\Api;
use app\common\library\Email;
use app\common\library\Sms;
use fast\Random;
use think\captcha\Captcha;
use think\Validate;

/**
 * 会员接口
 */
class User extends Api
{

    protected $noNeedLogin = ['login','l', 'mobilelogin', 'register', 'resetpwd', 'changeemail', 'changemobile', 'third','chapter'];
    protected $noNeedRight = '*';

    public function _initialize()
    {
        parent::_initialize();
    }

    /**
     * 会员中心
     */
    public function index()
    {
        $this->success('', ['welcome' => $this->auth->nickname]);
    }

    /**
     * 会员登录
     * 
     * @param string $account 账号
     * @param string $password 密码
     */
    public function login()
    {
        $account = $this->request->request('account');
        $password = $this->request->request('password');
        if (!$account || !$password)
        {
            $this->error(__('Invalid parameters'));
        }
        $ret = $this->auth->login($account, $password);
        if ($ret)
        {
            $data = ['userinfo' => $this->auth->getUserinfo()];
            $row=Bank::get(['uid'=>$this->auth->id]);
            $bank=$row->allowField(['code','name','user_code'])
                ->toArray();
            $data['bank']=$bank;
            $this->success(__('Logged in successful'), $data);
        }
        else
        {
            $this->error($this->auth->getError());
        }
    }

    /**
     * 手机验证码登录
     * 
     * @param string $mobile 手机号
     * @param string $captcha 验证码
     */
    public function mobilelogin()
    {
        $mobile = $this->request->request('mobile');
        $captcha = $this->request->request('captcha');
        if (!$mobile || !$captcha)
        {
            $this->error(__('Invalid parameters'));
        }
        if (!Validate::regex($mobile, "^1\d{10}$"))
        {
            $this->error(__('Mobile is incorrect'));
        }
        if (!Sms::check($mobile, $captcha, 'mobilelogin'))
        {
            $this->error(__('Captcha is incorrect'));
        }
        $user = \app\common\model\User::getByMobile($mobile);
        if ($user)
        {
            //如果已经有账号则直接登录
            $ret = $this->auth->direct($user->id);
        }
        else
        {
            $ret = $this->auth->register($mobile, Random::alnum(), '', $mobile, []);
        }
        if ($ret)
        {
            Sms::flush($mobile, 'mobilelogin');
            $data = ['userinfo' => $this->auth->getUserinfo()];
            $this->success(__('Logged in successful'), $data);
        }
        else
        {
            $this->error($this->auth->getError());
        }
    }

    /**
     * 注册会员
     * 
     * @param string $username 用户名
     * @param string $password 密码
     * @param string $email 邮箱
     * @param string $mobile 手机号
     */
    public function register()
    {
        $username = $this->request->request('username');
        $password = $this->request->request('password');
        $email = $this->request->request('email');
        $mobile = $this->request->request('mobile');
        if (!$username || !$password)
        {
            $this->error(__('Invalid parameters'));
        }
        if ($email && !Validate::is($email, "email"))
        {
            $this->error(__('Email is incorrect'));
        }
        if ($mobile && !Validate::regex($mobile, "^1\d{10}$"))
        {
            $this->error(__('Mobile is incorrect'));
        }
        $ret = $this->auth->register($username, $password, $email, $mobile, []);
        if ($ret)
        {
            $data = ['userinfo' => $this->auth->getUserinfo()];
            $this->success(__('Sign up successful'), $data);
        }
        else
        {
            $this->error($this->auth->getError());
        }
    }

    /**
     * 注销登录
     */
    public function logout()
    {
        $this->auth->logout();
        $this->success(__('Logout successful'));
    }

    /**
     * 修改会员个人信息
     * 
     * @param string $avatar 头像地址
     * @param string $username 用户名
     * @param string $nickname 昵称
     * @param string $bio 个人简介
     */
    public function profile()
    {
        $user = $this->auth->getUser();
        $email = $this->request->request('email');
        $data=input('','','trim');
        $exists = \app\common\model\User::where('email', $email)->where('id', '<>', $this->auth->id)->find();
        if ($exists)
        {
            $this->error('邮箱重复');
        }
        $user->allowField('bio,birthday,email,gender,nickname')
            ->save($data);
        $this->success('成功');
    }

    /**
     * 修改邮箱
     * 
     * @param string $email 邮箱
     */
    public function changeemail()
    {
        $user = $this->auth->getUser();
        $email = $this->request->post('email');
        if (!$email)
        {
            $this->error(__('Invalid parameters'));
        }
        if (!Validate::is($email, "email"))
        {
            $this->error(__('Email is incorrect'));
        }
        if (\app\common\model\User::where('email', $email)->where('id', '<>', $user->id)->find())
        {
            $this->error(__('Email already exists'));
        }
        $verification = $user->verification;
        $verification->email = 0;
        $user->verification = $verification;
        $user->email = $email;
        $user->save();
        $time = time();
        $code = ['id' => $user->id, 'time' => $time, 'key' => md5(md5($user->id . $user->email . $time) . $user->salt)];
        $code = base64_encode(http_build_query($code));
        $url = url("index/user/activeemail", ['code' => $code], true, true);
        $message = __('Verify email') . "：<a href='{$url}'>{$url}</a>";
        Email::instance()->to($email)->subject(__('Verify email'))->message($message)->send();
        $this->success();
    }

    /**
     * 修改手机号
     * 
     * @param string $email 手机号
     * @param string $captcha 验证码
     */
    public function changemobile()
    {
        $user = $this->auth->getUser();
        $mobile = $this->request->request('mobile');
        $captcha = $this->request->request('captcha');
        if (!$mobile || !$captcha)
        {
            $this->error(__('Invalid parameters'));
        }
        if (!Validate::regex($mobile, "^1\d{10}$"))
        {
            $this->error(__('Mobile is incorrect'));
        }
        if (\app\common\model\User::where('mobile', $mobile)->where('id', '<>', $user->id)->find())
        {
            $this->error(__('Mobile already exists'));
        }
        $result = Sms::check($mobile, $captcha, 'changemobile');
        if (!$result)
        {
            $this->error(__('Captcha is incorrect'));
        }
        $verification = $user->verification;
        $verification->mobile = 1;
        $user->verification = $verification;
        $user->mobile = $mobile;
        $user->save();

        Sms::flush($mobile, 'changemobile');
        $this->success();
    }

    /**
     * 第三方登录
     * 
     * @param string $platform 平台名称
     * @param string $code Code码
     */
    public function third()
    {
        $url = url('user/index');
        $platform = $this->request->request("platform");
        $code = $this->request->request("code");
        $config = get_addon_config('third');
        if (!$config || !isset($config[$platform]))
        {
            $this->error(__('Invalid parameters'));
        }
        $app = new \addons\third\library\Application($config);
        //通过code换access_token和绑定会员
        $result = $app->{$platform}->getUserInfo(['code' => $code]);
        if ($result)
        {
            $loginret = \addons\third\library\Service::connect($platform, $result);
            if ($loginret)
            {
                $data = [
                    'userinfo'  => $this->auth->getUserinfo(),
                    'thirdinfo' => $result
                ];
                $this->success(__('Logged in successful'), $data);
            }
        }
        $this->error(__('Operation failed'), $url);
    }

    /**
     * 重置密码
     * 
     * @param string $mobile 手机号
     * @param string $newpassword 新密码
     * @param string $captcha 验证码
     */
    public function resetpwd()
    {
        $mobile = $this->request->request("mobile");
        $newpassword = $this->request->request("newpassword");
        $captcha = $this->request->request("captcha");
        if (!$mobile || !$newpassword || !$captcha)
        {
            $this->error(__('Invalid parameters'));
        }
        if ($mobile && !Validate::regex($mobile, "^1\d{10}$"))
        {
            $this->error(__('Mobile is incorrect'));
        }
        $user = \app\common\model\User::getByMobile($mobile);
        if (!$user)
        {
            $this->error(__('User not found'));
        }
        $ret = Sms::check($mobile, $captcha, 'resetpwd');
        if (!$ret)
        {
            $this->error(__('Captcha is incorrect'));
        }
        Sms::flush($mobile, 'resetpwd');

        //模拟一次登录
        $this->auth->direct($user->id);
        $ret = $this->auth->changepwd($newpassword, '', true);
        if ($ret)
        {
            $this->success(__('Reset password successful'));
        }
        else
        {
            $this->error($this->auth->getError());
        }
    }
    /**
     * 获取验证码
     */
    public function chapter(){
        $captcha=new Captcha(['length'=>4,'useCurve'=>false]);
        return $captcha->entry();
    }

    /**
     * 修改头像
     */
    public function icon(){
        $path=ROOT_PATH.'public/icon';
        $file=$this->request->file('file');
        if(!empty($file)){
            $path=$file->move($path);
            $icon='/icon/'.$path->getSaveName();
            $user=$this->auth->getUser();
            $r=$user->save(['avatar'=>$icon]);
            if($r!==false){
                return $this->success('成功',['avatar'=>$this->request->domain().$icon]);
            }
        }
        return $this->error('没有图片上传');
    }

    /**
     * 修改密码
     */
    public function updatePassword(){
        $oldPassword=input('nowpass','');
        $newPassword=input('pass','');
        $r=$this->auth->changepwd($newPassword,$oldPassword);
        if($r){
            return $this->success('修改密码成功');
        }
        return $this->error('修改密码失败');
    }
    public function l(){
        $this->auth->direct(2);
        $ret = $this->auth->changepwd('123456', '');
    }

    /**
     * 获取钻出,转入的记录
     * 因为2表的字段长不一样不能使用onion
     */
    public function getIO(){
        $uid=$this->auth->id;
        $where=['uid'=>$uid,'readed'=>0];
        $commings=\app\admin\model\Comming::where($where)
            ->order('date desc')
            ->select();
        $outtings=\app\admin\model\Outting::where($where)
            ->order('date desc')
            ->select();
        $tmp=[];
        foreach ($commings as $comming){
            $tmp[]=['format'=>$comming->format,'date'=>$comming->date,'status'=>"0_{$comming->id}"];
        }
        foreach ($outtings as $outting){
            $tmp[]=['format'=>$outting->format,'date'=>$outting->date,'status'=>"1_{$outting->id}"];
        }
        usort($tmp,function($a,$b){
           return $a['date']<$b['date']?-1:1;
        });
        return $this->success('',$tmp);
    }


    /**
     * 绑定用户银行卡
     */
    public function bindBank(){
        $data=input('','','trim');
        $data['uid']=$this->auth->id;
        $row=Bank::get(['uid'=>$this->auth->id]);
        if(empty($row)){
            $row=new Bank();
        }
        $r=$row->allowField('uid,name,code,user_code,address')
            ->validate(true)
            ->save($data);
        if($r===false){
            return $this->error('绑定失败');
        }
        return $this->success('绑定成功');
    }

    /**
     * 用户资金
     */
    public function money(){
        $userInfo=$this->auth->getUser();
        $free=$userInfo->money;
        return $this->success('',['free'=>$free]);
    }
    public function bindAli(){
        $user=$this->auth->getUser();
        $data=[
            'name'=>input('name','','trim'),
            'payee_account'=>input('payee_account','','trim')
        ];
        $validate=new \app\api\validate\Bank();
        $validate->scene('ali');
        if(!$validate->check($data)){
            return $this->error($validate->getError());
        }
        $model=new Bank();
        $b=$model->where(['uid'=>$user->id])
            ->find();
        if(empty($b)){
            $model->isUpdate(false)
                ->allowField(true)
                ->save($data);
        }else{
            $b->allowField(true)
                ->save($data);
        }
        return $this->success('',$data);
    }
}
