//
//  LoginViewController.h
//  3G SHARE仿写
//
//  Created by 张旭洋 on 2023/7/26.
//

#import "ViewController.h"
#import "RegisterViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface LoginViewController : ViewController <RegisterViewControllerDelegate, UITextFieldDelegate>

- (void)pushUser: (NSMutableArray *)arrayUserName andPassword: (NSMutableArray *)arrayPassWord;

@property (nonatomic, strong)UIImageView* loginView;
@property (nonatomic, strong)UILabel* loginLabel;

@property (nonatomic, strong)UITextField* userName;
@property (nonatomic, strong)UITextField* passWord;
@property (nonatomic, strong)NSMutableArray* arrayUsername;
@property (nonatomic, strong)NSMutableArray* arrayPassword;
@property (nonatomic, strong)RegisterViewController* registerView;
@property (nonatomic, strong)UIAlertController* alertView;


@property (nonatomic, strong)UIButton* leftBtn;
@property (nonatomic, strong)UIButton* rightBtn;
@property (nonatomic, strong)UIButton* autoBtn;
@property (nonatomic, strong)UIButton* autoBtn01;

@property (strong, nonatomic) UIWindow * window;


@end

NS_ASSUME_NONNULL_END
