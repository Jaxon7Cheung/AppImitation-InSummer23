//
//  LoginViewController.m
//  3G SHARE仿写
//
//  Created by 张旭洋 on 2023/7/26.
//

#import "LoginViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "FifthViewController.h"
#import "RegisterViewController.h"
#define  WIDTH [UIScreen mainScreen].bounds.size.width

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithRed: 43.0 / 255 green: 123.0 / 255 blue: 191.0 / 255 alpha: 1.0];
    //self.view.backgroundColor = [UIColor blackColor];
    self.loginView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"logoLogin.png"]];
    //self.loginView.backgroundColor = [UIColor redColor];
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
    
    self.userName = [[UITextField alloc] init];
    self.userName.frame = CGRectMake(WIDTH / 2 - 150, 350, 300, 40);
    self.userName.placeholder = @"Please enter your username😊";
    self.userName.borderStyle = UITextBorderStyleRoundedRect;
    self.userName.leftView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"zhanghao.png"]];
    self.userName.leftViewMode = UITextFieldViewModeAlways;
    self.userName.clearButtonMode = UITextFieldViewModeAlways;

    self.passWord = [[UITextField alloc] init];
    self.passWord.frame = CGRectMake(WIDTH / 2 - 150, 410, 300, 40);
    self.passWord.placeholder = @"Please enter your password🫢";
    self.passWord.borderStyle = UITextBorderStyleRoundedRect;
    self.passWord.keyboardType = UIKeyboardTypeDefault;
    self.passWord.secureTextEntry = YES;
    self.passWord.leftView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"mima.png"]];
    self.passWord.leftViewMode = UITextFieldViewModeAlways;
    self.passWord.clearButtonMode = UITextFieldViewModeAlways;
    [self.view addSubview: self.userName];
    [self.view addSubview: self.passWord];
//    self.userName.delegate = self;
//    self.passWord.delegate = self;
    
//    self.arrayUsername = [[NSMutableArray alloc] init];
//    self.arrayPassword = [[NSMutableArray alloc] init];
    
    // 键盘上移事件
    [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(keyboardWillAppear:) name: UIKeyboardWillShowNotification object: nil];
    [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(keyboardWillDisAppear:) name: UIKeyboardWillHideNotification object: nil];
    //指定注册界面®️的代理为登录界面
//    RegisterViewController* registerView = [[RegisterViewController alloc] init];
//    registerView.delegate = self;
//    [self presentViewController: registerView animated: YES completion: nil];
    
    self.leftBtn = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    self.leftBtn.frame = CGRectMake(WIDTH / 2 - 115, 490, 100, 40);
    [self.leftBtn setTitle: @"登录" forState: UIControlStateNormal];
    [self.leftBtn setTintColor: [UIColor whiteColor]];
    self.leftBtn.titleLabel.font = [UIFont boldSystemFontOfSize: 20];
    [self.leftBtn setBackgroundColor: [UIColor colorWithRed: 43.0 / 255 green: 123.0 / 255 blue: 191.0 / 255 alpha: 1.0]];
    [self.leftBtn.layer setMasksToBounds:YES];
    //设置矩形四个圆角半径
    [self.leftBtn.layer setCornerRadius:6.0];
    //边框宽度
    [self.leftBtn.layer setBorderWidth:2.0];
    //设置边框颜色有两种方法：第一种如下:
