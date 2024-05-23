//
//  PhotoWallViewController.h
//  3G SHARE仿写
//
//  Created by 张旭洋 on 2023/7/28.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol PhotoWallDelegate <NSObject>

- (void)changedPhotoName: (NSString *)nameOfPhoto andNumber: (int)numbersOfPhoto;

@end

@interface PhotoWallViewController : UIViewController

@property (nonatomic, strong) UIButton* photoButton;
@property (nonatomic, strong) UIImage* photoImage;
@property (nonatomic, strong) UIScrollView* photoWallScrollView;
@property (nonatomic, strong) NSMutableArray* imageNameArray;
@property (nonatomic, assign) int numbersOfPhoto;
@property (nonatomic, assign) id<PhotoWallDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
