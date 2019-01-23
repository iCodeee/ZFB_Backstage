//
//  BackgroundFuzzyManage.h
//  ZFB_Backstage
//
//  Created by 杭州任性贸易有限公司 on 2019/1/23.
//  Copyright © 2019年 LWJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BackgroundFuzzyManage : NSObject

+ (BackgroundFuzzyManage *)sharedBackgroundFuzzyManage;

- (void)start;

@end
