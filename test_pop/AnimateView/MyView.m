//
//  MyView.m
//  test_pop
//
//  Created by Jingnan Zhang on 15/12/11.
//  Copyright © 2015年 Jingnan Zhang. All rights reserved.
//

#import "MyView.h"
#import <pop/POP.h>

#define  ksuperWidth self.superview.frame.size.width
#define ksuperHeight  self.superview.frame.size.height

#define kwidth  self.frame.size.width
#define  kheight self.frame.size.height
#define  Duration    4

@interface MyView (){
    NSInteger downCount; //测试 手势 累加
    UIImageView *imgV;
}

@end
@implementation MyView


-(instancetype)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
//        self.backgroundColor = [UIColor redColor];
        imgV = [UIImageView new];
        imgV.frame = self.bounds;
        [self addSubview:imgV];
    }
    return self;
}
-(void)drawRect:(CGRect)rect{ //在此中设置backgroundColor无用
    [super drawRect:rect];
    
    //1.
//    [self runPopBasicAnimation];
    
    //2.
//    sleep(1);
//    [self runPopSpringAnimation];
    
    
    //3.
//    [self runPopDecayAnimationNoParam];
    
    
    // 4.,会
//    [self addPanGestureInView:self];
    
    // 5. swipe手势
//    [self addSwipeGestureInView:self];
    // 6.图片加载 时 的进度
    [self runAnimationWhenLoadImage];

}

#pragma mark - 加 pan手势
-(void)addPanGestureInView:(UIView *)view{
    
    //加 手势,以便 用户手势解锁时，做减速动作，如何的滑动动作
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(decayAfterPan:)];
    [view addGestureRecognizer:pan];
}
#pragma mark - 加swipe 手势
-(void)addSwipeGestureInView:(UIView *)view{
    //加swipe手势
    //下
    UISwipeGestureRecognizer *swipeDown = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(runPopAnimationAfterSwipe:)];
    swipeDown.direction = UISwipeGestureRecognizerDirectionDown; //默认右
    [self addGestureRecognizer:swipeDown];
    //上
    UISwipeGestureRecognizer *swipeUp = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(runPopAnimationAfterSwipe:)];
    swipeUp.direction = UISwipeGestureRecognizerDirectionUp;
    [self addGestureRecognizer:swipeUp];
    //左
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(runPopAnimationAfterSwipe:)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft; //默认右
    [self addGestureRecognizer:swipeLeft];
    //右
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(runPopAnimationAfterSwipe:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight; //默认右
    [view addGestureRecognizer:swipeRight];

}

#pragma mark -  基本动画
/**
 *  和 CABasicAniamtion很相似 */
