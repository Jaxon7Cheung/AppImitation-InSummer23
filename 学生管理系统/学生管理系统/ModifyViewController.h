//
//  ModifyViewController.h
//  学生管理系统
//
//  Created by 张旭洋 on 2023/7/31.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ModifyDelegate <NSObject>

- (void)pushModifyName: (NSMutableArray *)arrayName andClass: (NSMutableArray *)arrayClass andNumber: (NSMutableArray *)arrayNumber;

@end

@interface ModifyViewController : UIViewController

@property (nonatomic, strong)id<ModifyDelegate> delegate;

+ (BOOL)isChineseCharacter:(NSString*)source;
+ (BOOL)isEnglishCharacter:(NSString*)source;

@property (nonatomic, strong)UIButton* searchButton;
@property (nonatomic, strong)UILabel* searchResultsLabel;

@property (nonatomic, strong)UITextField* numField;
@property (nonatomic, strong)UITextField* nameField;
@property (nonatomic, strong)UITextField* classField;
@property (nonatomic, strong)UITextField* numberField;

@property (nonatomic, strong)NSMutableArray* arrayName;
@property (nonatomic, strong)NSMutableArray* arrayClass;
@property (nonatomic, strong)NSMutableArray* arrayNumber;

@property (nonatomic, strong)UIButton* modifyButton;

@end

NS_ASSUME_NONNULL_END
