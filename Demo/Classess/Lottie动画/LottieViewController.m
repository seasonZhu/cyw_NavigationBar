//
//  LottieViewController.m
//  Demo
//
//  Created by 陈友文 on 2018/8/9.
//  Copyright © 2018年 陈友文. All rights reserved.
//

#import "LottieViewController.h"
#import <Lottie/Lottie.h>


@interface LottieViewController ()

@end

@implementation LottieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 这个LOTAnimationView既可以加载本地json,也可以从网络上获取
    LOTAnimationView *animationView =  [[LOTAnimationView alloc] initWithContentsOfURL:[NSURL URLWithString:@"http://cdn.trojx.me/blog_raw/lottie_data_origin.json"]];//[LOTAnimationView animationNamed:@"LottieLogo1"];
    
//    animationView.center = self.view.center;
//    animationView.bounds.size = CGSizeMake(200, 200);
    animationView.frame = self.view.frame;
//    animationView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:animationView];
    [animationView play];
    animationView.loopAnimation = YES;
}



@end
