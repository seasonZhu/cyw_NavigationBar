//
//  DrawLayerViewController.m
//  Demo
//
//  Created by 陈友文 on 2018/8/20.
//  Copyright © 2018年 陈友文. All rights reserved.
//

#import "DrawLayerViewController.h"
#define WIDTH 100
@interface DrawLayerViewController ()<CALayerDelegate>

@property (nonatomic, weak) CALayer *pictureLayer;

@end

@implementation DrawLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addLayer];
}


-(void)addLayer{
    
    CALayer *showLayer = [[CALayer alloc] init];
    showLayer.position = self.view.center;
    showLayer.bounds = CGRectMake(0, 0, WIDTH, WIDTH);
    showLayer.shadowColor=[UIColor grayColor].CGColor;
    showLayer.shadowOffset=CGSizeMake(2, 1);
    showLayer.shadowOpacity=1;
    showLayer.borderWidth = 2;
    showLayer.borderColor = [UIColor orangeColor].CGColor;
    showLayer.cornerRadius = WIDTH / 2;
    [self.view.layer addSublayer:showLayer];
    
    CALayer *layer = [[CALayer alloc] init];
    layer.position = self.view.center;
    layer.bounds = CGRectMake(0, 0, WIDTH, WIDTH);
    layer.backgroundColor = [UIColor orangeColor].CGColor;
    layer.cornerRadius = WIDTH / 2;
    layer.masksToBounds = YES;
    layer.borderWidth = 2;
    layer.borderColor = [UIColor orangeColor].CGColor;
    layer.delegate = self;
    [self.view.layer addSublayer:layer];
    
    self.pictureLayer = layer;
    
    //必须调用此方法
    [layer setNeedsDisplay];
    
    
}

#pragma mark- CALayerDelegate的代理方法
- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{
    CGContextSaveGState(ctx);
    
//    解决图像倒立问题
    CGContextScaleCTM(ctx, 1, -1);
    CGContextTranslateCTM(ctx, 0, -WIDTH);
    
    UIImage *image = [UIImage imageNamed:@"头像"];
    CGContextDrawImage(ctx, CGRectMake(0, 0, WIDTH, WIDTH), image.CGImage);
    
    CGContextRestoreGState(ctx);
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    // 这个方法是没有效果的
//    for (CALayer *layer in self.view.layer.sublayers) {
//        if ([layer isEqual:self.pictureLayer]) {
//            NSLog(@"我点击的是头像区域");
//        }
//    }
    
    UITouch *touch = touches.anyObject;
    CGPoint point = [touch locationInView:self.view];
    
    if (CGRectContainsPoint(self.pictureLayer.frame, point)) {
        NSLog(@"我点击的是头像区域");
    }
    
    
}


@end
