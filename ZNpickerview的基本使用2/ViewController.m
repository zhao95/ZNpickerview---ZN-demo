//
//  ViewController.m
//  ZNpickerview的基本使用2
//
//  Created by 赵恩峰 on 16/6/20.
//  Copyright © 2016年 赵恩峰. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate>
@property (nonatomic, weak) UIPickerView *pickerV;
@property (nonatomic, weak) UITextField *foodText;
/**
 *  数据源
 */
@property (nonatomic, strong) NSArray *foodArray;
@end

@implementation ViewController
/**
 *  数据源.因为模型里没有字典 需要创建模型类
 *
 *  @return <#return value description#>
 */
- (NSArray *)foodArray {
    if (!_foodArray) {
       _foodArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"foods.plist" ofType:nil]];
    }
    return _foodArray;
}





- (void)viewDidLoad {
    [super viewDidLoad];
    /**
     创建 pickerview
     */
    UIPickerView *pickerview = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 400)];
    //pickerview.backgroundColor = [UIColor grayColor];
    
    pickerview.delegate = self;
    [self.view addSubview:pickerview];
    self.pickerV = pickerview;
    
    //self.pickerV.delegate = self;
       self.pickerV.dataSource = self;
    
    /**
     *  创建label
     */
    
    UITextField *textF = [[UITextField alloc]initWithFrame:CGRectMake((self.view.frame.size.width) * 0.5 - 75, 100, 150, 60)];
    textF.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:textF];
    self.foodText = textF;
    self.foodText.delegate = self;
    self.foodText.font = [UIFont systemFontOfSize:30];
    self.foodText.textAlignment = NSTextAlignmentCenter;
}
//允许开始编辑
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    return YES;
}

//几列
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return self.foodArray.count;
}
//几行 numberofrow
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    //取出当前是第几列
//    NSArray *arr = self.foodArray[component];
//    return arr.count;
//
    
    #pragma mark - 之前卡在这里一个问题,是数组没有传对 自己解决的
    //我的简写
    return  ((NSArray *)_foodArray[component]).count;
}
//每行的数据
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    //取出每一列
//    NSArray *arr = self.foodArray[component];
//    //返回每一列的行
//    return arr[row];
    return self.foodArray[component][row];
    
}
//选择了哪一行?
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    //NSString *str = self.foodArray[component][row];
    
    self.foodText.text = self.foodArray[component][row];
}

@end
