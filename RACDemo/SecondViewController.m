//
//  SecondViewController.m
//  RACDemo
//
//  Created by 小飞鸟 on 2018/1/25.
//  Copyright © 2018年 小飞鸟. All rights reserved.
//

#import "SecondViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface SecondViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView * tableView;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    
    UITableView * tableView =[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tableView.delegate=self;
    tableView.dataSource=self;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
}


@end
