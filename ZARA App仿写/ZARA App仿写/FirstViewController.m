//
//  FirstViewController.m
//  ZARA App仿写
//
//  Created by 张旭洋 on 2023/7/20.
//

#import "FirstViewController.h"
#define HEIGHT [UIScreen mainScreen].bounds.size.height
#define WIDTH [UIScreen mainScreen].bounds.size.width

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //UITabBarItem* tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem: UITabBarSystemItemBookmarks tag: 101];
        
        //self.tabBarItem = tabBarItem;
        
        UIImageView* zaraView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: [NSString stringWithFormat: @"zara-3"]]];
        zaraView.frame = CGRectMake(0, 55, 277, 122);
        
        UIImageView* zarahomeView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: [NSString stringWithFormat: @"zarahome-2"]]];
        zarahomeView.frame = CGRectMake(196, 222, 150, 15);
        
        self.scrollView = [[UIScrollView alloc] init];
        self.scrollView.frame = CGRectMake(50, 255, (HEIGHT - 375) * 0.618, HEIGHT - 375);
        self.scrollView.pagingEnabled = YES;
        self.scrollView.scrollEnabled = YES;
        self.scrollView.showsHorizontalScrollIndicator = NO;
        self.scrollView.delegate = self;
        self.scrollView.contentSize = CGSizeMake((HEIGHT - 375) * 0.618 * 7, HEIGHT - 375);
        
        UIImage* imageFirst = [UIImage imageNamed: [NSString stringWithFormat: @"z5.jpg"]];
        UIImageView* iviewFirst = [[UIImageView alloc] initWithImage: imageFirst];
        iviewFirst.frame = CGRectMake(0, 0, (HEIGHT - 375) * 0.618, (HEIGHT - 375));
        [self.scrollView addSubview: iviewFirst];
        for (int i = 0; i < 5; ++i) {
            NSString* strName = [NSString stringWithFormat: @"z%d.jpg", i + 1];
            UIImage* image = [UIImage imageNamed: strName];
            
            UIImageView* iviewLast = [[UIImageView alloc] initWithImage: image];
            iviewLast.frame = CGRectMake((HEIGHT - 375) * 0.618 * (i + 1), 0, (HEIGHT - 375) * 0.618, (HEIGHT - 375));
            [self.scrollView addSubview: iviewLast];
        }
        UIImage* imageLast = [UIImage imageNamed: [NSString stringWithFormat: @"z1.jpg"]];
        UIImageView* iviewLast = [[UIImageView alloc] initWithImage: imageLast];
        iviewLast.frame = CGRectMake((HEIGHT - 375) * 0.618 * 6, 0, (HEIGHT - 375) * 0.618, (HEIGHT - 375));
        [self.scrollView addSubview: iviewLast];
        
        
        
        [self.view addSubview: self.scrollView];
        [self.view addSubview: zaraView];
        [self.view addSubview: zarahomeView];
        
        
        //
        self.pageControl = [[UIPageControl alloc] init];
        self.pageControl.frame = CGRectMake(0, self.view.bounds.size.height - 175, self.view.bounds.size.width, 50);
        self.pageControl.numberOfPages = 5; // 设置总页面数量
        self.pageControl.currentPage = 0; // 设置当前页面索引
        self.pageControl.pageIndicatorTintColor = [UIColor whiteColor]; // 设置未选中页面指示器颜色
        self.pageControl.currentPageIndicatorTintColor = [UIColor blackColor]; // 设置当前页面指示器颜色
        
        // 添加到视图层次结构中
        [self.view addSubview: self.pageControl];
        
        [self.scrollView setContentOffset: CGPointMake((HEIGHT - 375) * 0.618, 0) animated: NO];
        
        
        [self createLeftBtn];
        [self createRightBtn];
}


//- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
//{
//    CGFloat pageWidth = scrollView.frame.size.width;
//    int currentPage = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
//    self.pageControl.currentPage = currentPage;
//    NSLog(@"did end");
//}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat contentOffsetX = scrollView.contentOffset.x;
    CGFloat screenWidth = CGRectGetWidth(scrollView.frame);
    CGFloat contentWidth = scrollView.contentSize.width;
    // 滚动到最后一张视图之后，将滚动位置重置到第二张图片
    if (contentOffsetX >= contentWidth - screenWidth) {
        [scrollView setContentOffset: CGPointMake(screenWidth, 0) animated: NO];
    }
    // 滚动到第一张视图之前，将滚动位置重置到倒数第二张图片
    else if (contentOffsetX < screenWidth - scrollView.frame.size.width) {
        [scrollView setContentOffset: CGPointMake(contentWidth - 2 * screenWidth, 0) animated: NO];
    }

    
    CGFloat pageWidth = scrollView.frame.size.width;
    int currentPage = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    if (currentPage == 0) {
        self.pageControl.currentPage = 4;
    } else if (currentPage == 6) {
        self.pageControl.currentPage = 0;
    } else {
        self.pageControl.currentPage = currentPage - 1;
    }
    
}

- (void)createLeftBtn
{
    UIButton* leftBtn = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    leftBtn.frame = CGRectMake(35, 444, 50, 50);
    [leftBtn setTitle:@"<<" forState: UIControlStateNormal];
    [leftBtn setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
    [self.view addSubview: leftBtn];
    
    [leftBtn addTarget: self action: @selector(pressLeft) forControlEvents: UIControlEventTouchUpInside];
}

- (void)pressLeft
{
    if (self.pageControl.currentPage == 0) self.pageControl.currentPage = 4;
    else self.pageControl.currentPage--;
    
    [self.scrollView setContentOffset: CGPointMake(self.scrollView.contentOffset.x - (HEIGHT - 375) * 0.618, 0) animated: YES];

}

- (void)createRightBtn
{
    UIButton* rightBtn = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    rightBtn.frame = CGRectMake(WIDTH - 83, 444, 50, 50);
    [rightBtn setTitle:@">>" forState: UIControlStateNormal];
    [rightBtn setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
    [self.view addSubview: rightBtn];
    
    [rightBtn addTarget: self action: @selector(pressRight) forControlEvents: UIControlEventTouchUpInside];

}

- (void)pressRight
{
    if (self.pageControl.currentPage == 4) self.pageControl.currentPage = 0;
    else self.pageControl.currentPage++;
    
    [self.scrollView setContentOffset: CGPointMake(self.scrollView.contentOffset.x + (HEIGHT - 375) * 0.618, 0) animated: YES];

}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