-(void)runPopBasicAnimation{
    
    //1.位置
//    POPBasicAnimation *basicAni = [POPBasicAnimation animationWithPropertyNamed:kPOPViewCenter];
//    basicAni.toValue = [NSValue valueWithCGPoint:CGPointMake(ksuperWidth * 0.5 - 50, ksuperHeight * 0.5)];
//    basicAni.duration = 2;
////    basicAni.delegate = self; //可以不写
//    [self pop_addAnimation:basicAni forKey:nil];
    
    //2.透明度
//    POPBasicAnimation *basicAni1 = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerOpacity];
//    basicAni1.toValue = @0.1;
//    basicAni1.duration = 2;
//    [basicAni1 setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
//        if (finished) { //完成后的处理
//            
//        }
//    }];
//    [self.layer pop_addAnimation:basicAni1 forKey:nil];
    
    //3.view背景色,是关键字含有layer的话，则必须在layer上加动画
//    POPBasicAnimation *basicAni2 = [POPBasicAnimation animationWithPropertyNamed:kPOPViewBackgroundColor];
////        basicAni2.fromValue = [UIColor grayColor]; //若自己无背景色，则fromValue就会作为其背景色，toValue无用
//        basicAni2.toValue = [UIColor greenColor];
//        basicAni2.duration = 2;
//        [basicAni2 setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
//            if (finished) { //完成后的处理
//    
//            }
//        }];
//    
//        [self pop_addAnimation:basicAni2 forKey:nil];
    
    //4。layer背景色，无法改变颜色
//    POPBasicAnimation *basicAni3 = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerBackgroundColor];
////    basicAni3.fromValue = (__bridge id)([UIColor redColor].CGColor);
//    basicAni3.toValue = [UIColor greenColor];
//    basicAni3.duration = 2;
//    [basicAni3 setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
//        if (finished) { //完成后的处理
//            
//        }
//    }];
    
//    [self.layer pop_addAnimation:basicAni3 forKey:nil];
    
    // 5. 转移
//    POPBasicAnimation *basicAni5 = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPositionY];
//    basicAni5.duration = 2;
//    basicAni5.toValue = @(CGRectGetHeight(self.frame)/2+CGRectGetHeight([UIScreen mainScreen].bounds));
//    [basicAni5 setCompletionBlock:^(POPAnimation *anim, BOOL finished) {
//        if (finished) {
//        
//        }
//    }];
//    [self.layer pop_addAnimation:basicAni5 forKey:nil];
    
    //6. 时间进度
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(0, kheight * 0.5 + 20, kwidth, 40)];
    lab.textColor = [UIColor purpleColor];
    lab.font = [UIFont systemFontOfSize:20]; //不管放哪，字体此时会随frame而变
    lab.textAlignment = NSTextAlignmentCenter;
    [self addSubview:lab];
    
    POPBasicAnimation *anim = [POPBasicAnimation animation];
    anim.duration = 2.0;
    // 动画 样式
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    // 动画属性
    POPAnimatableProperty * prop = [POPAnimatableProperty propertyWithName:@"count" initializer:^(POPMutableAnimatableProperty *prop) {
        
        prop.readBlock = ^(id obj, CGFloat values[]) { //obj即lab,values最多存4个值，
            values[0] = [[obj description] floatValue];
        };
        prop.writeBlock = ^(id obj, const CGFloat values[]) {
           
            [obj setText:[NSString stringWithFormat:@"时间：%.2f",values[0]]];
        };
        prop.threshold = 0.05; //增加值
    }];

    anim.property = prop;
    anim.fromValue = @(0.0);
    anim.toValue = @(100.0);
    [lab pop_addAnimation:anim forKey:nil];
    
}

#pragma mark -  弹簧动画,可以 弹来弹去
/**
 *  弹簧动画是Bezier曲线无法表述的,所以无法使用PopBasicAniamtion来实现。PopSpringAnimation便是专门用来实现弹簧动画的。
 */
-(void)runPopSpringAnimation{ //写多个 动画，分别添加即可同时执行
    //1.移动
//    POPSpringAnimation *springAni = [POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
//    springAni.springBounciness = 17; //弹簧弹力，0 -- 20，默认4,越大弹的越多
//    springAni.springSpeed = 60;  //弹簧速度，速度越快，动画时间越短 [0, 20]，默认为12
//    springAni.dynamicsTension = 4; //弹簧的张力
//    springAni.dynamicsFriction  = 1; //弹簧摩擦
//    springAni.dynamicsMass = 24; //质量越大，摩擦越大
//    springAni.toValue = [NSValue valueWithCGPoint:CGPointMake(ksuperWidth * 0.5, ksuperHeight * 0.5)];
//    
//    [self pop_addAnimation:springAni forKey:nil];
    
    //2. 旋转
//    POPSpringAnimation *springAni1 = [POPSpringAnimation animation];
//    springAni1.property = [POPAnimatableProperty propertyWithName: kPOPLayerRotation];
//    springAni1.springBounciness = 14;
//    springAni1.toValue= @(M_PI);
//    [self.layer pop_addAnimation:springAni1 forKey:nil];

    //3.缩放
    UIBezierPath *bp = [UIBezierPath bezierPathWithArcCenter:CGPointMake(ksuperWidth * 0.5, ksuperHeight * 0.5) radius:ksuperWidth * 0.5 - 1 startAngle:0 endAngle:M_PI * 2 clockwise:YES];
    POPSpringAnimation *springAni2 = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY]; // 传的数字即为倍数， 0--1内的数即可了，不要太大，放大的太大
    springAni2.springBounciness = 16;
    springAni2.toValue = [NSValue valueWithCGSize:CGSizeMake(0.3, 0.5)];
    [self.layer pop_addAnimation:springAni2 forKey:nil];
}

