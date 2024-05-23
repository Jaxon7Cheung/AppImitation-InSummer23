//
//  ModifyViewController.m
//  学生管理系统
//
//  Created by 张旭洋 on 2023/7/31.
//

#import "ModifyViewController.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height

@interface ModifyViewController ()

@end

@implementation ModifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blackColor];
    
    self.searchButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    self.searchButton.frame = CGRectMake(WIDTH / 2 + 152, 290, 41, 40);
    [self.searchButton setTitle: @"查询" forState: UIControlStateNormal];
    [self.searchButton setTintColor: [UIColor whiteColor]];
    self.searchButton.titleLabel.font = [UIFont boldSystemFontOfSize: 18];
    [self.searchButton setBackgroundColor: [UIColor clearColor]];
    [self.searchButton.layer setMasksToBounds: YES];
    [self.searchButton.layer setCornerRadius: 9.0];
    [self.searchButton.layer setBorderWidth: 3.0];
    self.searchButton.layer.borderColor = [UIColor whiteColor].CGColor;
    [self.view addSubview: self.searchButton];
    [self.searchButton addTarget: self action: @selector(pressSearch) forControlEvents: UIControlEventTouchUpInside];
    
    self.numField = [[UITextField alloc] init];
    self.numField.frame = CGRectMake(WIDTH / 2 - 150, 290, 300, 40);
    self.numField.placeholder = @"输入待修改学生的学号";
    // "通过KVC修改占位文字的颜色"
    [self.numField setValue:[UIColor grayColor] forKeyPath: @"self.placeholderLabel.textColor"];
    self.numField.borderStyle = UITextBorderStyleNone;
    self.numField.layer.borderColor = [UIColor whiteColor].CGColor;
    self.numField.layer.borderWidth = 3.0;
    self.numField.layer.cornerRadius = 9.0;
    self.numField.layer.masksToBounds = YES;
    self.numField.leftView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"zhanghao.png"]];
    self.numField.leftViewMode = UITextFieldViewModeAlways;
    self.numField.clearButtonMode = UITextFieldViewModeAlways;
    self.numField.backgroundColor = [UIColor clearColor];
    [self.view addSubview: self.numField];
    self.numField.textColor = [UIColor whiteColor];
    
    self.nameField = [[UITextField alloc] init];
    self.nameField.frame = CGRectMake(WIDTH / 2 - 150, 350, 300, 40);
    self.nameField.placeholder = @"输入新姓名";
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
    self.classField.placeholder = @"输入新班级";
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
    self.numberField.placeholder = @"输入新学号";
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
    
    self.modifyButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    self.modifyButton.frame = CGRectMake(WIDTH / 2 - 115, 640, 230, 40);
    [self.modifyButton setTitle: @"修改" forState: UIControlStateNormal];
    [self.modifyButton setTintColor: [UIColor whiteColor]];
    self.modifyButton.titleLabel.font = [UIFont boldSystemFontOfSize: 18];
    [self.modifyButton setBackgroundColor: [UIColor clearColor]];
    [self.modifyButton.layer setMasksToBounds: YES];
    [self.modifyButton.layer setCornerRadius: 9.0];
    [self.modifyButton.layer setBorderWidth: 3.0];
    self.modifyButton.layer.borderColor = [UIColor whiteColor].CGColor;
    [self.view addSubview: self.modifyButton];
    [self.modifyButton addTarget: self action: @selector(pressModify) forControlEvents: UIControlEventTouchUpInside];
}

- (void)pressModify {
    if ([self.nameField.text isEqual: @""] || [self.classField.text isEqualToString: @""] || [self.numberField.text isEqual: @""] || [self.numField.text isEqualToString: @""]) {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle: @"提示" message: @"请将信息填写完整" preferredStyle: UIAlertControllerStyleAlert];
        UIAlertAction* action = [UIAlertAction actionWithTitle: @"确定" style: UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {}];
        [alert addAction: action];
        [self presentViewController: alert animated: YES completion: nil];
    } else {
        int flag = 0;
        for (int i = 0; i < self.arrayNumber.count; ++i) {
            if ([self.numField.text isEqualToString: self.arrayNumber[i]]) {
                self.arrayName[i] = self.nameField.text;
                self.arrayClass[i] = self.classField.text;
                self.arrayNumber[i] = self.numberField.text;
                flag = 1;
                break;
            }
        }
        
        if (flag == 1) {
            [self.delegate pushModifyName: self.arrayName andClass: self.arrayClass andNumber: self.arrayNumber];
            [self dismissViewControllerAnimated: YES completion: nil];
            self.numField.text = nil;
            self.nameField.text = nil;
            self.classField.text = nil;
            self.numberField.text = nil;
        } else {
            UIAlertController* alert = [UIAlertController alertControllerWithTitle: @"提示" message: @"该学号不存在" preferredStyle: UIAlertControllerStyleAlert];
            UIAlertAction* action = [UIAlertAction actionWithTitle: @"确定" style: UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {}];
            [alert addAction: action];
            [self presentViewController: alert animated: YES completion: nil];
        }
    }
}

