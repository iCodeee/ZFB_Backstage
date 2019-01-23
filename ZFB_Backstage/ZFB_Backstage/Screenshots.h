//
//  Screenshots.h
//  ZFB_Backstage
//
//  Created by 税鸽飞腾 on 2018/11/13.
//  Copyright © 2018 LWJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface Screenshots : NSObject
+ (Screenshots *)sharedScreenshots;
- (BOOL)dataWithScreenshotInPNGFormat;
- (UIImage *)readFile;
@end

NS_ASSUME_NONNULL_END