#pragma mark -  加速度动画
/**
 *  基于Bezier曲线的timingFuntion同样无法表述Decay Aniamtion，所以Pop就单独实现了一个 PopDecayAnimation，用于衰减动画。衰减动画一个很常见的地方就是 UIScrollView 滑动松开后的减速，这里就基于UIView实现一个自己的ScrollView，然后使用PopDecayAnimation;当滑动手势结束时，根据结束的加速度，给衰减动画一个初始的velocity，用来决定衰减的时长。
 */
-(void)runPopDecayAnimation:(CGPoint)vle{
    // 1.
    POPDecayAnimation *decayAni = [POPDecayAnimation animationWithPropertyNamed:kPOPLayerPosition];
    decayAni.velocity = [NSValue valueWithCGPoint:CGPointMake(vle.x, vle.y)]; // 速度
//    decayAni.fromValue =  [NSValue valueWithCGPoint:CGPointMake(vle.x, vle.y)]; // 从0开始，速度为300点/s
//    decayAni.deceleration =  .998;//(负加速度） 是一个你会很少用到的值，默认是就是我们地球的 0.998
    decayAni.completionBlock =  ^(POPAnimation *anim, BOOL finished) {
        if (finished) {
            
        }
    };
    [self.layer pop_addAnimation:decayAni forKey:nil];
}
#pragma mark - 无参数的decay衰退动画
-(void)runPopDecayAnimationNoParam{
    // 1.
    POPDecayAnimation *decayAni = [POPDecayAnimation animationWithPropertyNamed:kPOPLayerPositionY];
    decayAni.velocity = @(ksuperHeight - 10); // 速度
        decayAni.fromValue = @(0); // 从*开始，速度为*点/s
    //    decayAni.deceleration =  .998;//(负加速度） 是一个你会很少用到的值，默认是就是我们地球的 0.998
    decayAni.completionBlock =  ^(POPAnimation *anim, BOOL finished) {
        if (finished) {
            
        }
    };
    [self.layer pop_addAnimation:decayAni forKey:nil];
    
}

#pragma mark - pan手势
-(void)decayAfterPan:(UIPanGestureRecognizer *)pan{
    
    switch (pan.state) { //判断手势状态
        case UIGestureRecognizerStatePossible: {
            
            break;
        }
        case UIGestureRecognizerStateBegan: {
            
            break;
        }
        case UIGestureRecognizerStateChanged: {
            CGPoint panPiont = [pan translationInView:self];
            CGPoint center = self.center;
            center.x += panPiont.x;
            center.y += panPiont.y;
            
            [pan setTranslation:center inView:self];
            break;
        }
        case UIGestureRecognizerStateEnded: {
            //取得 手势速度
            CGPoint vel = [pan velocityInView:self];
            [self runPopDecayAnimation:vel];

            break;
        }
        case UIGestureRecognizerStateCancelled: {
            //取得 手势速度
            CGPoint vel = [pan velocityInView:self];
            [self runPopDecayAnimation:vel];
            
            break;
        }
        case UIGestureRecognizerStateFailed: {
            [pan removeTarget:self action:@selector(runPopDecayAnimation:)];
            break;
        }
        default: {
            break;
        }
    }
}
#pragma mark - #pragma mark - 为 swipe(滑动，快速移动）)手势 执行的动画
-(void)runPopAnimationAfterSwipe:(UISwipeGestureRecognizer *)swipe{
    
    
    switch (swipe.direction) {
        case UISwipeGestureRecognizerDirectionDown:
        {
            downCount ++;
            POPBasicAnimation *basicAni = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerRotationX];
            basicAni.toValue = @(M_PI_4 * 0.2 * downCount);
            basicAni.duration = 2;
            [basicAni setCompletionBlock:^(POPAnimation *anim, BOOL finish) {
                if (finish) {
                    if (downCount >= 3) {
                        downCount --;
                        if (downCount == 0) {
                            downCount = 1;
                        }
                    }
                }
            }];
            [self.layer pop_addAnimation:basicAni forKey:nil];
        }
            break;
        case UISwipeGestureRecognizerDirectionUp:
        {
            POPBasicAnimation *basicAni = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerRotationX];
            basicAni.toValue = @( -M_PI_4 * 0.5 );
            basicAni.duration = 2;
            [basicAni setCompletionBlock:^(POPAnimation *anim, BOOL finish) {
                if (finish) {
                

                }
            }];
            [self.layer pop_addAnimation:basicAni forKey:nil];

            
        }
            break;
        case UISwipeGestureRecognizerDirectionLeft:
        {
            POPBasicAnimation *basicAni = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerRotationY];
            basicAni.toValue = @(M_PI_4 * 0.5 );
            basicAni.duration = 2;
            [basicAni setCompletionBlock:^(POPAnimation *anim, BOOL finish) {
                if (finish) {
                 
                }
            }];
            [self.layer pop_addAnimation:basicAni forKey:nil];
            
        }
            break;
            
        default:
        {
            POPBasicAnimation *basicAni = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerRotationY];
            basicAni.toValue = @(- M_PI_4 * 0.5 );
            basicAni.duration = 2;
            [basicAni setCompletionBlock:^(POPAnimation *anim, BOOL finish) {
                if (finish) {
 

                }
            }];
            [self.layer pop_addAnimation:basicAni forKey:nil];
        }
            break;
    }
    
}

