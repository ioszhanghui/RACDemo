//
//  HKView.h
//  RACDemo
//
//  Created by 小飞鸟 on 2018/1/24.
//  Copyright © 2018年 小飞鸟. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

@protocol HKViewProtocol<NSObject>

@optional;
-(void)RAVPerformProtocol;

@end

@interface HKView : UIView
/*RAC 按钮点击*/
@property(nonatomic,strong)UIButton * btn;
/*RAC 文本输入*/
@property(nonatomic,strong)UITextField * textField;
/*RAC label 添加点击事件*/
@property(nonatomic,strong)UILabel * label;

@property(nonatomic,assign)id<HKViewProtocol>delegate;

@end
