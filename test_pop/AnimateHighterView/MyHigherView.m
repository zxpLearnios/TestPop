//
//  动画--View.m
//  test_pop
//
//  Created by Jingnan Zhang on 15/12/11.
//  Copyright © 2015年 Jingnan Zhang. All rights reserved.


#import "MyHigherView.h"
#import <pop/POP.h>
#import "MyHigherScaleUpView.h"
#import "MyHigherScaleDownView.h"


#define  ksuperWidth self.superview.frame.size.width
#define ksuperHeight  self.superview.frame.size.height


@interface MyHigherView ()
{
    CGFloat radius ; // 宽高最大值的 一般
    CGFloat border ; //大圆的linwidth
    CGFloat scaleUpRadius; //需要放大的圆r
    CGFloat scaleDownRadius; // 缩 小的元的r
    MyHigherScaleUpView *scaleUpView; //放大的View，里面装放大的圆
    MyHigherScaleDownView *scaleDownView; //缩小的View，里面装放大的圆

}

@end
@implementation MyHigherView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        radius = MAX(frame.size.width, frame.size.height) * 0.5; // 最外面圆的半径
    }
    return self;
}
-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    
    // 获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [self runAnimationWhenLoadImageDisplay:ctx];
}

-(void)runAnimationWhenLoadImageDisplay:(CGContextRef)ctx{
    
    // 1.先画上一张图片
    UIImage *image = [UIImage imageNamed:@"11"];
    [image drawInRect:self.bounds];
    
//    CGContextSaveGState(ctx);
    
    // 2.画圆：正切于旧图片的圆
    CGPoint center = CGPointMake(self.bounds.size.width * 0.5 , self.bounds.size.height * 0.5);
    CGContextAddArc(ctx, center.x, center.y, radius, 0, M_PI * 2, 0);
    
    // 3.设置裁剪区域,后面画的内容（必须是画到上下文去的,类似于CGContextAddArc的方法）只会显示在此区域
//    CGContextClip(ctx);

    // 5 放大的圆的View
    scaleUpView  =  [[MyHigherScaleUpView alloc]initWithFrame:self.bounds];
    [self addSubview:scaleUpView];
    scaleUpView.borderLimit = 50;
    
    // 每秒  80 次
    CGFloat timeInterval = ([scaleUpView returnBorder] - scaleUpView.borderLimit)/ 80;
    // 5.1 放大
    [NSTimer scheduledTimerWithTimeInterval:1 / 60.0 target:self selector:@selector(scaleUp) userInfo:nil repeats:YES];
    
    // 4.加缩小的 圆
     scaleDownRadius = radius - [scaleUpView returnBorder];   // 小圆的 半径
    scaleDownView = [[MyHigherScaleDownView alloc]init];
    scaleDownView.center = CGPointMake(center.x, center.y);
    scaleDownView.bounds = CGRectMake(0, 0, scaleDownRadius * 2, scaleDownRadius * 2);
    scaleDownView.scaleDownRadius = scaleDownRadius;
    scaleDownView.duration = timeInterval;
    [self addSubview:scaleDownView];
    
    // 4.1 缩小方法
    [scaleDownView scaleDown];

}
#pragma mark - 缩放
-(void)scaleUp{
    [scaleUpView scaleUp];
}


@end
