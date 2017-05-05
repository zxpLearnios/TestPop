//
//  MyHigherScaleDownView.m
//  test_pop
//
//  Created by Jingnan Zhang on 15/12/13.
//  Copyright © 2015年 Jingnan Zhang. All rights reserved.
//

#import "MyHigherScaleDownView.h"
#import <pop/POP.h>

@interface MyHigherScaleDownView ()
{
    CGFloat  radius ; // 最外面圆的半径，让它大 即可
}

@end
@implementation MyHigherScaleDownView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self doInit];
    }
    return self;
}

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

#pragma mark - 初始化
-(void)doInit{
    self.backgroundColor = [UIColor clearColor]; // 以便 之后，不会遮挡小圆
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    //1. 获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
     // 2. 画圆，填充即可
    [[UIColor redColor] set];
    CGContextAddArc(ctx, self.bounds.size.width * 0.5, self.bounds.size.width * 0.5, self.scaleDownRadius, 0, M_PI * 2, 0);
    CGContextFillPath(ctx);
}

#pragma mark - 缩小 自己，因为所画的圆 大小 == self
-(void)scaleDown{
    if (self.duration <= 0) return; // 没设置时间，则不执行动画
    
    POPBasicAnimation *basic = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    basic.duration = self.duration;
    [basic setCompletionBlock:^(POPAnimation *ani, BOOL finish) {
        if (finish) {
            [self removeFromSuperview]; // 完成后，移除
        }
    }];
    basic.toValue = [NSValue valueWithCGSize:CGSizeMake(0.1, 0.1)];
    [self.layer pop_addAnimation:basic forKey:nil];

}
#pragma mark - setter
-(void)setScaleDownRadius:(CGFloat)scaleDownRadius{
    _scaleDownRadius = scaleDownRadius;
    [self setNeedsDisplay];
    
}
-(void)setDuration:(CGFloat)duration{
    _duration = duration;
}

@end
