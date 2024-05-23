//
//  FirstViewController.m
//  多界面传值
//
//  Created by 张旭洋 on 2023/7/19.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)changeColor: (UIColor *)color
{
    self.view.backgroundColor = [UIColor redColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    SecondViewController* secondView = [[SecondViewController alloc] init];
    
    //将当前的控制器作为代理对象赋值
    secondView.delegate = self;
    
    //推出视图控制器二
    [self.navigationController pushViewController: secondView animated: YES];
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
