//
//  ViewController.m
//  test_pop
//
//  Created by Jingnan Zhang on 15/12/11.
//  Copyright © 2015年 Jingnan Zhang. All rights reserved.
//

#import "ViewController.h"
#import "MyView.h"
#import "MyHigherView.h"
#import "MyHigherScaleUpView.h"
#import <pop/POP.h>

#define  kwidth  self.view.frame.size.width
#define  kheight self.view.frame.size.height
@interface ViewController () <POPAnimatorDelegate>
{
    __weak IBOutlet UIView *lView;
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //    MyView *vw = [[MyView alloc]initWithFrame: self.view.bounds]; // self.view.bounds  CGRectMake(10, 70, 100, 100)
//    vw.backgroundColor = [UIColor redColor];
//    vw.strokeEnd = 0.8;
//    [self.view addSubview:vw];
    
    MyHigherView *higher  = [[MyHigherView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [vw removeFromSuperview];
//        [lView addSubview:higher];
        [self.view  addSubview:higher];
    });
    

//    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(20, 100, kwidth - 40, kwidth - 40)];
//    view.backgroundColor = [UIColor redColor];
//    [self.view addSubview:view];
//    
//    POPBasicAnimation *anim = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerRotation];
//    anim.duration = 4.0;
//    anim.toValue = @(2 * M_PI);
//    anim.delegate = self;
//    anim.removedOnCompletion = YES;
//    anim.repeatCount = 2;
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [view.layer pop_addAnimation:anim forKey:nil];
//        
//    });
  
    
    
}

#pragma mark - POPAnimatorDelegate
-(void)animatorWillAnimate:(POPAnimator *)animator{

}


@end
