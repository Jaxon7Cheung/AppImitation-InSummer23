//
//  RegisterViewController.h
//  学生管理系统
//
//  Created by 张旭洋 on 2023/7/31.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol RegisterDelegate <NSObject>

- (void)pushUser: (NSMutableArray *)arrayUserName andPassword: (NSMutableArray *)arrayPassWord;

@end

@interface RegisterViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, strong)id<RegisterDelegate> delegate;

//+ (BOOL)isBlankString:(NSString *)aStr;
+ (BOOL)isChineseCharacter:(NSString*)source;
+ (BOOL)isEnglishCharacter:(NSString*)source;
//- (BOOL)isEmpty:(NSString *) str;

@property (nonatomic, strong)UITextField* usernameTextField;
@property (nonatomic, strong)UITextField* passwordTextField;
@property (nonatomic, strong)NSMutableArray* arrayUserName;
@property (nonatomic, strong)NSMutableArray* arrayPassWord;

@property (nonatomic, strong)UIButton* confirmBtn;

@end

NS_ASSUME_NONNULL_END
