//
//  MyHigherScaleDownView.h
//  test_pop
//
//  Created by Jingnan Zhang on 15/12/13.
//  Copyright © 2015年 Jingnan Zhang. All rights reserved.
// 用来缩小的

#import <UIKit/UIKit.h>

@interface MyHigherScaleDownView : UIView
/** 缩小的圆r */
@property (nonatomic, assign) CGFloat scaleDownRadius;
/** 动画所需的时间 ，默认 0s */
@property (nonatomic, assign) CGFloat duration;
/** 缩小的方法 */
-(void)scaleDown;
@end
