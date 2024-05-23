//
//  UpImageViewController.h
//  3G SHARE仿写
//
//  Created by 张旭洋 on 2023/7/28.
//

#import <UIKit/UIKit.h>
#import "PhotoWallViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface UpImageViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, PhotoWallDelegate>

@property (nonatomic, strong)UIButton* choosePhotoButton;
@property (nonatomic, strong)UIImageView* navigationIcon;
@property (nonatomic, strong)UIButton* locationButton;

@property NSMutableArray* cellArray;
@property (nonatomic, strong)UIButton* foldButton;
@property (nonatomic, strong)UITableView* foldTableView;

@property (nonatomic, strong)UITextField* nameTextField;
@property (nonatomic, strong)UITextField* describeTextField;
@property (nonatomic, assign) int numbersOfPhoto;

- (void)changedPhotoName: (NSString*)nameOfPhoto andNumber: (int)numbersOfPhoto;

@end

NS_ASSUME_NONNULL_END
