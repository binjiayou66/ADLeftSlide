//
//  ADCoverView.m
//  ADLeftSlide
//
//  Created by 123 on 16/11/23.
//  Copyright © 2016年 naibin.liu. All rights reserved.
//

#import "ADCoverView.h"
#import "ADLeftSideView.h"

@implementation ADCoverView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        self.userInteractionEnabled = NO;
        UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
        UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panning:)];
        [self addGestureRecognizer:tap];
        [self addGestureRecognizer:pan];
    }
    return self;
}

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
        [[ADLeftSideView sharedLeftSideView] positionX:-LEFTSIDE_VIEW_WIDTH];
    }];
}

- (void)panning:(UIPanGestureRecognizer *)pan {
    ADLeftSideView * leftSideView = [ADLeftSideView sharedLeftSideView];
    if (pan.state == UIGestureRecognizerStateEnded) {
        [UIView animateWithDuration:0.25 animations:^{
            [leftSideView slideEndedAdjustPosition:-50];
        } completion:^(BOOL finished) {
            [self showCoverView:leftSideView.frame.origin.x == 0];
        }];
        return;
    }
    CGPoint point = [pan translationInView:self];
    if (point.x < 0) {
        [leftSideView positionX:point.x];
    }
}

@end
