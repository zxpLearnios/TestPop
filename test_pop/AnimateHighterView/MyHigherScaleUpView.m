//
//  MyHigherScaleUpView.m
//  test_pop
//
//  Created by Jingnan Zhang on 15/12/13.
//  Copyright © 2015年 Jingnan Zhang. All rights reserved.
//

#import "MyHigherScaleUpView.h"
#import <pop/POP.h>


@interface MyHigherScaleUpView ()
{
    CGFloat radius ; // 宽高最大值的 一般
    CGFloat scaleUpRadius; //需要放大的圆r
    CAShapeLayer *shapelayer;
    /** 外部由此二者 可得所需时间 = （border - borderLimit）/ 1(s) */
    CGFloat border; //大圆的linwidth
}

@end


@implementation MyHigherScaleUpView

-(instancetype)init{
    self = [super init];
    if (self) {
        [self doInit];
    }
    return self;
}
-(void)awakeFromNib{
    [super awakeFromNib];
    [self doInit];
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self doInit];
    }
    return self;
}
#pragma mark - 初始化
-(void)doInit{
    self.backgroundColor = [UIColor clearColor]; // 以便 之后，不会遮挡小圆
    radius = MAX(self.bounds.size.height, self.bounds.size.width) * 0.5; // 最外面圆的半径，让它大 即可
    scaleUpRadius = MIN(self.bounds.size.height, self.bounds.size.width) * 0.5;
    border = (radius - scaleUpRadius) * 2;

}
-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    
    //1.超出frame的所有类型的内容都不显示
    self.clipsToBounds = YES;
    
     // 2. 以便 重绘，不会导致前后重合
    if (shapelayer) {
        [shapelayer removeFromSuperlayer];
    }
    shapelayer = [CAShapeLayer layer];
    
    // 3. 贝塞尔曲线， 让它根据layer来变化
   UIBezierPath *bezierPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.layer.bounds.size.width * 0.5,
                                                                   self.layer.bounds.size.height * 0.5)
                                                radius:scaleUpRadius
                                            startAngle:0
                                              endAngle:M_PI * 2
                                             clockwise:YES];
    
    // 4. shapeLayer的 设置
    shapelayer.strokeColor   = [UIColor greenColor].CGColor;   // 边缘线的颜色
    shapelayer.fillColor     = [UIColor clearColor].CGColor;   // 闭环填充的颜色
    shapelayer.lineCap       = kCALineCapRound;               // 边缘线的类型
    shapelayer.path          = bezierPath.CGPath; // 从贝塞尔曲线获取到形状

    
    shapelayer.lineWidth     = border;
    shapelayer.strokeStart   = 0; //strokeStart 必须 >= 0
    shapelayer.strokeEnd  = 1; //必须设置<以便从头开始画
    // 5. 添加 shapeLayer
    [self.layer addSublayer:shapelayer];

}

#pragma mark - setter
-(void)setBorderLimit:(CGFloat)borderLimit{
    _borderLimit = borderLimit;
    
}
#pragma mark - 同时，改变大圆的r与 border 即可
/**
 *  因为 radius = scaleUpRadius + border * 0.5;因为时间/间隔由外部控制，故此法中不应写定时器
 */
-(void)scaleUp{
    if (self.borderLimit <= 0) return;
    
        scaleUpRadius += 0.5;
        border -= 1;
      [self setNeedsDisplay];
    if (border <= self.borderLimit) {
        [self removeFromSuperview];
        return;
    }
}
#pragma mark - 以便外界获取 他的边框的宽度，来计算所需的动画时间/时间间隔
-(CGFloat)returnBorder{
    return border;
}
@end
