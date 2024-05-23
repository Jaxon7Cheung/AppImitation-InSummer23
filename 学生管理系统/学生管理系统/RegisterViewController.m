//
//  RegisterViewController.m
//  学生管理系统
//
//  Created by 张旭洋 on 2023/7/31.
//

#import "RegisterViewController.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor blackColor];
    
    self.usernameTextField = [[UITextField alloc] init];
    self.usernameTextField.frame = CGRectMake(WIDTH / 2 - 150, 400, 300, 40);
    self.usernameTextField.placeholder = @"Please enter your username😊";
    [self.usernameTextField setValue:[UIColor grayColor] forKeyPath:@"self.placeholderLabel.textColor"];
    self.usernameTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.usernameTextField.layer.borderColor = [UIColor whiteColor].CGColor;
    self.usernameTextField.layer.borderWidth = 3.0;
    self.usernameTextField.layer.cornerRadius = 9.0;
    self.usernameTextField.layer.masksToBounds = YES;
    self.usernameTextField.leftView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"zhanghao.png"]];
    self.usernameTextField.leftViewMode = UITextFieldViewModeAlways;
    self.usernameTextField.clearButtonMode = UITextFieldViewModeAlways;
    self.usernameTextField.backgroundColor = [UIColor clearColor];
    [self.view addSubview: self.usernameTextField];
    self.usernameTextField.textColor = [UIColor whiteColor];

    
    self.passwordTextField = [[UITextField alloc] init];
    self.passwordTextField.frame = CGRectMake(WIDTH / 2 - 150, 460, 300, 40);
    self.passwordTextField.placeholder = @"Please enter your password🫢";
    [self.passwordTextField setValue:[UIColor grayColor] forKeyPath:@"self.placeholderLabel.textColor"];
    self.passwordTextField.borderStyle = UITextBorderStyleNone;
    self.passwordTextField.keyboardType = UIKeyboardTypeDefault;
    self.passwordTextField.layer.borderColor = [UIColor whiteColor].CGColor;
    self.passwordTextField.layer.borderWidth = 3.0;
    self.passwordTextField.layer.cornerRadius = 9.0;
    self.passwordTextField.layer.masksToBounds = YES;
    self.passwordTextField.secureTextEntry = YES;
    self.passwordTextField.leftView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"mima.png"]];
    self.passwordTextField.leftViewMode = UITextFieldViewModeAlways;
    self.passwordTextField.clearButtonMode = UITextFieldViewModeAlways;
    [self.view addSubview: self.passwordTextField];
    self.passwordTextField.textColor = [UIColor whiteColor];

    
    self.usernameTextField.delegate = self;
    self.passwordTextField.delegate = self;
    [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(keyboardWillAppear:) name: UIKeyboardWillShowNotification object: nil];
    [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(keyboardWillDisAppear:) name: UIKeyboardWillHideNotification object: nil];
    
    self.confirmBtn = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    self.confirmBtn.frame = CGRectMake(WIDTH / 2 - 115, 540, 230, 40);
    [self.confirmBtn setTitle: @"确认注册" forState: UIControlStateNormal];
    [self.confirmBtn setTintColor: [UIColor whiteColor]];
    self.confirmBtn.titleLabel.font = [UIFont boldSystemFontOfSize: 20];
    [self.confirmBtn setBackgroundColor: [UIColor clearColor]];
    [self.confirmBtn.layer setMasksToBounds:YES];
    [self.confirmBtn.layer setCornerRadius:9.0];
    [self.confirmBtn.layer setBorderWidth:3.0];
    self.confirmBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    [self.view addSubview: self.confirmBtn];
    [self.confirmBtn addTarget: self action: @selector(pressConfirm) forControlEvents: UIControlEventTouchUpInside];
    
    
    self.arrayUserName = [[NSMutableArray alloc] init];
    self.arrayPassWord = [[NSMutableArray alloc] init];
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
    [self.usernameTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
}

