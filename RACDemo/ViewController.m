//
//  ViewController.m
//  RACDemo
//
//  Created by 小飞鸟 on 2018/1/22.
//  Copyright © 2018年 小飞鸟. All rights reserved.
//

#import "ViewController.h"
#import "HKView.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "SecondViewController.h"

@interface ViewController ()<HKViewProtocol>
@property (strong, nonatomic) HKView *hkView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.hkView =[[HKView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:self.hkView];
   
    self.hkView.delegate=self;
    [[self rac_signalForSelector:@selector(RAVPerformProtocol) fromProtocol: @protocol(HKViewProtocol)]subscribeNext:^(id x) {
        
    }];

    
    //实现代理
    [[self.hkView rac_signalForSelector:@selector(messageSend:)]subscribeNext:^(RACTuple * x) {
        NSLog(@"收到点击事件");
        NSLog(@"%@",[x.first objectForKey:@"message"]);
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"btn" object:@{@"code":@"200",@"message":@"成功了"}];
    }];

    //按钮事件的监听
    [[self.hkView.btn rac_signalForControlEvents:UIControlEventTouchDown] subscribeNext:^(UIButton * x) {
         NSLog(@"UIButton*****%@",x);
    }];
   
    //textField的文本输入监听
    [[self.hkView.textField rac_textSignal] subscribeNext:^(NSString * x) {
        NSLog(@"文本输入变化***%@",x);
    }];
    
    [[self.hkView.textField rac_signalForControlEvents:UIControlEventAllEditingEvents]subscribeNext:^(NSString * x) {
        NSLog(@"文本输入方法监听2***%@",x);
    }];
    
    //通知
    [[[NSNotificationCenter defaultCenter]rac_addObserverForName:@"btn" object:nil] subscribeNext:^(NSNotification *notification) {
        NSLog(@"%@",notification.object);
        NSLog(@"%@", notification.name);
    }];

    //定时器
    [[RACSignal interval:1.0 onScheduler:[RACScheduler scheduler]]subscribeNext:^(id x) {

        NSLog(@"%@",x);
    }];
//
    /*属性赋值*/
    RAC(self.hkView.label,text)= self.hkView.textField.rac_textSignal;
    
    //KVO
    [RACObserve(self.hkView.label, text) subscribeNext:^(id x) {
        NSLog(@"KVO***%@",x);
    }];
    
    [[self.hkView.textField rac_valuesForKeyPath:@"text" observer:self]subscribeNext:^(id x) {
        NSLog(@"文本输入框****%@",x);
    }];
    
    //tap添加点击事件
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]init];
    [[tap rac_gestureSignal] subscribeNext:^(id x) {
        NSLog(@"tap");
    }];
    [self.hkView.label addGestureRecognizer:tap];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];

    SecondViewController * VC = [SecondViewController new];
    [self presentViewController:VC animated:YES completion:nil];
    
}
@end
