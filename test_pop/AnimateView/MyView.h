//
//  MyView.h
//  test_pop
//
//  Created by Jingnan Zhang on 15/12/11.
//  Copyright © 2015年 Jingnan Zhang. All rights reserved.
//// 不显示 图片四角 ,即加载好图片再显示
#import <UIKit/UIKit.h>

@interface MyView : UIView
/** 以下二者：【0 1】 传过来，决定圆环的最终停留位置,若由于图片加载，则最后圆环会消失也没事（即，此值自己.m弄）*/
@property (nonatomic, assign) CGFloat strokStart;
@property (nonatomic, assign) CGFloat strokeEnd;
@end

/*
 基本动画：以下常见动画
一， transform（图层形变）{1,rotation(旋转,x,y,z) 2,translation(平移,下面有x,y,z) 3,scale(缩放,下面有x,y,z)}
二， position(图层的中心点，相当于center)   contentsRect(图层显示内容的大小和位置)
三，bounds(图层大小)   borderColor(边框颜色)	  borderWidth(边框宽度)
cornerRadius(圆角半径)    backgroundColor（图层背景颜色）  hidden(隐藏)  contents(图层显示内容，例如可以将图片作为图层内容显示)
 */