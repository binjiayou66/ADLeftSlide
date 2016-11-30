//
//  ADLeftSlideView.h
//  ADLeftSlide
//
//  Created by 123 on 16/11/30.
//  Copyright © 2016年 naibin.liu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    ADLeftSlideToucheStatusBegin = -1,
    ADLeftSlideToucheStatusMoving,
    ADLeftSlideToucheStatusEnd
} ADLeftSlideToucheStatus;

@interface ADLeftSlideView : UIView

+ (instancetype)sharedView;

/** 是否显示蒙版 */
- (void)showCoverView:(BOOL)isShow;

/** 滑动结束调整左视图，x为左视图阈值位置 */
- (void)adjustLeftViewPosition:(CGFloat)positionX;

/** 正在滑动调整左视图x坐标 */
- (void)leftViewPositionX:(CGFloat)positionX;

/** 左视图x位置 */
- (CGFloat)leftViewPositionX;

/** 是否显示左视图 */
- (BOOL)isShow;

@end
