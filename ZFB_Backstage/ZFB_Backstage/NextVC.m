//
//  NextVC.m
//  ZFB_Backstage
//
//  Created by 税鸽飞腾 on 2018/11/13.
//  Copyright © 2018 LWJ. All rights reserved.
//

#import "NextVC.h"

@interface NextVC ()

@end

@implementation NextVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:imageView];
    imageView.image = [UIImage imageNamed:@"next.jpg"];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
