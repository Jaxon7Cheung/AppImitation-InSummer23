//
//  DeleteViewController.h
//  学生管理系统
//
//  Created by 张旭洋 on 2023/7/31.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol DeleteDelegate <NSObject>

- (void)pushDeleteName: (NSMutableArray *)arrayName andClass: (NSMutableArray *)arrayClass andNumber: (NSMutableArray *)arrayNumber;

@end

@interface DeleteViewController : UIViewController

@property (nonatomic, strong)id<DeleteDelegate> delegate;

@property (nonatomic, strong)UITextField* numberField;

@property (nonatomic, strong)NSMutableArray* arrayName;
@property (nonatomic, strong)NSMutableArray* arrayClass;
@property (nonatomic, strong)NSMutableArray* arrayNumber;

@property (nonatomic, strong)UIButton* deleteButton;

@end

NS_ASSUME_NONNULL_END