//    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
//    CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 0, 0, 0, 1 });
//    //边框颜色
//    [self.leftBtn.layer setBorderColor:colorref];
    self.leftBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    [self.view addSubview: self.leftBtn];
    [self.leftBtn addTarget: self action: @selector(pressLeft:) forControlEvents: UIControlEventTouchUpInside];
    
    self.rightBtn = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    self.rightBtn.frame = CGRectMake(WIDTH / 2 + 15, 490, 100, 40);
    [self.rightBtn setTitle: @"注册" forState: UIControlStateNormal];
    [self.rightBtn setTintColor: [UIColor whiteColor]];
    self.rightBtn.titleLabel.font = [UIFont boldSystemFontOfSize: 20];
    [self.rightBtn setBackgroundColor: [UIColor colorWithRed: 43.0 / 255 green: 123.0 / 255 blue: 191.0 / 255 alpha: 1.0]];
    [self.rightBtn.layer setMasksToBounds:YES];
    [self.rightBtn.layer setCornerRadius:6.0];
    [self.rightBtn.layer setBorderWidth:2.0];
    self.rightBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    [self.view addSubview: self.rightBtn];
    [self.rightBtn addTarget: self action: @selector(pressRight:) forControlEvents: UIControlEventTouchUpInside];

    
    self.autoBtn = [UIButton buttonWithType: UIButtonTypeCustom];
    self.autoBtn.frame = CGRectMake(WIDTH / 2 - 150, 550, 16, 16);
    
    [self.autoBtn setImage: [UIImage imageNamed: @"autoreserved.png"] forState: UIControlStateNormal];
    //[self.autoBtn setImage: [UIImage imageNamed: @"autoreserved.png"] forState: UIControlStateReserved];
    [self.autoBtn setImage: [UIImage imageNamed: @"autohighlighted.png"] forState: UIControlStateSelected];
    self.autoBtn.selected = NO;
    [self.autoBtn addTarget: self action: @selector(pressAuto) forControlEvents: UIControlEventTouchUpInside];
    
    self.autoBtn01 = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    self.autoBtn01.frame = CGRectMake(WIDTH / 2 - 134, 550, 64, 16);
    [self.autoBtn01 setTitle: @"自动登录" forState: UIControlStateNormal];
    [self.autoBtn01 setTintColor: [UIColor colorWithDisplayP3Red: 14.0 / 255 green: 46.0 / 255 blue: 121.0 / 255 alpha: 1.0]];
    [self.autoBtn01 addTarget: self action: @selector(pressAuto) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview: self.autoBtn];
    [self.view addSubview: self.autoBtn01];
}

