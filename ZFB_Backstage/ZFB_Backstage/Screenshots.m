//
//  Screenshots.m
//  ZFB_Backstage
//
//  Created by 税鸽飞腾 on 2018/11/13.
//  Copyright © 2018 LWJ. All rights reserved.
//

#import "Screenshots.h"

@implementation Screenshots
+ (Screenshots *)sharedScreenshots{
    static dispatch_once_t onceToken;
   __strong static id _sharedScreenshots = nil;
    dispatch_once(&onceToken, ^{
        _sharedScreenshots = [[Screenshots alloc]init];
    });
    return _sharedScreenshots;
}

#pragma mark - 获得屏幕截图
- (BOOL)dataWithScreenshotInPNGFormat
{
    CGSize imageSize = CGSizeZero;
    UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation;
    if (UIInterfaceOrientationIsPortrait(orientation))
        imageSize = [UIScreen mainScreen].bounds.size;
    else
        imageSize = CGSizeMake([UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width);
    
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    for (UIWindow *window in [[UIApplication sharedApplication] windows])
    {
        CGContextSaveGState(context);
        CGContextTranslateCTM(context, window.center.x, window.center.y);
        CGContextConcatCTM(context, window.transform);
        CGContextTranslateCTM(context, -window.bounds.size.width * window.layer.anchorPoint.x, -window.bounds.size.height * window.layer.anchorPoint.y);
        if (orientation == UIInterfaceOrientationLandscapeLeft)
        {
            CGContextRotateCTM(context, M_PI_2);
            CGContextTranslateCTM(context, 0, -imageSize.width);
        }
        else if (orientation == UIInterfaceOrientationLandscapeRight)
        {
            CGContextRotateCTM(context, -M_PI_2);
            CGContextTranslateCTM(context, -imageSize.height, 0);
        } else if (orientation == UIInterfaceOrientationPortraitUpsideDown) {
            CGContextRotateCTM(context, M_PI);
            CGContextTranslateCTM(context, -imageSize.width, -imageSize.height);
        }
        if ([window respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)])
        {
            [window drawViewHierarchyInRect:window.bounds afterScreenUpdates:YES];
        }
        else
        {
            [window.layer renderInContext:context];
        }
        CGContextRestoreGState(context);
    }
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    NSData *imgData =  UIImagePNGRepresentation(image);
    return [self writeFile:imgData];
}

#pragma mark - 将截屏保存到沙盒
- (BOOL)writeFile:(NSData *)file
{
    NSFileManager *fileManager   = [NSFileManager defaultManager];
    NSArray    *paths            = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    [fileManager changeCurrentDirectoryPath:[documentsDirectory stringByExpandingTildeInPath]];
    NSString *path               = [documentsDirectory stringByAppendingPathComponent:@"pdf.jpg"];
    
    NSError *error;
    BOOL iswriteToFile           = [file writeToFile:path options:NSDataWritingAtomic error:&error];
    
    NSLog(@"56832%@",NSHomeDirectory());
    
    return iswriteToFile;
}

#pragma mark - 读取沙盒里面保存的截图
- (UIImage *)readFile
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    [fileManager changeCurrentDirectoryPath:[documentsDirectory stringByExpandingTildeInPath]];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"pdf.jpg"];
    NSData *imgData = [NSData dataWithContentsOfFile:path];
    UIImage *image = [UIImage imageWithData:imgData];
    return image;
}

@end
