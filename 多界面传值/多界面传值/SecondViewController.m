//
//  SecondViewController.m
//  多界面传值
//
//  Created by 张旭洋 on 2023/7/19.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor purpleColor];
    
    //导航栏按钮 改变颜色
    UIBarButtonItem* btnChange = [[UIBarButtonItem alloc] initWithTitle: @"改变颜色" style: UIBarButtonItemStyleDone target: self action: @selector(pressChange)];
    self.navigationItem.rightBarButtonItem = btnChange;
}

//点击按钮时，触发代理的事件
- (void)pressChange
{
    //代理对象调用事件函数
    [self.delegate changeColor: [UIColor redColor]];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
