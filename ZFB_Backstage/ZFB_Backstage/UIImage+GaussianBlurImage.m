//
//  UIImage+GaussianBlurImage.m
//  ProjectDemo
//
//  Created by 税鸽飞腾 on 2018/11/12.
//  Copyright © 2018 LWJ. All rights reserved.
//

#import "UIImage+GaussianBlurImage.h"

@implementation UIImage (GaussianBlurImage)
+ (UIImage *)coreGaussianBlurImage:(UIImage * _Nonnull)image  blurNumber:(CGFloat)blur{
    
    if (!image) {
        return nil;
    }
    CIContext *context = [CIContext contextWithOptions:nil];
    CIImage *inputImage = [CIImage imageWithCGImage:image.CGImage];
    
    CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [filter setValue:inputImage forKey:kCIInputImageKey];
    [filter setValue:[NSNumber numberWithFloat:blur] forKey:@"inputRadius"];
    CIImage *result = [filter valueForKey:kCIOutputImageKey];
    CGImageRef cgImage = [context createCGImage:result fromRect:[inputImage extent]];
    
    UIImage *blurImage = [UIImage imageWithCGImage:cgImage];
    
    CGImageRelease(cgImage);
    
    return blurImage;
    
}
@end
