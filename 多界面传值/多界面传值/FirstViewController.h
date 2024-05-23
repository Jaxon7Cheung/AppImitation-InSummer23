//
//  FirstViewController.h
//  多界面传值
//
//  Created by 张旭洋 on 2023/7/19.
//

#import <UIKit/UIKit.h>
#import "SecondViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface FirstViewController : UIViewController <SecondViewControllerDelegate>

- (void)changeColor: (UIColor *)color;

@end

NS_ASSUME_NONNULL_END