#pragma mark - 图片加载时 的效果，不显示四角
/**
 *  shapeLayer是不能 缩放的
 */
-(void)runAnimationWhenLoadImage{
    
    // 1.赋 图
    imgV.image = [UIImage imageNamed:@"11"];
    
    /**************** 第一步 数字进度动画******************/
//    // 2.模拟的圆环 进度
    UIView *coverView = [[UIView alloc]initWithFrame:self.bounds];
    coverView.backgroundColor = [UIColor whiteColor];
    [self addSubview:coverView];
    // 2.1 画 圆环
    CAShapeLayer  *shapelayer = [CAShapeLayer layer];
    //    shapelayer.frame = self.bounds; //shapelayer依附于path，不需要frame，即使path不闭合也无关系
    
    // 2.2贝塞尔曲线， 让它根据layer来变化
    CGFloat borderRadius = self.bounds.size.width * 0.3; //圆环的r
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width * 0.5,
                                                                   self.bounds.size.height * 0.5)
                                                radius:borderRadius
                                            startAngle:0
                                              endAngle:M_PI * 2
                                             clockwise:YES];
    
    //2.2。1   shapeLayer的 设置，
    shapelayer.strokeColor   = [UIColor greenColor].CGColor;   // 边缘线的颜色
    shapelayer.fillColor     = [UIColor redColor].CGColor;   // 闭环填充的颜色
    shapelayer.lineCap       = kCALineCapSquare;               // 边缘线的类型
    shapelayer.path          = bezierPath.CGPath; // 从贝塞尔曲线获取到形状
    
    //    CGContextScaleCTM(c, 0.5, 0.5) ,矩阵操作，即对所有**都起作用
    shapelayer.strokeStart = self.strokStart;
    shapelayer.strokeEnd = self.strokeEnd; //必须设置<以便从头开始画
    shapelayer.lineWidth     = 3.f;
    //2.2.2 添加 shapeLayer
    [coverView.layer addSublayer:shapelayer];
    
    // 3。 圆环进度动画，在其他控制器里弄定时器执行的话，会导致一顿一顿的进行,画一个圆环
    [self drawStrokeCircle:shapelayer];
    
    // 4. 时间进度,宽度 = 2 * 进度圆环 r
    UILabel *lab = [[UILabel alloc]init];
    lab.center = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5);
    lab.bounds = CGRectMake(0, 0,  borderRadius * 2, 21);
    
    lab.textColor = [UIColor whiteColor];
    lab.textAlignment = NSTextAlignmentCenter;
    [coverView addSubview:lab];
    
    // 4.1 动画 样式 // 自定义中最重要的三个东西：timingFunction，readBlock，writeBlock
    POPBasicAnimation *anim = [POPBasicAnimation animation];
    anim.duration = 2.0;
    anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    // 4.2 自定义 动画属性
    POPAnimatableProperty * prop = [POPAnimatableProperty propertyWithName:@"count" initializer:^(POPMutableAnimatableProperty *prop) {
        // readBlock告诉POP当前的属性值
        prop.readBlock = ^(UILabel *obj, CGFloat values[]) { //obj即lab,values最多存4个值，
            values[0] = [obj.text floatValue];
        };
        // writeBlock中修改变化后的属性值
        prop.writeBlock = ^(UILabel *obj, const CGFloat values[]) {
            [obj setText:[NSString stringWithFormat:@"加载中%.2f",values[0]]];
        };
        prop.threshold = 0.05; //决定了动画变化间隔的阈值，值越大writeBlock的调用次数越少

    }];
    anim.property = prop;
    anim.fromValue = @(0.0);
    anim.toValue = @(self.strokeEnd * 100);
    [anim setCompletionBlock:^(POPAnimation *ani, BOOL finish) {
        if (finish) {
            // 数字进度动画结束后，移除遮盖。进行缩放动画
            [coverView removeFromSuperview];
        }
    }];
     // 4.3
    [lab pop_addAnimation:anim forKey:nil];

    /*********************第二步 缩放动画 ******************/
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        // 5. 设置r,linWidth 而非--->borderwidth
        //    CGFloat radius = sqrt(kwidth * kwidth * 0.5 * 0.5 + kheight * kheight * 0.5 * 0.5); // 最外面圆的半径
        CGFloat radius = MAX(kheight, kwidth) * 0.5; // 最外面圆的半径，让它大 即可
        CGFloat scaleDownRadius = MIN(kwidth, kheight) * 0.2; //向内缩小的小圆r
        
        /*  无用
        // 5.1 最外面的圆/最大的内圆,(显示四角的图片不好弄)。可以调整下面参数radius的大小
//        CAShapeLayer *shape0 = [CAShapeLayer layer];
//        UIBezierPath *bep0 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.layer.bounds.size.width * 0.5, self.layer.bounds.size.height * 0.5) radius:radius + 50  startAngle:0 endAngle:M_PI * 2 clockwise:YES];
//        // 5.2  shape的 设置
//        shape0.strokeColor   = [UIColor orangeColor].CGColor;   // 边缘线的颜色
//        shape0.fillColor     = [UIColor clearColor].CGColor;   // 闭环填充的颜色
//        shape0.lineCap       = kCALineCapSquare;               // 边缘线的类型
//        shape0.path          = bep0.CGPath; // 从贝塞尔曲线获取到形状
//        shape0.strokeStart   = 0; //strokeStart 必须 >= 0
//        shape0.strokeEnd  = 1;
//        // 5.3 添加 shape
//        [self.layer addSublayer:shape0];
        
        
        //6 . 最大的内圆
        //    CAShapeLayer *shape = [CAShapeLayer layer];
        //       UIBezierPath *bep = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.layer.bounds.size.width * 0.5, self.layer.bounds.size.height * 0.5) radius:radius startAngle:0 endAngle:M_PI * 2 clockwise:YES];
        //    // 6.1 shape的 设置
        //    shape.strokeColor   = [UIColor orangeColor].CGColor;   // 边缘线的颜色
        //    shape.fillColor     = [UIColor whiteColor].CGColor;   // 闭环填充的颜色
        //    shape.lineCap       = kCALineCapSquare;               // 边缘线的类型
        //    shape.path          = bep.CGPath; // 从贝塞尔曲线获取到形状
        //    shape.lineWidth     = 2;  //bu是borderWidth
        //    shape.strokeStart   = 0; //strokeStart 必须 >= 0
        //    shape.strokeEnd  = 1;
        //    //添加 shape
        //    [self.layer addSublayer:shape];
        */
        
        // 7. 缩小的小圆
        // 7.1 此View装 缩小的小圆
        UIView *scaleDownView = [[UIView alloc]init];
        scaleDownView.center = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5);
        scaleDownView.bounds = CGRectMake(0, 0, scaleDownRadius * 2, scaleDownRadius * 2);
        [self  addSubview:scaleDownView];
        
         //  7.1.1 在scaleDownView 上弄 小圆shape
        CAShapeLayer *shape1 = [CAShapeLayer layer];
        
        UIBezierPath *bep1 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(scaleDownView.bounds.size.width * 0.5, scaleDownView.bounds.size.height * 0.5) radius:scaleDownRadius startAngle:0 endAngle:M_PI * 2 clockwise:YES];
        shape1.path = bep1.CGPath;
        shape1.strokeColor = [UIColor whiteColor].CGColor;
        shape1.fillColor = [UIColor redColor].CGColor;
        [scaleDownView.layer addSublayer:shape1];
        
        
        // 7.2 放大的圆
        //安装大圆的 View ,和 本身一样大
        CGFloat linWidthScaleUp = radius - scaleDownRadius;
        CGFloat scaleUpRadius =  radius - linWidthScaleUp * 0.5 + 50; //放大的r,多加50是为了让放大的更好看些
