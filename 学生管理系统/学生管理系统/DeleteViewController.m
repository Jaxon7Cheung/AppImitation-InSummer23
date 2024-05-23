//
//  DeleteViewController.m
//  学生管理系统
//
//  Created by 张旭洋 on 2023/7/31.
//

#import "DeleteViewController.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height

@interface DeleteViewController ()

@end

@implementation DeleteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor blackColor];
    
    self.numberField = [[UITextField alloc] init];
    self.numberField.frame = CGRectMake(WIDTH / 2 - 150, 470, 300, 40);
    self.numberField.placeholder = @"输入待删除学生的学号";
    // "通过KVC修改占位文字的颜色"
    [self.numberField setValue:[UIColor grayColor] forKeyPath: @"self.placeholderLabel.textColor"];
    self.numberField.borderStyle = UITextBorderStyleNone;
    self.numberField.layer.borderColor = [UIColor whiteColor].CGColor;
    self.numberField.layer.borderWidth = 3.0;
    self.numberField.layer.cornerRadius = 9.0;
    self.numberField.layer.masksToBounds = YES;
    self.numberField.leftView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"zhanghao.png"]];
    self.numberField.leftViewMode = UITextFieldViewModeAlways;
    self.numberField.clearButtonMode = UITextFieldViewModeAlways;
    self.numberField.backgroundColor = [UIColor clearColor];
    [self.view addSubview: self.numberField];
    self.numberField.textColor = [UIColor whiteColor];
    
    self.deleteButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    self.deleteButton.frame = CGRectMake(WIDTH / 2 - 115, 640, 230, 40);
    [self.deleteButton setTitle: @"删除" forState: UIControlStateNormal];
    [self.deleteButton setTintColor: [UIColor whiteColor]];
    self.deleteButton.titleLabel.font = [UIFont boldSystemFontOfSize: 18];
    [self.deleteButton setBackgroundColor: [UIColor clearColor]];
    [self.deleteButton.layer setMasksToBounds: YES];
    [self.deleteButton.layer setCornerRadius: 9.0];
    [self.deleteButton.layer setBorderWidth: 3.0];
    self.deleteButton.layer.borderColor = [UIColor whiteColor].CGColor;
    [self.view addSubview: self.deleteButton];
    [self.deleteButton addTarget: self action: @selector(pressDelete) forControlEvents: UIControlEventTouchUpInside];
}

- (void)pressDelete {
    if ([self.numberField.text isEqual: @""]) {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle: @"提示" message: @"请将信息填写完整" preferredStyle: UIAlertControllerStyleAlert];
        UIAlertAction* action = [UIAlertAction actionWithTitle: @"确定" style: UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {}];
        [alert addAction: action];
        [self presentViewController: alert animated: YES completion: nil];
    } else {
        int flag = 0;
        for (int i = 0; i < self.arrayNumber.count; ++i) {
            if ([self.numberField.text isEqualToString: self.arrayNumber[i]]) {
                [self.arrayName removeObjectAtIndex: i];
                [self.arrayClass removeObjectAtIndex: i];
                [self.arrayNumber removeObjectAtIndex: i];
                flag = 1;
                break;
            }
        }
        
        if (flag == 1) {
            [self.delegate pushDeleteName: self.arrayName andClass: self.arrayClass andNumber: self.arrayNumber];
            [self dismissViewControllerAnimated: YES completion: nil];
            self.numberField.text = nil;
        } else {
            UIAlertController* alert = [UIAlertController alertControllerWithTitle: @"提示" message: @"该学号不存在" preferredStyle: UIAlertControllerStyleAlert];
            UIAlertAction* action = [UIAlertAction actionWithTitle: @"确定" style: UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {}];
            [alert addAction: action];
            [self presentViewController: alert animated: YES completion: nil];
        }
    }
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
