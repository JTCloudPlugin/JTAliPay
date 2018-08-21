//
//  JTAliPayer.m
//  WeexEros
//
//  Created by Xiaoneng on 2018/6/26.
//  Copyright © 2018年 benmu. All rights reserved.
//

#import "JTAliPayer.h"
#import <WeexPluginLoader/WeexPluginLoader/WeexPluginLoader.h>
#import <AlipaySDK/AlipaySDK.h>


static WXModuleCallback _payCallBack;

WX_PlUGIN_EXPORT_MODULE(JTAliPayModule, JTAliPayer)
@implementation JTAliPayer

@synthesize weexInstance;

WX_EXPORT_METHOD(@selector(aliPay:callback:))
- (void)aliPay:(NSString*)signedString callback:(WXModuleCallback)callback;
{
    _payCallBack = callback;
    
    // NOTE: 如果加签成功，则继续执行支付
    if (signedString != nil) {
        //应用注册scheme,在AliSDKDemo-Info.plist定义URL types
        NSString *appScheme = @"JTErosAliPay";
        
        // NOTE: 调用支付结果开始支付
        [[AlipaySDK defaultService] payOrder:signedString fromScheme:appScheme callback:^(NSDictionary *resultDic)
        {
            callback(@[resultDic]);
        }];
    }
}

+ (void)handleResult:(NSDictionary *)resultDic
{
    _payCallBack(@[resultDic]);
}

+(void) handleCallback:(NSURL *)url
{
    //如果极简开发包不可用，会跳转支付宝钱包进行支付，需要将支付宝钱包的支付结果回传给开发包
    if ([url.host isEqualToString:@"safepay"]) {
        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
            //【由于在跳转支付宝客户端支付的过程中，商户app在后台很可能被系统kill了，所以pay接口的callback就会失效，请商户对standbyCallback返回的回调结果进行处理,就是在这个方法里面处理跟callback一样的逻辑】
            [self handleResult:resultDic];
        }];
    }
    if ([url.host isEqualToString:@"platformapi"]){//支付宝钱包快登授权返回authCode
        
        [[AlipaySDK defaultService] processAuthResult:url standbyCallback:^(NSDictionary *resultDic) {
            //【由于在跳转支付宝客户端支付的过程中，商户app在后台很可能被系统kill了，所以pay接口的callback就会失效，请商户对standbyCallback返回的回调结果进行处理,就是在这个方法里面处理跟callback一样的逻辑】
            [self handleResult:resultDic];
        }];
    }
}


@end