//        CGFloat scaleUpRadius =  radius - linWidthScaleUp * 0.5;
        UIView *scaleUpView = [UIView new];
        scaleUpView.frame = self.bounds;
        [self addSubview:scaleUpView];
        
        // 7.3 在scaleUpView上 加一个 大圆shape
        CAShapeLayer *shape2 = [CAShapeLayer layer];
        UIBezierPath *bep2 = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5) radius:scaleUpRadius startAngle:0 endAngle:M_PI * 2 clockwise:YES];
        
        // 7.4 shape的 设置
        shape2.strokeColor   = [UIColor orangeColor].CGColor;   // 边缘线的颜色
        shape2.fillColor     = [UIColor clearColor].CGColor;   // 闭环填充的颜色
        shape2.lineCap       = kCALineCapSquare;               // 边缘线的类型
        shape2.path          = bep2.CGPath; // 从贝塞尔曲线获取到形状
        shape2.lineWidth     = linWidthScaleUp;  //bu是borderWidth
        shape2.strokeStart   = 0; //strokeStart 必须 >= 0
        shape2.strokeEnd  = 1;
        // 7.4.1  添加 shape
        [scaleUpView.layer addSublayer:shape2];
        
        //  7.5. scaleDownView缩小,第一种方式
        //    POPSpringAnimation *springAni = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerScaleXY]; // 传的数字即为倍数， 0--1内的数即可了，不要太大，放大的太大
        //    springAni.springBounciness = 16;
        //    springAni.toValue = [NSValue valueWithCGSize:CGSizeMake(0.1, 0.1)];
        //    [scaleDownView.layer pop_addAnimation:springAni forKey:nil];
        
        // 7.6 . scaleDownView缩小  第二种方式
        POPBasicAnimation *basic = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
        basic.duration = Duration;
        basic.toValue = [NSValue valueWithCGSize:CGSizeMake(0.1, 0.1)];
        [scaleDownView.layer pop_addAnimation:basic forKey:nil];
        
        
        // 8. 放大
        POPBasicAnimation *basic2 = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
        basic2.duration = Duration;
        [basic2 setCompletionBlock:^(POPAnimation *ani, BOOL finished) {
            if (finished) {
                [scaleDownView removeFromSuperview];
                [scaleUpView removeFromSuperview];
            }
        }];
        basic2.toValue = [NSValue valueWithCGSize:CGSizeMake(2.6, 2.6)];
        [scaleUpView.layer pop_addAnimation:basic2 forKey:nil];

    });
    
   

}