- (void)pressAuto {
    if (self.autoBtn.selected == NO) {
        self.autoBtn.selected = YES;
    } else {
        self.autoBtn.selected = NO;
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

- (void)pressRight: (UIButton *)button {
    if (!self.registerView) self.registerView = [[RegisterViewController alloc] init];
    
    self.registerView.delegate = self;
    self.registerView.arrayUsername = self.arrayUsername;
    self.registerView.arrayPassword = self.arrayPassword;
    [self presentViewController: self.registerView animated: YES completion: nil];
}

- (void)pressLeft: (UIButton *)button {
    int flag = 0;
    for (int i = 0; i < self.arrayUsername.count; ++i) {
        if ([self.arrayUsername[i] isEqualToString: self.userName.text] && [self.arrayPassword[i] isEqualToString: self.passWord.text] && (self.userName.text != nil) && (self.passWord.text != nil)) {
            flag = 1;
            break;
        }
    }
    
    if (flag == 1) {
        
        FirstViewController* firstView = [[FirstViewController alloc] init];
        firstView.view.backgroundColor = [UIColor colorWithRed: (230.0 / 255) green: (222.0 / 255) blue: (220.0 / 255) alpha: 1];
        firstView.tabBarItem = [[UITabBarItem alloc] initWithTitle: nil image: [[UIImage imageNamed: @"button1_normal.png"]  imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal] selectedImage: [[UIImage imageNamed: @"button1_pressed.png"] imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal] ];
        SecondViewController* secondView = [[SecondViewController alloc] init];
        secondView.view.backgroundColor = [UIColor colorWithRed: (230.0 / 255) green: (222.0 / 255) blue: (220.0 / 255) alpha: 1];
        secondView.tabBarItem = [[UITabBarItem alloc] initWithTitle: nil image: [[UIImage imageNamed: @"button2_normal.png"] imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal] selectedImage: [[UIImage imageNamed: @"button2_pressed.png"] imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal] ];
        ThirdViewController* thirdView = [[ThirdViewController alloc] init];
        thirdView.view.backgroundColor = [UIColor colorWithRed: (230.0 / 255) green: (222.0 / 255) blue: (220.0 / 255) alpha: 1];
        thirdView.tabBarItem = [[UITabBarItem alloc] initWithTitle: nil image: [[UIImage imageNamed: @"button3_normal.png"] imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal] selectedImage: [[UIImage imageNamed: @"button3_pressed.png"] imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal] ];
        FourthViewController* fourthView = [[FourthViewController alloc] init];
        fourthView.view.backgroundColor = [UIColor colorWithRed: (230.0 / 255) green: (222.0 / 255) blue: (220.0 / 255) alpha: 1];
        fourthView.tabBarItem = [[UITabBarItem alloc] initWithTitle: nil image: [[UIImage imageNamed: @"button4_normal.png"] imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal] selectedImage: [[UIImage imageNamed: @"button4_pressed.png"] imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal] ];
        FifthViewController* fifthView = [[FifthViewController alloc] init];
        fifthView.view.backgroundColor = [UIColor colorWithRed: (230.0 / 255) green: (222.0 / 255) blue: (220.0 / 255) alpha: 1];
        fifthView.tabBarItem = [[UITabBarItem alloc] initWithTitle: nil image: [[UIImage imageNamed: @"button5_normal.png"] imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal] selectedImage: [[UIImage imageNamed: @"button5_pressed.png"] imageWithRenderingMode: UIImageRenderingModeAlwaysOriginal] ];
        
        
        UINavigationController* navigationFirst = [[UINavigationController alloc] initWithRootViewController: firstView];
        UINavigationController* navigationSecond = [[UINavigationController alloc] initWithRootViewController: secondView];
        UINavigationController* navigationThird = [[UINavigationController alloc] initWithRootViewController: thirdView];
        UINavigationController* navigationFourth =  [[UINavigationController alloc] initWithRootViewController: fourthView];
        UINavigationController* navigationFifth = [[UINavigationController alloc] initWithRootViewController: fifthView];
        

        
        UINavigationBarAppearance* appearance = [[UINavigationBarAppearance alloc] init];
        appearance.backgroundColor = [UIColor colorWithRed: (43.0 / 255) green: (123.0 / 255) blue: (191.0 / 255) alpha: 1];
        firstView.navigationController.navigationBar.standardAppearance = appearance;
        firstView.navigationController.navigationBar.barStyle = UIBarStyleDefault;

        firstView.navigationController.navigationBar.scrollEdgeAppearance = appearance;
        secondView.navigationController.navigationBar.scrollEdgeAppearance = appearance;
        thirdView.navigationController.navigationBar.scrollEdgeAppearance = appearance;
        fourthView.navigationController.navigationBar.scrollEdgeAppearance = appearance;
        fifthView.navigationController.navigationBar.scrollEdgeAppearance = appearance;
        //settingView.navigationController.navigationBar.scrollEdgeAppearance = appearance;
        //[[UINavigationBar appearance] setStandardAppearance: appearance];
        
        
        NSArray* arrayViewController = [NSArray arrayWithObjects: navigationFirst, navigationSecond, navigationThird, navigationFourth, navigationFifth, nil];
        UITabBarController* tabBarViewController = [[UITabBarController alloc] init];
        tabBarViewController.viewControllers = arrayViewController;
        
        tabBarViewController.modalPresentationStyle = UIModalPresentationFullScreen;
        [self presentViewController: tabBarViewController animated: YES completion: nil];
        //[self.navigationController pushViewController: tabBarViewController animated: YES];
    } else {
        UIAlertController* alertView = [UIAlertController alertControllerWithTitle: @"❕" message: @"账号或密码错误或不存在" preferredStyle: UIAlertControllerStyleAlert];
        UIAlertAction* sure = [UIAlertAction actionWithTitle: @"✅" style: UIAlertActionStyleDefault handler: nil];
        [alertView addAction: sure];
        [self presentViewController: alertView animated: YES completion: nil];
    }

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //使虚拟键盘回收，不再作为第一消息响应者
    [self.userName resignFirstResponder];
    [self.passWord resignFirstResponder];
    

}

- (void) pushUser: (NSMutableArray *)arrayUserName andPassword: (NSMutableArray *)arrayPassWord {
//    self.arrayUsername = userName;
//    self.arrayPassword = passWord;
    self.arrayUsername = [NSMutableArray arrayWithArray: arrayUserName];
    self.arrayPassword = [NSMutableArray arrayWithArray: arrayPassWord];
    //NSLog(@"%@D", self.arrayUsername[0]);
    //NSLog(@"%@D", self.arrayPassword[0]);
    
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
