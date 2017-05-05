//
//  MyHigherScaleUpView.h
//  test_pop
//
//  Created by Jingnan Zhang on 15/12/13.
//  Copyright © 2015年 Jingnan Zhang. All rights reserved.
// 用来放大的

#import <UIKit/UIKit.h>

@interface MyHigherScaleUpView : UIView

/** border 必须 >= borderLimit */
@property (nonatomic, assign) CGFloat borderLimit;

/** 放大的方法 */
-(void)scaleUp;
/** 外界获取 */
-(CGFloat)returnBorder;
@end
