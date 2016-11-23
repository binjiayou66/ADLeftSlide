//
//  ADLeftSideView.h
//  ADLeftSlide
//
//  Created by 123 on 16/11/23.
//  Copyright © 2016年 naibin.liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ADLeftSideView : UIView

+ (instancetype)sharedLeftSideView;

- (void)slideEndedAdjustPosition:(CGFloat)positionX;
- (void)positionX:(CGFloat)positionX;

@end
