//
//  PassModifiedViewController.h
//  3G SHARE仿写
//
//  Created by 张旭洋 on 2023/7/30.
//

#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface PassModifiedViewController : ViewController <UITextFieldDelegate>

@property (nonatomic, strong) UITextField *firstTextField;
@property (nonatomic, strong) UITextField *secondTextField;
@property (nonatomic, strong) UITextField *thirdTextField;
@property (nonatomic, strong) UIAlertController * alertController;



@end

NS_ASSUME_NONNULL_END
