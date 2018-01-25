//
//  HKView.m
//  RACDemo
//
//  Created by 小飞鸟 on 2018/1/24.
//  Copyright © 2018年 小飞鸟. All rights reserved.
//

#import "HKView.h"
@implementation HKView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self=[super initWithFrame:frame]) {
        
        self.btn =[UIButton buttonWithType:UIButtonTypeCustom];
        self.btn.frame=CGRectMake(10, 100, 40, 40);
        self.btn.backgroundColor=[UIColor orangeColor];
        [self.btn setTitle:@"点击" forState:UIControlStateNormal];
        [self.btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        
        [self addSubview:self.btn];
        
        
        self.textField=[[UITextField alloc]initWithFrame:CGRectMake(60, 150, 300, 60)];
        self.textField.placeholder=@"请输入";
        self.textField.backgroundColor=[UIColor lightGrayColor];
        [self addSubview:self.textField];
        
        
        self.label = [[UILabel alloc]initWithFrame:CGRectMake(30, 260, 100, 40)];
        self.label.backgroundColor=[UIColor greenColor];
        self.label.text=@"需要添加点击事件";
        self.label.userInteractionEnabled=YES;
        [self addSubview:self.label];
        
    }
    return self;
}

- (void)btnClick:(UIButton*)sender {

    [self messageSend:@{@"code":@"200",@"message":@"成功了"}];
    
    if (self.delegate) {
        [self.delegate RAVPerformProtocol];
    }
}

-(void)messageSend:(NSDictionary*)dict{
    
    
}

@end
