//
//  PassModifiedViewController.m
//  3G SHARE仿写
//
//  Created by 张旭洋 on 2023/7/30.
//

#import "PassModifiedViewController.h"

@interface PassModifiedViewController ()

@end

@implementation PassModifiedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed: (230.0 / 255) green: (222.0 / 255) blue: (220.0 / 255) alpha: 1];
    UIBarButtonItem* btn1 = [[UIBarButtonItem alloc] initWithImage: [UIImage imageNamed: @"holidayfanhui.png"] style: UIBarButtonItemStylePlain target: self action: @selector(pressReturn)];
    UIBarButtonItem* btn2 = [[UIBarButtonItem alloc] initWithTitle: @"修改密码" menu: nil];
    [self.navigationItem setLeftBarButtonItems: [NSArray arrayWithObjects: btn1, btn2, nil]];
    btn1.tintColor = [UIColor whiteColor];
    btn2.tintColor = [UIColor whiteColor];
    
    self.firstTextField = [[UITextField alloc] init];
    self.firstTextField.frame = CGRectMake(90, 120, 290, 50);
    self.firstTextField.backgroundColor = [UIColor whiteColor];
    self.firstTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.firstTextField.placeholder = @"6-20英文或数字组合";
    self.firstTextField.secureTextEntry = YES;
    [self.view addSubview:self.firstTextField];
    
    self.secondTextField = [[UITextField alloc] init];
    self.secondTextField.frame = CGRectMake(90, 190, 290, 50);
    self.secondTextField.backgroundColor = [UIColor whiteColor];
    self.secondTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.secondTextField.placeholder = @"6-20英文或数字组合";
    self.secondTextField.secureTextEntry = YES;
    [self.view addSubview: self.secondTextField];
    
    self.thirdTextField = [[UITextField alloc] init];
    self.thirdTextField.frame = CGRectMake(90, 260, 290, 50);
    self.thirdTextField.backgroundColor = [UIColor whiteColor];
    self.thirdTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.thirdTextField.placeholder = @"请再次确认输入密码";
    self.thirdTextField.secureTextEntry = YES;
    [self.view addSubview: self.thirdTextField];
    
    UILabel* firstLabel = [[UILabel alloc] initWithFrame: CGRectMake(10, 100, 100, 90)];
    firstLabel.text = @"旧密码";
    [self.view addSubview: firstLabel];
    
    UILabel* secondLabel = [[UILabel alloc] initWithFrame: CGRectMake(10, 170, 100, 90)];
    secondLabel.text = @"新密码";
    [self.view addSubview: secondLabel];
    
    UILabel* thirdLabel = [[UILabel alloc] initWithFrame: CGRectMake(10, 240, 100, 90)];
    thirdLabel.text = @"确认密码";
    [self.view addSubview: thirdLabel];
    
    UIButton* button = [[UIButton alloc] initWithFrame: CGRectMake(150, 370, 140, 50)];
    [button setTitle: @"提交" forState: UIControlStateNormal];
    button.backgroundColor = [UIColor blackColor];
    button.layer.cornerRadius = 9;
    button.layer.masksToBounds = YES;
    [self.view addSubview: button];
    
    [button addTarget: self action: @selector(pressButton) forControlEvents: UIControlEventTouchUpInside];
}

- (void)pressButton {
    if ([self.secondTextField.text isEqualToString: self.thirdTextField.text] && !(self.firstTextField.text.length == 0 || self.secondTextField.text.length == 0 || self.thirdTextField.text.length == 0)) {
        self.alertController = [UIAlertController alertControllerWithTitle: @"通知" message: @"修改成功" preferredStyle: UIAlertControllerStyleAlert];
        UIAlertAction* sure = [UIAlertAction actionWithTitle: @"确定" style: UIAlertActionStyleDefault handler: nil];
        [self.alertController addAction: sure];
        [self presentViewController: self.alertController animated: YES completion: nil];
    } else if (self.firstTextField.text.length == 0 || self.secondTextField.text.length == 0 || self.thirdTextField.text.length == 0) {
        self.alertController = [UIAlertController alertControllerWithTitle: @"通知" message: @"请输入完整" preferredStyle: UIAlertControllerStyleAlert];
        UIAlertAction* sure = [UIAlertAction actionWithTitle: @"确定" style: UIAlertActionStyleDefault handler: nil];
        [self.alertController addAction: sure];
        [self presentViewController: self.alertController animated: YES completion: nil];

    } else {
        self.alertController = [UIAlertController alertControllerWithTitle: @"通知" message: @"两次新密码输入不同" preferredStyle: UIAlertControllerStyleAlert];
        UIAlertAction* sure = [UIAlertAction actionWithTitle: @"确定" style: UIAlertActionStyleDefault handler: nil];
        [self.alertController addAction: sure];
        [self presentViewController: self.alertController animated: YES completion: nil];
    }
}

- (void)pressReturn {
    [self.navigationController popViewControllerAnimated: YES];
}

//点击屏幕空白处调用此函数
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self.firstTextField resignFirstResponder];
    [self.secondTextField resignFirstResponder];
    [self.thirdTextField resignFirstResponder];
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