#pragma mark - 画  一个 圆环
//动画 ，画一个圆环
-(void)drawStrokeCircle:(CAShapeLayer *)shapelayer{
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"]; //从strokStart -》 strokEnd
    pathAnimation.duration = 2;
    pathAnimation.fromValue = @(self.strokStart);
    pathAnimation.toValue =  @(self.strokeEnd);
    [shapelayer addAnimation:pathAnimation forKey:nil];
}

#pragma mark - setter
- (void)setStrokStart:(CGFloat)strokStart
{

    _strokStart = strokStart;
    if (self.strokStart < 0) return;
//    [self setNeedsDisplay];
}
#pragma mark - 外部传入，以便圆环环完后，不会消失,因为strokeEnd已有值了
-(void)setStrokeEnd:(CGFloat)strokeEnd
{
    _strokeEnd = strokeEnd;
    if (self.strokeEnd > 1.) return;
//    [self setNeedsDisplay];
}

/*
{ //得到action的代码块地址
 IMP imp = [target_ methodForSelector:action];
 NSMethodSignature *sig = [(id)target methodSignatureForSelector:action];
}
 {
 Tap（点一下）
 Pinch（二指往內或往外拨动，平时经常用到的缩放）
 Rotation（旋转）
 Swipe（滑动，快速移动）
 Pan （拖移，慢速移动）
 LongPress（长按
 }
 */
@end