- (void)pressSearch {
    if ([self.numField.text isEqualToString: @""]) {
        if (!self.searchResultsLabel) self.searchResultsLabel = [[UILabel alloc] init];
        self.searchResultsLabel.frame = CGRectMake(WIDTH / 2 - 175, 230, 350, 40);
        self.searchResultsLabel.text = [NSString stringWithFormat: @"请填写待查询学号"];
        self.searchResultsLabel.textColor = [UIColor redColor];
        self.searchResultsLabel.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview: self.searchResultsLabel];
    } else if ([self isEmpty: self.nameField.text] || [self isEmpty: self.classField.text] || [self isEmpty: self.numberField.text]) {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle: @"提示" message: @"姓名、班级或学号中不能含有空格" preferredStyle: UIAlertControllerStyleAlert];
        UIAlertAction* action = [UIAlertAction actionWithTitle: @"确定" style: UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {}];
        [alert addAction: action];
        [self presentViewController: alert animated: YES completion: nil];
        self.nameField.text = nil;
        self.classField.text = nil;
        self.numberField.text = nil;
    } else if (!([ModifyViewController isChineseCharacter: self.nameField.text] || [ModifyViewController isEnglishCharacter: self.nameField.text]) && !([ModifyViewController isEnglishCharacter: self.classField.text] || [ModifyViewController isNumber: self.classField.text]) && !([ModifyViewController isNumber: self.numberField.text])) {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle: @"提示" message: @"姓名、班级或学号中不能含有特殊字符\n姓名仅支持中英文\n班级仅支持中文与数字\n学号仅支持数字" preferredStyle: UIAlertControllerStyleAlert];
        UIAlertAction* action = [UIAlertAction actionWithTitle: @"确定" style: UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {}];
        [alert addAction: action];
        [self presentViewController: alert animated: YES completion: nil];
        self.nameField.text = nil;
        self.classField.text = nil;
        self.numberField.text = nil;
    } else {
        int flag = 0;
        for (int i = 0; i < self.arrayNumber.count; ++i) {
            if ([self.numField.text isEqualToString: self.arrayNumber[i]]) {
                if (!self.searchResultsLabel) self.searchResultsLabel = [[UILabel alloc] init];
                self.searchResultsLabel.frame = CGRectMake(WIDTH / 2 - 175, 230, 350, 40);
                self.searchResultsLabel.text = [NSString stringWithFormat: @"该学生的姓名为：%@ 班级为：%@", self.arrayName[i], self.arrayClass[i]];
                self.searchResultsLabel.textColor = [UIColor whiteColor];
                self.searchResultsLabel.textAlignment = NSTextAlignmentCenter;
                [self.view addSubview: self.searchResultsLabel];
                flag = 1;
                break;
            }
        }
        
        if (flag == 1) {
            
        } else {
            if (!self.searchResultsLabel) self.searchResultsLabel = [[UILabel alloc] init];
            self.searchResultsLabel.frame = CGRectMake(WIDTH / 2 - 175, 230, 350, 40);
            self.searchResultsLabel.text = [NSString stringWithFormat: @"该学号不存在"];
            self.searchResultsLabel.textColor = [UIColor redColor];
            self.searchResultsLabel.textAlignment = NSTextAlignmentCenter;
            [self.view addSubview: self.searchResultsLabel];
//            UIAlertController* alert = [UIAlertController alertControllerWithTitle: @"提示" message: @"该学号不存在" preferredStyle: UIAlertControllerStyleAlert];
//            UIAlertAction* action = [UIAlertAction actionWithTitle: @"确定" style: UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {}];
//            [alert addAction: action];
//            [self presentViewController: alert animated: YES completion: nil];
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
