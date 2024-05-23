//
//  RegisterViewController.h
//  3G SHARE仿写
//
//  Created by 张旭洋 on 2023/7/26.
//

#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@protocol RegisterViewControllerDelegate <NSObject>

- (void)pushUser: (NSMutableArray *)arrayUserName andPassword: (NSMutableArray *)arrayPassWord;

@end

@interface RegisterViewController : ViewController <UITextFieldDelegate>

//设置代理人
@property (nonatomic, strong) id<RegisterViewControllerDelegate> delegate;

@property (nonatomic, strong)UIImageView* loginView;
@property (nonatomic, strong)UILabel* loginLabel;
@property (nonatomic, strong)UITextField* emailTextField;
@property (nonatomic, strong)UITextField* passwordTextField;
@property (nonatomic, strong)UITextField* usernameTextField;
@property (nonatomic, strong)NSMutableArray* arrayUsername;
@property (nonatomic, strong)NSMutableArray* arrayPassword;
@property (nonatomic, strong)UIButton* confirmBtn;

@end

NS_ASSUME_NONNULL_END
