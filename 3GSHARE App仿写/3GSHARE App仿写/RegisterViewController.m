//
//  RegisterViewController.m
//  3G SHARE仿写
//
//  Created by 张旭洋 on 2023/7/26.
//

#import "RegisterViewController.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithRed: 43.0 / 255 green: 123.0 / 255 blue: 191.0 / 255 alpha: 1.0];
    self.loginView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"logoLogin.png"]];
    self.loginView.frame = CGRectMake(WIDTH / 2 - 64, 100, 128, 128);
    self.loginView.layer.cornerRadius = 64;
    self.loginView.layer.masksToBounds = YES;
    [self.view addSubview: self.loginView];
    self.loginLabel = [[UILabel alloc] init];
    self.loginLabel.frame = CGRectMake(WIDTH / 2 - 64, 228, 128, 64);
    self.loginLabel.text = @"SHARE";
    self.loginLabel.textColor = [UIColor whiteColor];
    self.loginLabel.font = [UIFont systemFontOfSize: 35];
    self.loginLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview: self.loginLabel];
    
    self.emailTextField = [[UITextField alloc] init];
    self.emailTextField.frame = CGRectMake(WIDTH / 2 - 150, 340, 300, 40);
    self.emailTextField.placeholder = @"Enter your e-mail address📮";
    self.emailTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.emailTextField.leftView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"email.png"]];
    self.emailTextField.leftViewMode = UITextFieldViewModeAlways;
    self.emailTextField.tag = 777;
    self.emailTextField.clearButtonMode = UITextFieldViewModeAlways;
    self.usernameTextField = [[UITextField alloc] init];
    self.usernameTextField.frame = CGRectMake(WIDTH / 2 - 150, 400, 300, 40);
    self.usernameTextField.placeholder = @"Please enter your username😊";
    self.usernameTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.usernameTextField.leftView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"zhanghao.png"]];
    self.usernameTextField.leftViewMode = UITextFieldViewModeAlways;
    self.usernameTextField.clearButtonMode = UITextFieldViewModeAlways;
    self.passwordTextField = [[UITextField alloc] init];
    self.passwordTextField.frame = CGRectMake(WIDTH / 2 - 150, 460, 300, 40);
    self.passwordTextField.placeholder = @"Please enter your password🫢";
    self.passwordTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.passwordTextField.keyboardType = UIKeyboardTypeDefault;
    self.passwordTextField.secureTextEntry = YES;
    self.passwordTextField.leftView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"mima.png"]];
    self.passwordTextField.leftViewMode = UITextFieldViewModeAlways;
    self.passwordTextField.clearButtonMode = UITextFieldViewModeAlways;
    [self.view addSubview: self.emailTextField];
    [self.view addSubview: self.usernameTextField];
    [self.view addSubview: self.passwordTextField];
    self.usernameTextField.delegate = self;
    self.passwordTextField.delegate = self;
    [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(keyboardWillAppear:) name: UIKeyboardWillShowNotification object: nil];
    [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(keyboardWillDisAppear:) name: UIKeyboardWillHideNotification object: nil];
    
    self.confirmBtn = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    self.confirmBtn.frame = CGRectMake(WIDTH / 2 - 115, 540, 230, 40);
    [self.confirmBtn setTitle: @"确认注册" forState: UIControlStateNormal];
    [self.confirmBtn setTintColor: [UIColor whiteColor]];
    self.confirmBtn.titleLabel.font = [UIFont boldSystemFontOfSize: 20];
    [self.confirmBtn setBackgroundColor: [UIColor colorWithRed: 43.0 / 255 green: 123.0 / 255 blue: 191.0 / 255 alpha: 1.0]];
    [self.confirmBtn.layer setMasksToBounds:YES];
    [self.confirmBtn.layer setCornerRadius:6.0];
    [self.confirmBtn.layer setBorderWidth:2.0];
    self.confirmBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    [self.view addSubview: self.confirmBtn];
    [self.confirmBtn addTarget: self action: @selector(pressConfirm) forControlEvents: UIControlEventTouchUpInside];
    
    
    self.arrayUsername = [[NSMutableArray alloc] init];
    self.arrayPassword = [[NSMutableArray alloc] init];
    //将要传的值给代理人
//    [self.delegate pushUserNameText: self.usernameTextField.text];
//    [self.delegate pushPasswordText: self.passwordTextField.text];
    
}

- (void)pressConfirm {
    
    if ([self.passwordTextField.text isEqualToString: @""] || [self.usernameTextField.text isEqualToString: @""]) {
        UIAlertController* boomAlert = [UIAlertController alertControllerWithTitle:@"❕" message: @"请填写账号或密码信息" preferredStyle: UIAlertControllerStyleAlert];
        UIAlertAction* boomAction= [UIAlertAction actionWithTitle:@"确定" style: UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        }];
        [boomAlert addAction: boomAction];
        [self presentViewController: boomAlert animated: YES completion: nil];
    }  else {
        int flag = 1;
        for (int i = 0; i < self.arrayUsername.count; ++i) {
            if ([self.usernameTextField.text isEqualToString: self.arrayUsername[i]]) {
                flag = 0;
                NSLog(@"重复了");
                break;
            }
        }
        
        if (flag == 1) {
            [self.arrayUsername addObject: self.usernameTextField.text];
            [self.arrayPassword addObject: self.passwordTextField.text];
            //将要传的值给代理人
            [self.delegate pushUser: self.arrayUsername andPassword: self.arrayPassword];
            NSLog(@"注册成功");
            [self dismissViewControllerAnimated: YES completion: nil];
            self.usernameTextField.text= nil;
            self.passwordTextField.text = nil;
        } else {
            UIAlertController* alert = [UIAlertController alertControllerWithTitle: @"提示" message: @"该账号已被注册" preferredStyle: UIAlertControllerStyleAlert];
            UIAlertAction* sure = [UIAlertAction actionWithTitle:@"✅" style: UIAlertActionStyleDefault handler:^(UIAlertAction *action) {}];
            [alert addAction: sure];
            [self presentViewController: alert animated:YES completion: nil];
        }
    }
}

- (void)keyboardWillDisAppear:(NSNotification *)notification{
    [UIView animateWithDuration: 1.0 animations:^{self.view.transform = CGAffineTransformMakeTranslation(0, 0);}];
}

- (void)keyboardWillAppear:(NSNotification *)notification{
    CGRect keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat keyboardY = keyboardFrame.origin.y;
    [UIView animateWithDuration: 1.0 animations:^{self.view.transform = CGAffineTransformMakeTranslation(0, keyboardY - self.view.frame.size.height + 19);}];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.emailTextField resignFirstResponder];
    [self.usernameTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
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
