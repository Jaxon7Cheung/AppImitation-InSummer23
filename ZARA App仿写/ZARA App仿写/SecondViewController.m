//
//  SecondViewController.m
//  ZARA App仿写
//
//  Created by 张旭洋 on 2023/7/20.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"搜索";
    self.textField = [[UITextField alloc] init];
    self.textField.frame = CGRectMake(25, 350, 325, 55);
    self.textField.font = [UIFont systemFontOfSize: 19];
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    self.textField.keyboardType = UIKeyboardTypeDefault;
    self.textField.placeholder = @"Please enter your content...😊";
    
    [self.view addSubview: self.textField];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //使虚拟键盘回收，不再作为第一消息响应者
    [self.textField resignFirstResponder];
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
