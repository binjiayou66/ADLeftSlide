//
//  ADTableView.h
//  ADLeftSlide
//
//  Created by 123 on 16/11/23.
//  Copyright © 2016年 naibin.liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ADTableView : UITableView

/** 滑动停止 */
@property (nonatomic, copy) void (^slideEnedCallBack)(BOOL);

@end
