//
//  ViewController.m
//  ZFB_Backstage
//
//  Created by 税鸽飞腾 on 2018/11/13.
//  Copyright © 2018 LWJ. All rights reserved.
//

#import "ViewController.h"
#import "NextVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIBarButtonItem *rightBarbtn = [[UIBarButtonItem alloc]initWithTitle:@"next" style:UIBarButtonItemStylePlain target:self action:@selector(nextAction)];
    rightBarbtn.tintColor = [UIColor blackColor];
    self.navigationItem.rightBarButtonItem = rightBarbtn;
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:imageView];
    imageView.image = [UIImage imageNamed:@"zfb.jpeg"];
}

- (void)nextAction{
    
    NextVC *VC = [NextVC new];
    [self.navigationController pushViewController:VC animated:YES];
    
}

@end
