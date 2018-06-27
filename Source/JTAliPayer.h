//
//  JTAliPayer.h
//  WeexEros
//
//  Created by Xiaoneng on 2018/6/26.
//  Copyright © 2018年 benmu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WXModuleProtocol.h"
#import <UIKit/UIKit.h>

@interface JTAliPayer : NSObject<WXModuleProtocol>

+ (void)handleCallback:(NSURL *)url;

@end
