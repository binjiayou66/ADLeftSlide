//
//  ADLeftSlideView.m
//  ADLeftSlide
//
//  Created by 123 on 16/11/30.
//  Copyright © 2016年 naibin.liu. All rights reserved.
//

#import "ADLeftSlideView.h"

@interface ADLeftSlideView ()

/** 侧边视图 */
@property (nonatomic, strong) UIView * leftView;
/** 滑动起始点 */
@property (nonatomic, assign) CGPoint srcPoint;

@end

@implementation ADLeftSlideView

+ (instancetype)sharedView {
    static ADLeftSlideView * _sharedLeftSlideView = nil;
    if (!_sharedLeftSlideView) {
        _sharedLeftSlideView = [[ADLeftSlideView alloc] initWithFrame:CGRectZero];
    }
    return _sharedLeftSlideView;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:[[UIScreen mainScreen] bounds]]) {
        self.backgroundColor = [UIColor clearColor];
        self.userInteractionEnabled = NO;
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
        UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panning:)];
        [self addGestureRecognizer:tap];
        [self addGestureRecognizer:pan];
        // UI
        [self addSubview:self.leftView];
    }
    return self;
}

#pragma mark - Cover View
- (void)showCoverView:(BOOL)isShow {
    if (isShow) {
        self.userInteractionEnabled = YES;
        [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
        [UIView animateWithDuration:0.25 animations:^{
            self.backgroundColor = [UIColor colorWithWhite:0.2 alpha:0.6];
        }];
    }else {
        self.userInteractionEnabled = NO;
        [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationSlide];
        [UIView animateWithDuration:0.25 animations:^{
            self.backgroundColor = [UIColor clearColor];
        }];
    }
    
}

- (void)tapped:(UITapGestureRecognizer *)tap {
    [self showCoverView:NO];
    [UIView animateWithDuration:0.25 animations:^{
        [self leftViewPositionX:-LEFTSIDE_VIEW_WIDTH];
    }];
}

- (void)panning:(UIPanGestureRecognizer *)pan {
    if (pan.state == UIGestureRecognizerStateEnded) {
        [UIView animateWithDuration:0.25 animations:^{
            [self adjustLeftViewPosition:-50];
        } completion:^(BOOL finished) {
            [self showCoverView:self.leftView.frame.origin.x == 0];
        }];
        return;
    }
    CGPoint point = [pan translationInView:self];
    if (point.x < 0) {
        [self leftViewPositionX:point.x];
    }
}

#pragma mark - Left View
- (void)adjustLeftViewPosition:(CGFloat)positionX {
    // 滑动结束
    if (self.leftView.frame.origin.x < positionX) {
        self.leftView.frame = CGRectMake(-LEFTSIDE_VIEW_WIDTH, 0, LEFTSIDE_VIEW_WIDTH, SCREEN_SIZE.height);
    }else {
        self.leftView.frame = CGRectMake(0, 0, LEFTSIDE_VIEW_WIDTH, SCREEN_SIZE.height);
    }
}

- (void)leftViewPositionX:(CGFloat)positionX {
    CGRect frame = self.leftView.frame;
    frame.origin.x = positionX;
    self.leftView.frame = frame;
}

- (CGFloat)leftViewPositionX {
    return self.leftView.frame.origin.x;
}

- (BOOL)isShow {
    return self.leftView.frame.origin.x == 0;
}

#pragma mark - lazy properties
- (UIView *)leftView {
    if (!_leftView) {
        _leftView = [[UIView alloc] initWithFrame:CGRectMake(-LEFTSIDE_VIEW_WIDTH, 0, LEFTSIDE_VIEW_WIDTH, SCREEN_SIZE.height)];
        _leftView.backgroundColor = [UIColor whiteColor];
    }
    return _leftView;
}

@end
