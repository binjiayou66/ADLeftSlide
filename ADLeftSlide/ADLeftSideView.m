//
//  ADLeftSideView.m
//  ADLeftSlide
//
//  Created by 123 on 16/11/23.
//  Copyright © 2016年 naibin.liu. All rights reserved.
//

#import "ADLeftSideView.h"

@implementation ADLeftSideView

+ (instancetype)sharedLeftSideView {
    static ADLeftSideView * _sharedLeftSideView = nil;
    if (!_sharedLeftSideView) {
        _sharedLeftSideView = [[ADLeftSideView alloc] initWithFrame:CGRectMake(-LEFTSIDE_VIEW_WIDTH, 0, LEFTSIDE_VIEW_WIDTH, SCREEN_SIZE.height)];
        _sharedLeftSideView.backgroundColor = [UIColor whiteColor];
    }
    return _sharedLeftSideView;
}

- (void)slideEndedAdjustPosition:(CGFloat)positionX {
    // 滑动结束
    if (self.frame.origin.x < positionX) {
        self.frame = CGRectMake(-LEFTSIDE_VIEW_WIDTH, 0, LEFTSIDE_VIEW_WIDTH, SCREEN_SIZE.height);
    }else {
        self.frame = CGRectMake(0, 0, LEFTSIDE_VIEW_WIDTH, SCREEN_SIZE.height);
    }
}

- (void)positionX:(CGFloat)positionX {
    CGRect frame = self.frame;
    frame.origin.x = positionX;
    self.frame = frame;
}

@end
