# JTAliPay
JTAliPay 基于eros的weex支付宝支付插件

##  安装方式
####1、引入方式
<pre>
	pod 'JTAliPay', :git => 'https://github.com/JTCloudPlugin/JTAliPay.git', :tag => '1.0.0'
</pre>

####2、配置


 打开xcode工程,在AppDelegate.m文件中引入如下代码
 
 ![](https://github.com/JTCloudPlugin/JTAliPay/blob/master/Assets/1.png) 
 
 <pre>
  - (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    [JTAliPayer handleCallback:url];
    return YES;
}

// NOTE: 9.0以后使用新API接口
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString*, id> *)options
{
    [JTAliPayer handleCallback:url];
    return YES;
}
 </pre>


 添加info plist的 URL Scheme ，修改为JTErosAliPay
 ![](https://github.com/JTCloudPlugin/JTAliPay/blob/master/Assets/2.png)
 
<b>3、调用方式</b>


<pre>
	const alpay = weex.requireModule("JTAliPayModule");
  
   	//signedString 为服务器对订单加签后返回的字符串
   	alpay.aliPay(signedString,callback=>{
        console.log("callback:"+JSON.stringify(callback));
    });

</pre>
 
