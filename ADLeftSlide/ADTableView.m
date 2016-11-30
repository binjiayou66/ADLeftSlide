//
//  ADTableView.m
//  ADLeftSlide
//
//  Created by 123 on 16/11/23.
//  Copyright © 2016年 naibin.liu. All rights reserved.
//

#import "ADTableView.h"
#import "ADLeftSlideView.h"

@implementation ADTableView {
    CGPoint _srcPoint;
}

#pragma mark - table touches
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    _srcPoint = [[touches anyObject] locationInView:self];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesMoved:touches withEvent:event];
    [self handleTouches:touches withEvent:event isEnded:NO];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    [self handleTouches:touches withEvent:event isEnded:YES];
}

- (void)handleTouches:(NSSet *)touches withEvent:(UIEvent *)event isEnded:(BOOL)isEnded {
    CGPoint currentPoint = [[touches anyObject] locationInView:self];
    CGFloat delX = currentPoint.x - _srcPoint.x;
    CGFloat delY = currentPoint.y - _srcPoint.y;
    if (fabs(delX) > fabs(delY)) {
        ADLeftSlideView * leftSlideView = [ADLeftSlideView sharedView];
        // 侧滑
        self.scrollEnabled = NO;
        if (isEnded) {
            [UIView animateWithDuration:0.25 animations:^{
                [leftSlideView adjustLeftViewPosition:100 - LEFTSIDE_VIEW_WIDTH];
            } completion:^(BOOL finished) {
                self.scrollEnabled = YES;
                [leftSlideView showCoverView:[leftSlideView leftViewPositionX] == 0];
            }];
        }else {
            // 正在滑动
            if (delX > 0 && [leftSlideView leftViewPositionX] < -0 && _srcPoint.x < self.bounds.size.width / 2) {
                [leftSlideView leftViewPositionX:delX - LEFTSIDE_VIEW_WIDTH >= 0 ? 0 : delX - LEFTSIDE_VIEW_WIDTH];
            }else if (delX < 0 && leftSlideView.frame.origin.x > -LEFTSIDE_VIEW_WIDTH) {
                [leftSlideView leftViewPositionX:delX];
            }
        }
    }
}

@end
