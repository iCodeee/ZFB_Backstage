//
//  AppDelegate.m
//  ZFB_Backstage
//
//  Created by 税鸽飞腾 on 2018/11/13.
//  Copyright © 2018 LWJ. All rights reserved.
//

#import "AppDelegate.h"
#import "WindowAboveBackgroundView.h"
#import <objc/runtime.h>
#import "UIImage+GaussianBlurImage.h"
#import "Screenshots.h"

@interface AppDelegate ()
@property (nonatomic,strong)WindowAboveBackgroundView *bgView;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    UINavigationController *naVC = [[UINavigationController alloc]initWithRootViewController:self.window.rootViewController];
    self.window.rootViewController = naVC;
   
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
#pragma mark - 回到后台的时候截取当前屏幕
    [[Screenshots sharedScreenshots]dataWithScreenshotInPNGFormat];
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     self.bgView = [WindowAboveBackgroundView new];
     [self.bgView show];
    
    
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    [self.bgView hidden];

}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
//- (UIViewController *)getCurrentVC {
//    UIViewController *result = nil;
//    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
//    if (window.windowLevel != UIWindowLevelNormal) {
//        NSArray *windows = [[UIApplication sharedApplication] windows];
//        for(UIWindow * tmpWin in windows) {
//            if (tmpWin.windowLevel == UIWindowLevelNormal) {
//                window = tmpWin;
//                break;
//            }
//        }
//    }
//    UIView *frontView = [[window subviews] objectAtIndex:0];
//    id nextResponder = [frontView nextResponder];
//    if ([nextResponder isKindOfClass:[UIViewController class]]) {
//        result = nextResponder;
//    } else {
//        result = window.rootViewController;
//    }
//    return result;
//}





@end
