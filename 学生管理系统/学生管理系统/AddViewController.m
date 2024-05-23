//
//  AddViewController.m
//  学生管理系统
//
//  Created by 张旭洋 on 2023/7/31.
//

#import "AddViewController.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height

@interface AddViewController ()

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor blackColor];
    
    self.nameField = [[UITextField alloc] init];
    self.nameField.frame = CGRectMake(WIDTH / 2 - 150, 350, 300, 40);
    self.nameField.placeholder = @"输入待添加学生的姓名";
    // "通过KVC修改占位文字的颜色"
    [self.nameField setValue:[UIColor grayColor] forKeyPath: @"self.placeholderLabel.textColor"];
    self.nameField.borderStyle = UITextBorderStyleNone;
    self.nameField.layer.borderColor = [UIColor whiteColor].CGColor;
    self.nameField.layer.borderWidth = 3.0;
    self.nameField.layer.cornerRadius = 9.0;
    self.nameField.layer.masksToBounds = YES;
    self.nameField.leftView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"zhanghao.png"]];
    self.nameField.leftViewMode = UITextFieldViewModeAlways;
    self.nameField.clearButtonMode = UITextFieldViewModeAlways;
    self.nameField.backgroundColor = [UIColor clearColor];
    [self.view addSubview: self.nameField];
    self.nameField.textColor = [UIColor whiteColor];
    
    self.classField = [[UITextField alloc] init];
    self.classField.frame = CGRectMake(WIDTH / 2 - 150, 410, 300, 40);
    self.classField.placeholder = @"输入该学生的班级";
    // "通过KVC修改占位文字的颜色"
    [self.classField setValue:[UIColor grayColor] forKeyPath: @"self.placeholderLabel.textColor"];
    self.classField.borderStyle = UITextBorderStyleNone;
    self.classField.layer.borderColor = [UIColor whiteColor].CGColor;
    self.classField.layer.borderWidth = 3.0;
    self.classField.layer.cornerRadius = 9.0;
    self.classField.layer.masksToBounds = YES;
    self.classField.leftView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"zhanghao.png"]];
    self.classField.leftViewMode = UITextFieldViewModeAlways;
    self.classField.clearButtonMode = UITextFieldViewModeAlways;
    self.classField.backgroundColor = [UIColor clearColor];
    [self.view addSubview: self.classField];
    self.classField.textColor = [UIColor whiteColor];
    
    self.numberField = [[UITextField alloc] init];
    self.numberField.frame = CGRectMake(WIDTH / 2 - 150, 470, 300, 40);
    self.numberField.placeholder = @"输入该学生的学号";
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
    
    self.addButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    self.addButton.frame = CGRectMake(WIDTH / 2 - 115, 640, 230, 40);
    [self.addButton setTitle: @"添加" forState: UIControlStateNormal];
    [self.addButton setTintColor: [UIColor whiteColor]];
    self.addButton.titleLabel.font = [UIFont boldSystemFontOfSize: 18];
    [self.addButton setBackgroundColor: [UIColor clearColor]];
    [self.addButton.layer setMasksToBounds: YES];
    [self.addButton.layer setCornerRadius: 9.0];
    [self.addButton.layer setBorderWidth: 3.0];
    self.addButton.layer.borderColor = [UIColor whiteColor].CGColor;
    [self.view addSubview: self.addButton];
    [self.addButton addTarget: self action: @selector(pressAdd) forControlEvents: UIControlEventTouchUpInside];
}

- (void)pressAdd {
    if ([self.nameField.text isEqual: @""] || [self.classField.text isEqualToString: @""] || [self.numberField.text isEqual: @""]) {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle: @"提示" message: @"请将信息填写完整" preferredStyle: UIAlertControllerStyleAlert];
        UIAlertAction* action = [UIAlertAction actionWithTitle: @"确定" style: UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {}];
        [alert addAction: action];
        [self presentViewController: alert animated: YES completion: nil];
    }  else if ([self isEmpty: self.nameField.text] || [self isEmpty: self.classField.text] || [self isEmpty: self.numberField.text]) {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle: @"提示" message: @"姓名、班级或学号中不能含有空格" preferredStyle: UIAlertControllerStyleAlert];
        UIAlertAction* action = [UIAlertAction actionWithTitle: @"确定" style: UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {}];
        [alert addAction: action];
        [self presentViewController: alert animated: YES completion: nil];
        self.nameField.text = nil;
        self.classField.text = nil;
        self.numberField.text = nil;
    } else if (![AddViewController isChineseCharacter: self.nameField.text] || ![AddViewController isEnglishCharacter: self.nameField.text] || ![AddViewController isEnglishCharacter: self.classField.text] || ![AddViewController isNumber: self.classField.text] || ![AddViewController isNumber: self.numberField.text]) {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle: @"提示" message: @"姓名、班级或学号中不能含有特殊字符\n姓名仅支持中英文\n班级仅支持中文与数字\n学号仅支持数字" preferredStyle: UIAlertControllerStyleAlert];
        UIAlertAction* action = [UIAlertAction actionWithTitle: @"确定" style: UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {}];
        [alert addAction: action];
        [self presentViewController: alert animated: YES completion: nil];
        self.nameField.text = nil;
        self.classField.text = nil;
        self.numberField.text = nil;
    } else {
        int flag = 1;
        for (int i = 0; i < self.arrayNumber.count; ++i) {
            if ([self.numberField.text isEqualToString: self.arrayNumber[i]]) {
                flag = 0;
                break;
            }
        }
        
        if (flag == 1) {
            
            [self.arrayName addObject: self.nameField.text];
            [self.arrayClass addObject: self.classField.text];
            [self.arrayNumber addObject: self.numberField.text];
            
            [self.delegate pushName: self.arrayName andClass: self.arrayClass andNumber: self.arrayNumber];
            [self dismissViewControllerAnimated: YES completion: nil];
            
            self.nameField.text = nil;
            self.classField.text = nil;
            self.numberField.text = nil;
        } else {
            UIAlertController* alert = [UIAlertController alertControllerWithTitle: @"提示" message: @"该学号已存在" preferredStyle: UIAlertControllerStyleAlert];
            UIAlertAction* action = [UIAlertAction actionWithTitle: @"确定" style: UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {}];
            [alert addAction: action];
            [self presentViewController: alert animated: YES completion: nil];
        }
    }
    
    
}

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
