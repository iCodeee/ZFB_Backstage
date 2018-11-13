//
//  WindowAboveBackgroundView.m
//  ProjectDemo
//
//  Created by 税鸽飞腾 on 2018/11/12.
//  Copyright © 2018 LWJ. All rights reserved.
//

#import "WindowAboveBackgroundView.h"
#import "UIImage+GaussianBlurImage.h"
#import "Screenshots.h"
@implementation WindowAboveBackgroundView

- (instancetype)init{
    
    self = [super init];
    if (self) {
        self.frame = [UIScreen mainScreen].bounds;
        self.backgroundColor = [UIColor clearColor];
        [self BlurEffect];
    }
    
    return self;
}
#pragma mark - 设置磨砂效果
- (void)BlurEffect{
    
#pragma mark - 从沙盒里面读取截屏的图片
    UIImage *screenShotsJPG = [[Screenshots sharedScreenshots]readFile];
    UIImage *GaussianBlurImage = [UIImage coreGaussianBlurImage:screenShotsJPG blurNumber:9];
    
    UIImageView *imageView = [[UIImageView alloc]init];
    [self addSubview:imageView];
    imageView.frame = self.frame;
    imageView.image = GaussianBlurImage;
}
- (void)show{
    UIWindow *window =[[[UIApplication sharedApplication]delegate]window];
    [window addSubview:self];
}
- (void)hidden{
        [self removeFromSuperview];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
