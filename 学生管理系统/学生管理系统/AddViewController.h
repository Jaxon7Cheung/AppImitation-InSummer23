//
//  AddViewController.h
//  学生管理系统
//
//  Created by 张旭洋 on 2023/7/31.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol AddDelegate <NSObject>

- (void)pushName: (NSMutableArray *)arrayName andClass: (NSMutableArray *)arrayClass andNumber: (NSMutableArray *)arrayNumber;

@end

@interface AddViewController : UIViewController

@property (nonatomic, strong)id<AddDelegate> delegate;

+ (BOOL)isChineseCharacter:(NSString*)source;
+ (BOOL)isEnglishCharacter:(NSString*)source;

@property (nonatomic, strong)UITextField* nameField;
@property (nonatomic, strong)UITextField* classField;
@property (nonatomic, strong)UITextField* numberField;
@property (nonatomic, strong)NSMutableArray* arrayName;
@property (nonatomic, strong)NSMutableArray* arrayClass;
@property (nonatomic, strong)NSMutableArray* arrayNumber;

@property (nonatomic, strong)UIButton* addButton;

@end

NS_ASSUME_NONNULL_END
