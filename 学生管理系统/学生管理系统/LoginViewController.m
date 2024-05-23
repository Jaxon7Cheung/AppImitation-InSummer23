//
//  LoginViewController.m
//  学生管理系统
//
//  Created by 张旭洋 on 2023/7/31.
//

#import "LoginViewController.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
#import "RegisterViewController.h"
#import "ManageMenuViewController.h"


@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.iView = [[UIImageView alloc] init];
    self.iView.frame = self.view.bounds;
    self.iView.image = [UIImage imageNamed: @"background.png"];
    [self.view addSubview: self.iView];
    self.iView.userInteractionEnabled = YES;
    
    self.userNameField = [[UITextField alloc] init];
    self.userNameField.frame = CGRectMake(WIDTH / 2 - 150, 350, 300, 40);
    self.userNameField.placeholder = @"Please enter your username😊";
    // "通过KVC修改占位文字的颜色"
    [self.userNameField setValue:[UIColor grayColor] forKeyPath:@"self.placeholderLabel.textColor"];
    self.userNameField.borderStyle = UITextBorderStyleNone;
    self.userNameField.layer.borderColor = [UIColor whiteColor].CGColor;
    self.userNameField.layer.borderWidth = 3.0;
    self.userNameField.layer.cornerRadius = 9.0;
    self.userNameField.layer.masksToBounds = YES;
    self.userNameField.leftView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"zhanghao.png"]];
    self.userNameField.leftViewMode = UITextFieldViewModeAlways;
    self.userNameField.clearButtonMode = UITextFieldViewModeAlways;
    self.userNameField.backgroundColor = [UIColor clearColor];
    [self.iView addSubview: self.userNameField];
    self.userNameField.textColor = [UIColor whiteColor];

    self.passWordField = [[UITextField alloc] init];
    self.passWordField.frame = CGRectMake(WIDTH / 2 - 150, 410, 300, 40);
    self.passWordField.placeholder = @"Please enter your password🫢";
    [self.passWordField setValue:[UIColor grayColor] forKeyPath:@"self.placeholderLabel.textColor"];
    self.passWordField.borderStyle = UITextBorderStyleNone;
    self.passWordField.layer.borderColor = [UIColor whiteColor].CGColor;
    self.passWordField.layer.borderWidth = 3.0;
    self.passWordField.layer.cornerRadius = 9.0;
    self.passWordField.layer.masksToBounds = YES;
    self.passWordField.keyboardType = UIKeyboardTypeDefault;
    self.passWordField.secureTextEntry = YES;
    self.passWordField.leftView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"mima.png"]];
    self.passWordField.leftViewMode = UITextFieldViewModeAlways;
    self.passWordField.clearButtonMode = UITextFieldViewModeAlways;
    self.passWordField.backgroundColor = [UIColor clearColor];
    [self.iView addSubview: self.passWordField];
    self.passWordField.textColor = [UIColor whiteColor];

    
    self.leftBtn = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    self.leftBtn.frame = CGRectMake(WIDTH / 2 - 115, 490, 100, 40);
    [self.leftBtn setTitle: @"登录" forState: UIControlStateNormal];
    [self.leftBtn setTintColor: [UIColor whiteColor]];
    self.leftBtn.titleLabel.font = [UIFont boldSystemFontOfSize: 18];
    [self.leftBtn setBackgroundColor: [UIColor clearColor]];
    [self.leftBtn.layer setMasksToBounds:YES];
    [self.leftBtn.layer setCornerRadius:9.0];
    [self.leftBtn.layer setBorderWidth:3.0];
    self.leftBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    [self.iView addSubview: self.leftBtn];
    [self.leftBtn addTarget: self action: @selector(pressLeft) forControlEvents: UIControlEventTouchUpInside];
    
    self.rightBtn = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    self.rightBtn.frame = CGRectMake(WIDTH / 2 + 15, 490, 100, 40);
    [self.rightBtn setTitle: @"注册" forState: UIControlStateNormal];
    [self.rightBtn setTintColor: [UIColor whiteColor]];
    self.rightBtn.titleLabel.font = [UIFont boldSystemFontOfSize: 18];
    [self.rightBtn setBackgroundColor: [UIColor clearColor]];
    [self.rightBtn.layer setMasksToBounds:YES];
    [self.rightBtn.layer setCornerRadius:9.0];
    [self.rightBtn.layer setBorderWidth:3.0];
    self.rightBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    [self.iView addSubview: self.rightBtn];
    [self.rightBtn addTarget: self action: @selector(pressRight) forControlEvents: UIControlEventTouchUpInside];


}

- (void)pressRight {
    if (!self.registerViewController) self.registerViewController = [[RegisterViewController alloc] init];
    
    self.registerViewController.delegate = self;
    self.registerViewController.arrayUserName = self.arrayUserName;
    self.registerViewController.arrayPassWord = self.arrayPassWord;
    
    
    [self presentViewController: self.registerViewController animated: YES completion: nil];
}

- (void)pressLeft {
    if ([self.userNameField.text isEqualToString: @""] || [self.passWordField.text isEqualToString: @""]) {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle: @"提示" message: @"请输入账号或密码" preferredStyle: UIAlertControllerStyleAlert];
        UIAlertAction* action = [UIAlertAction actionWithTitle: @"确定" style: UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {}];
        [alert addAction: action];
        [self presentViewController: alert animated: YES completion: nil];
    } else {
        int flag = 0;
        for (int i = 0; i < self.arrayUserName.count; ++i) {
            if ([self.userNameField.text isEqualToString: self.arrayUserName[i]] && [self.passWordField.text isEqualToString: self.arrayPassWord[i]]) {
                flag = 1;
                break;
            }
        }

        if ((flag == 1) || ([self.userNameField.text isEqualToString: @"S"] && [self.passWordField.text isEqualToString: @"M"])) {
            ManageMenuViewController* managerMenuViewController = [[ManageMenuViewController alloc] init];
            
            managerMenuViewController.modalPresentationStyle = UIModalPresentationFullScreen;
            [self presentViewController: managerMenuViewController animated: YES completion: nil];
        } else {
            UIAlertController* alert = [UIAlertController alertControllerWithTitle: @"提示" message: @"账号或密码不正确" preferredStyle: UIAlertControllerStyleAlert];
            UIAlertAction* action = [UIAlertAction actionWithTitle: @"确定" style: UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {}];
            [alert addAction: action];
            [self presentViewController: alert animated: YES completion: nil];
            self.userNameField.text = nil;
            self.passWordField.text = nil;
        }


    }
}

- (void)pushUser:(NSMutableArray *)arrayUserName andPassword:(NSMutableArray *)arrayPassWord {
    self.arrayUserName = [NSMutableArray arrayWithArray: arrayUserName];
    self.arrayPassWord = [NSMutableArray arrayWithArray: arrayPassWord];
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
