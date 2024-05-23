//
//  LoginViewController.h
//  学生管理系统
//
//  Created by 张旭洋 on 2023/7/31.
//

#import <UIKit/UIKit.h>
#import "RegisterViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface LoginViewController : UIViewController <RegisterDelegate>

- (void)pushUser:(NSMutableArray *)arrayUserName andPassword:(NSMutableArray *)arrayPassWord;

@property (nonatomic, strong)UIImageView* iView;

@property (nonatomic, strong)UITextField* userNameField;
@property (nonatomic, strong)UITextField* passWordField;
@property (nonatomic, strong)NSMutableArray* arrayUserName;
@property (nonatomic, strong)NSMutableArray* arrayPassWord;

@property (nonatomic, strong)UIButton* leftBtn;
@property (nonatomic, strong)UIButton* rightBtn;
@property (nonatomic, strong)RegisterViewController* registerViewController;

@end

NS_ASSUME_NONNULL_END
