/**
 * 演示程序当前的 “注册/登录” 等操作，是基于 “本地存储” 完成的
 * 当您要参考这个演示程序进行相关 app 的开发时，
 * 请注意将相关方法调整成 “基于服务端Service” 的实现。
 **/
(function($, owner) {
	/**
	 * 用户登录
	 **/
	owner.login = function(loginInfo, callback) {
		callback = callback || $.noop;
		loginInfo = loginInfo || {};
		loginInfo.mobile = loginInfo.mobile || '';
		loginInfo.type = loginInfo.type || '1';
		loginInfo.password = loginInfo.password || '';
		loginInfo.verification = loginInfo.verification || 1;
		if (loginInfo.mobile.length < 1) {
			return callback('账号最短为 1 个字符');
		}
		if (loginInfo.password.length < 1) {
			return callback('密码最短为 1 个字符');
		}
		mui.ajax('http://180.76.233.59:83/rider/login',{
				data:{
					mobile:loginInfo.mobile,
					password:loginInfo.password,
					type:loginInfo.type,
					verification:loginInfo.verification
				},
				dataType:'json',//服务器返回json格式数据
				type:'post',//HTTP请求类型
				timeout:10000,//超时时间设置为10秒；
				headers:{'Content-Type':'application/json'},	              
				success:function(data){
					if(data['status']==0&&data['msg']=="success")
					{
						return owner.createState(loginInfo.mobile,data['rider_id'],callback);
					}
					else{
						return callback('用户名或密码错误');
					}
				},
				error:function(xhr,type,errorThrown){
					//异常处理；
					console.log(type);
					return callback('异常！'+type);
				}
		});
	};

	owner.createState = function(name,uid,callback) {
		var state = owner.getState();
		state.name = name;
		state.uid = uid;
		owner.setState(state);
		return callback();
	};

	/**
	 * 新用户注册
	 **/
	owner.reg = function(regInfo, callback) {
		callback = callback || $.noop;
		regInfo = regInfo || {};
		regInfo.name = regInfo.name || '';
		regInfo.mobile = regInfo.mobile || '';
		regInfo.verification = regInfo.verification || '';
		regInfo.password = regInfo.password || '';
		
		if (regInfo.name.length < 1) {
			return callback('用户昵称最短需要 1 个字符');
		}
		if (!checkmobile(regInfo.mobile)) {
			return callback('手机号不合法');
		}
		if (regInfo.password.length < 1) {
			return callback('密码最短需要 1 个字符');
		}
		if (regInfo.verification.length != 4) {
			return callback('验证码需要 4 个字符');
		}
		if (regInfo.verification.length != 4) {
			return callback('验证码需要 4 个字符');
		}
		if (regInfo.license_num.length != 15 && regInfo.license_num.length != 18) {
			return callback('身份证应该是15或者18位');
		}
		mui.ajax('http://180.76.233.59:83/rider/register',{
				data:{
					name:regInfo.name,
					mobile: regInfo.mobile,
					verification: regInfo.verification,
					sex: regInfo.sex,
					license_num: regInfo.license_num,
					password: regInfo.password,
					region_id: regInfo.region_id,
					id_front: regInfo.id_front,
					id_back: regInfo.id_back
				},
				dataType:'json',
				type:'post',
				timeout:10000,
				headers:{'Content-Type':'application/json'},	              
				success:function(data){
					if(data['status']==0&&data['msg']=="success")
					{
						console.log("aaaa"+data['msg']);
						return owner.createState(loginInfo.mobile,data['user_id'],callback);
					}
					else{
						return callback('注册失败');
					}
				},
				error:function(xhr,type,errorThrown){
					//异常处理；
					console.log(errorThrown);
					return callback('异常！'+type);
				}
		});
		return callback();
	};

	/**
	 * 获取当前状态
	 **/
	owner.getState = function() {
		var stateText = localStorage.getItem('$state') || "{}";
		return JSON.parse(stateText);
	};

	/**
	 * 设置当前状态
	 **/
	owner.setState = function(state) {
		state = state || {};
		localStorage.setItem('$state', JSON.stringify(state));
		//var settings = owner.getSettings();
		//settings.gestures = '';
		//owner.setSettings(settings);
	};

	var checkmobile = function(mobile) {
		mobile = mobile || '';
		return (mobile.length == 11);
	};

	/**
	 * 找回密码
	 **/
	owner.forgetPassword = function(mobile, callback) {
		callback = callback || $.noop;
		if (!checkmobile(mobile)) {
			return callback('手机号码不合法');
		}
		return callback(null, '验证码已发送。');
	};

	/**
	 * 获取应用本地配置
	 **/
	owner.setSettings = function(settings) {
		settings = settings || {};
		localStorage.setItem('$settings', JSON.stringify(settings));
	}

	/**
	 * 设置应用本地配置
	 **/
	owner.getSettings = function() {
			var settingsText = localStorage.getItem('$settings') || "{}";
			return JSON.parse(settingsText);
		}
		/**
		 * 获取本地是否安装客户端
		 **/
	owner.isInstalled = function(id) {
		if (id === 'qihoo' && mui.os.plus) {
			return true;
		}
		if (mui.os.android) {
			var main = plus.android.runtimeMainActivity();
			var packageManager = main.getPackageManager();
			var PackageManager = plus.android.importClass(packageManager)
			var packageName = {
				"qq": "com.tencent.mobileqq",
				"weixin": "com.tencent.mm",
				"sinaweibo": "com.sina.weibo"
			}
			try {
				return packageManager.getPackageInfo(packageName[id], PackageManager.GET_ACTIVITIES);
			} catch (e) {}
		} else {
			switch (id) {
				case "qq":
					var TencentOAuth = plus.ios.import("TencentOAuth");
					return TencentOAuth.iphoneQQInstalled();
				case "weixin":
					var WXApi = plus.ios.import("WXApi");
					return WXApi.isWXAppInstalled()
				case "sinaweibo":
					var SinaAPI = plus.ios.import("WeiboSDK");
					return SinaAPI.isWeiboAppInstalled()
				default:
					break;
			}
		}
	}
	owner.getImage=function(eid){
	var imgUrl;
	
	var camera = plus.camera.getCamera();
	//生成时间戳  
	var timestamp = Date.parse(new Date());
	camera.captureImage(function(e) {
	plus.io.resolveLocalFileSystemURL(e,function(entry){
	console.log('获取图片地址'+entry);
	imgUrl = entry.toLocalURL();
	var image1 = new Image();
	image1.src = imgUrl;
	image1.onload =function(){
		document.getElementById(eid).value = app.getBase64Image(image1);
	}
	console.log("imgURL  "+imgUrl);
	/*调用上传图片方法*/
	},function(e){
	console.log("读取拍照文件错误：" + e.message);
	mui.alert("读取拍照文件错误");
	},function(e){
	console.log("调用摄像头异常：" + e.message);
	mui.alert("调用摄像头异常");
	},{
	filename: timestamp+"-img.png"
	});
	});
	return imgUrl;
	}
	owner.galleryImg=function(eid) {
	var imgUrl;
	console.log("打开相册");
	//生成时间戳  
	var timestamp = Date.parse(new Date());
	plus.gallery.pick(function(img) {
	console.log("选取图片相册");
	plus.io.resolveLocalFileSystemURL(img,function(entry){
	console.log("获取图片地址");
	imgUrl = entry.toLocalURL();
	var image1 = new Image();
	image1.src = imgUrl;
	image1.onload =function(){
		document.getElementById(eid).value = app.getBase64Image(image1);
	}
	/*调用上传图片方法*/
	},function(e){
	console.log("读取图片错误：" + e.message);
	mui.alert("读取图片错误");
	},function(e){
	console.log("选取图片异常：" + e.message);
	mui.alert("选取图片异常");
	},{
	filename: timestamp+"-img.png"
	});
	});
	return imgUrl;
	};
	//将图片压缩转成base64
	owner.getBase64Image=function(img) {
	//绘制图形
	var canvas = document.createElement("canvas");
	var width = img.width;
	
	var height = img.height;
	console.log(width+","+height);
	// 这里对图片大于300*400的进行压缩
	if(width>400){
		height = Math.round(height *= 400 / width);
		width = 400;
	}
	if(height>400){
			width = Math.round(width *= 400 / height);
		height = 400;
	}
	canvas.width = width; /*设置新的图片的宽度*/
	canvas.height = height; /*设置新的图片的长度*/
	var ctx = canvas.getContext("2d");
	ctx.drawImage(img, 0, 0, width, height); /*绘图*/
	var dataURL = canvas.toDataURL("image/png", 0.5);
	console.log(dataURL);
	return dataURL.replace("data:image/png;base64,", "");
	}
}(mui, window.app = {}));