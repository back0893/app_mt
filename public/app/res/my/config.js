var config={
	domain:'http://mtapp.cc/',
	default_icon:'https://tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg',
	logout:function(){
		var logout=document.getElementById('logout');
		if(logout){
			logout.onclick=function(){
				localStorage.clear();
				location.href='/user/login.html';
			};
		}
	}
}
config.logout();
