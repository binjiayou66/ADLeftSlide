//
//  ViewController.m
//  ADLeftSlide
//
//  Created by 123 on 16/11/23.
//  Copyright © 2016年 naibin.liu. All rights reserved.
//

#import "ViewController.h"
#import "ADLeftSlideView.h"
#import "ADTableView.h"

@interface ViewController () <UITableViewDataSource>

@property (nonatomic, weak) ADTableView * tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.navigationController.navigationBar.hidden = YES;
    
    // 自定制导航栏
    UIView * myBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_SIZE.width, 64)];
    myBar.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:myBar];
    
    // 视图内容 - 以表格视图为例
    ADTableView * tb = [[ADTableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_SIZE.width, SCREEN_SIZE.height - 64) style:UITableViewStylePlain];
    tb.dataSource = self;
    [tb registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    [self.view insertSubview:tb belowSubview:myBar];
    self.tableView = tb;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    [window bringSubviewToFront:[ADLeftSlideView sharedView]];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = @"aa";
    
    return cell;
}


@end
