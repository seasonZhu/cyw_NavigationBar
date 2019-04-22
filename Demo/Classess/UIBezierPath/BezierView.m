//
//  BezierView.m
//  Demo
//
//  Created by 陈友文 on 2018/8/22.
//  Copyright © 2018年 陈友文. All rights reserved.
//

#import "BezierView.h"

@interface BezierView()

@property (nonatomic,strong)UIBezierPath *path;
@end

@implementation BezierView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
   
    
//    [self setNeedsDisplay];
    [self draw04];
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.path = [UIBezierPath bezierPath];
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGes:)];
        pan.minimumNumberOfTouches = pan.maximumNumberOfTouches = 1;
        [self addGestureRecognizer:pan];
    }
    return self;
}

//绘制矩形
-(void)draw01{
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(200, 200, 200, 200)];
    [path setLineWidth:5];
    [[UIColor redColor] setFill]; //  这个使用用来把内部颜色涂满的
    [[UIColor greenColor] setStroke]; // 这个是用来绘制边框的
    [path fill];
    [path stroke];
}

-(void)draw02{
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(200, 200) radius:100 startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    [[UIColor grayColor] setFill];
    [path fill];
    
}

-(void)draw03{
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    //  贝塞尔曲线进行绘画的时候, 你可以这么想象 绘笔先到 100,100这个点 ,然后划线到 200, 300, 然后再从200, 300出发, 到300, 300 以此类推
    [path moveToPoint:CGPointMake(100, 100)];
    [path addLineToPoint:CGPointMake(200, 300)];
    [path addLineToPoint:CGPointMake(300, 300)];
    [path addLineToPoint:CGPointMake(100, 400)];
    [path addLineToPoint:CGPointMake(100, 300)];
    
    [path setLineWidth:10];
    /**
     kCGLineCapButt, butt 笑柄；烟头；屁股；靶垛；粗大的一端的意思 但是感觉和Square很像
     kCGLineCapRound, 圆角风格
     kCGLineCapSquare 棱角风格
     */
    [path setLineCapStyle:kCGLineCapRound]; // 笔画的风格
    
    /**
     kCGLineJoinMiter, 锐角
     kCGLineJoinRound, 圆角
     kCGLineJoinBevel, 平角
     */
    [path setLineJoinStyle:kCGLineJoinBevel]; // 笔画与笔画间的衔接的风格
    [path stroke];
    [path closePath];
}

-(void)draw04{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(100, 100)];
//    [path addQuadCurveToPoint:CGPointMake(200, 200) controlPoint:CGPointMake(100, 200)];
    
    [path addCurveToPoint:CGPointMake(350, 250) controlPoint1:CGPointMake(310, 200) controlPoint2:CGPointMake(210, 400)];
    [path stroke];
}

-(void)draw05{
    [[UIColor greenColor] setStroke];
    [self.path stroke];
}

-(void)panGes:(UIPanGestureRecognizer *)pan{
    CGPoint point = [pan locationInView:self];
    if (pan.state == UIGestureRecognizerStateBegan) {
        [self.path moveToPoint:point];
    }else if (pan.state == UIGestureRecognizerStateChanged){
        [self.path addLineToPoint:point];
    }
    
    //  动态绘制线的时候需要调用这个方法 这样线才会显示出来
    [self setNeedsDisplay];
}


static CGPoint midpoint(CGPoint p0, CGPoint p1) {
    return (CGPoint) {
        (p0.x + p1.x) / 2.0,
        (p0.y + p1.y) / 2.0
    };
}
@end