- (void)pressConfirm {
    
    if ([self.usernameTextField.text isEqualToString: @""] || [self.passwordTextField.text isEqualToString: @""]) {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle: @"提示" message: @"请填写账号或密码" preferredStyle: UIAlertControllerStyleAlert];
        UIAlertAction* action = [UIAlertAction actionWithTitle: @"确定" style: UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {}];
        [alert addAction: action];
        [self presentViewController: alert animated: YES completion: nil];
        
    } else if ([self isEmpty: self.usernameTextField.text] || [self isEmpty: self.passwordTextField.text]) {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle: @"提示" message: @"账号或密码中不能含有空格" preferredStyle: UIAlertControllerStyleAlert];
        UIAlertAction* action = [UIAlertAction actionWithTitle: @"确定" style: UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {}];
        [alert addAction: action];
        [self presentViewController: alert animated: YES completion: nil];
        self.usernameTextField.text = nil;
        self.passwordTextField.text = nil;
    } else if (([RegisterViewController isChineseCharacter: self.usernameTextField.text] || [RegisterViewController isEnglishCharacter: self.usernameTextField.text]) && ([RegisterViewController isEnglishCharacter: self.passwordTextField.text] || [RegisterViewController isNumber: self.passwordTextField.text])) {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle: @"提示" message: @"账号或密码中不能含有特殊字符\n账号仅支持中英文\n密码仅支持数字与大小写字母组合" preferredStyle: UIAlertControllerStyleAlert];
        UIAlertAction* action = [UIAlertAction actionWithTitle: @"确定" style: UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {}];
        [alert addAction: action];
        [self presentViewController: alert animated: YES completion: nil];
        self.usernameTextField.text = nil;
        self.passwordTextField.text = nil;
    } else {
        int flag = 1;
        for (int i = 0; i < self.arrayUserName.count; ++i) {
            if ([self.usernameTextField.text isEqualToString: self.arrayUserName[i]]) {
                flag = 0;
                break;
            }
        }
        
        if (flag == 0) {
            UIAlertController* alert = [UIAlertController alertControllerWithTitle: @"提示" message: @"此账号已存在" preferredStyle: UIAlertControllerStyleAlert];
            UIAlertAction* action = [UIAlertAction actionWithTitle: @"确定" style: UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {}];
            [alert addAction: action];
            [self presentViewController: alert animated: YES completion: nil];
        } else {
            [self.arrayUserName addObject: self.usernameTextField.text];
            [self.arrayPassWord addObject: self.passwordTextField.text];
            [self.delegate pushUser: self.arrayUserName andPassword: self.arrayPassWord];
            
            self.usernameTextField.text = nil;
            self.passwordTextField.text = nil;
            
            [self dismissViewControllerAnimated: YES completion: nil];
        }
    }
    

}

//判空
//+  (BOOL)isBlankString:(NSString *)aStr {
//    if (!aStr) {
//        return YES;
//    }
//    if ([aStr isKindOfClass:[NSNull class]]) {
//        return YES;
//    }
//    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
//    NSString *trimmedStr = [aStr stringByTrimmingCharactersInSet:set];
//    if (!trimmedStr.length) {
//        return YES;
//    }
//    return NO;
//}

//限制中文输入 判断是否中文
+ (BOOL)isChineseCharacter:(NSString*)source {
    //参考了 https://www.jianshu.com/p/b40b3c618fec
    NSString *regex = @"^[\\u4E00-\\u9FEA]+$";
    return ([source rangeOfString:regex options:NSRegularExpressionSearch].length>0);
}
//严格限制英文输入
+ (BOOL)isEnglishCharacter:(NSString*)source {
    NSString *upperRegex = @"^[\\u0041-\\u005A]+$";
    NSString *lowerRegex = @"^[\\u0061-\\u007A]+$";
    BOOL isEnglish = (([source rangeOfString:upperRegex options:NSRegularExpressionSearch].length>0) || ([source rangeOfString:lowerRegex options:NSRegularExpressionSearch].length>0));
    return isEnglish;
}

//判断数字
+ (BOOL)isNumber:(NSString*)source {
    NSString *regex = @"^[\\u0030-\\u0039]+$";
    return ([source rangeOfString:regex options:NSRegularExpressionSearch].length>0);
}

//判断空格
- (BOOL)isEmpty:(NSString *) str {
    NSRange range = [str rangeOfString:@" "];
    if (range.location != NSNotFound) {
        return YES;
    } else {
        return NO;
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
