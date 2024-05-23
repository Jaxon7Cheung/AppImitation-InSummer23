//
//  FirstViewController.h
//  ZARA App仿写
//
//  Created by 张旭洋 on 2023/7/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FirstViewController : UIViewController <UIScrollViewDelegate>

@property (nonatomic, strong)UIScrollView* scrollView;
@property (nonatomic, strong)UIPageControl* pageControl;

//图片数组
@property (nonatomic, strong)NSArray <NSString *>* imageNameList;

@end

NS_ASSUME_NONNULL_END
