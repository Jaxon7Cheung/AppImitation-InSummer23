//
//  FirstViewController.m
//  3G SHARE仿写
//
//  Created by 张旭洋 on 2023/7/26.
//

#import "FirstViewController.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height
#import "MainTableViewCell.h"
#define kImageCount 4
#import "HolidayViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UILabel* titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"SHARE";
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont boldSystemFontOfSize: 26];
    self.navigationItem.titleView = titleLabel;
    self.scrollView = [[UIScrollView alloc] initWithFrame: self.view.bounds];
    self.scrollView.contentSize = CGSizeMake(WIDTH, HEIGHT * 1.15);
    self.scrollView.scrollEnabled = YES;
    self.scrollView.pagingEnabled = NO;
    self.scrollView.backgroundColor = [UIColor colorWithDisplayP3Red: 234.0 / 255 green: 234.0 / 255 blue: 234.0 / 255 alpha: 234.0 / 255];
    
    self.advertisementView = [[UIScrollView alloc] initWithFrame: CGRectMake(WIDTH / 2 - 185, 0, 370, 200)];
    self.advertisementView.contentSize = CGSizeMake(370 * 3, 200);
    self.advertisementView.scrollEnabled = YES;
    self.advertisementView.pagingEnabled = YES;
    self.advertisementView.showsHorizontalScrollIndicator = NO;
    //self.advertisementView.backgroundColor = [UIColor systemMintColor];
    self.advertisementView.contentOffset = CGPointMake(370, 0);
    self.advertisementView.delegate = self;
    self.leftImageView = [[UIImageView alloc] init];
    self.leftImageView.frame = CGRectMake(0, 0, 370, 205);
    self.centerImageView = [[UIImageView alloc] init];
    self.centerImageView.image = [UIImage imageNamed: @"main_img1.png"];
    self.centerImageView.frame = CGRectMake(370 * 1, 0, 370, 205);
    self.rightImageView = [[UIImageView alloc] init];
    self.rightImageView.frame = CGRectMake(370 * 2, 0, 370, 205);
    [self.advertisementView addSubview: self.leftImageView];
    [self.advertisementView addSubview: self.centerImageView];
    [self.advertisementView addSubview: self.rightImageView];
//        for (int i = 0; i < 5; ++i) {
//            NSString* strName = [NSString stringWithFormat: @"a%d.jpg", i + 1];
//            UIImage* image = [UIImage imageNamed: strName];
//            UIImageView* iView = [[UIImageView alloc] initWithImage: image];
//            iView.frame = CGRectMake(12.5 + WIDTH * i, 5, WIDTH - 25, (WIDTH - 45) * 0.618 - 75);
//
//            iView.layer.cornerRadius = 9;
//            iView.layer.masksToBounds = YES;
//            [self.scrollView addSubview: iView];
//        }
    self.pageControl = [[UIPageControl alloc] init];
    self.pageControl.numberOfPages = 5; // 设置总页面数量
    self.pageControl.currentPage = 0; // 设置当前页面索引
    self.pageControl.pageIndicatorTintColor = [UIColor grayColor]; // 设置未选中页面指示器颜色
    self.pageControl.currentPageIndicatorTintColor = [UIColor whiteColor]; // 设置当前页面指示器颜色
    self.pageControl.frame = CGRectMake(WIDTH / 2 - 195, 175, self.scrollView.bounds.size.width, 50);
    [self.advertisementView addSubview: self.pageControl];
    [self.advertisementView bringSubviewToFront: self.pageControl];
    [self setupTimer];
    
    self.tableView = [[UITableView alloc] initWithFrame: CGRectMake(WIDTH / 2 - 185, 220, 370, HEIGHT * 1.15 - 220) style: UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.scrollView addSubview: self.tableView];
    self.tableView.backgroundColor = [UIColor clearColor];
    
    [self.scrollView addSubview: self.advertisementView];
    [self.view addSubview: self.scrollView];
    
    
    
    [self.tableView registerClass: [MainTableViewCell class] forCellReuseIdentifier: @"h"];
    [self.tableView registerClass: [MainTableViewCell class] forCellReuseIdentifier: @"paint"];
    [self.tableView registerClass: [MainTableViewCell class] forCellReuseIdentifier: @"design"];
    [self.tableView registerClass: [MainTableViewCell class] forCellReuseIdentifier: @"order"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 145;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 3;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* view = [[UITableViewHeaderFooterView alloc] initWithFrame: CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 0)];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 3;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView* view = [[UITableViewHeaderFooterView alloc] initWithFrame: CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 0)];
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MainTableViewCell* cell01 = [self.tableView dequeueReusableCellWithIdentifier: @"h"];
    MainTableViewCell* cell02 = [self.tableView dequeueReusableCellWithIdentifier: @"paint"];
    MainTableViewCell* cell03 = [self.tableView dequeueReusableCellWithIdentifier: @"design"];
    MainTableViewCell* cell04 = [self.tableView dequeueReusableCellWithIdentifier: @"order"];

    if (indexPath.section == 0) {
        self.likeIcon = [UIButton buttonWithType: UIButtonTypeCustom];
        self.likeIcon.selected = NO;
        [self.likeIcon setImage: [UIImage imageNamed: @"aixin.png"] forState: UIControlStateSelected];
        [self.likeIcon setImage: [UIImage imageNamed: @"xihuan.png"] forState: UIControlStateNormal];
        [self.likeIcon addTarget: self action: @selector(pressLike) forControlEvents: UIControlEventTouchUpInside];
        self.likeIcon.frame = CGRectMake(210, 65, 26, 26);
        
        self.mainLabel = [[UILabel alloc] init];
        self.mainLabel.font = [UIFont boldSystemFontOfSize: 19];
        self.mainLabel.numberOfLines = 2;
        self.writerLabel = [[UILabel alloc] init];
        self.writerLabel.font = [UIFont boldSystemFontOfSize: 15];
        self.writerLabel.textColor = [UIColor darkGrayColor];
        self.typeLabel = [[UILabel alloc] init];
        self.typeLabel.font = [UIFont boldSystemFontOfSize: 11];
        self.typeLabel.textColor = [UIColor grayColor];
        self.timeLabel = [[UILabel alloc] init];
        self.timeLabel.font = [UIFont boldSystemFontOfSize: 11];
        self.timeLabel.textColor = [UIColor grayColor];
        //alloc后会自动释放吗？？？
        
        self.viewingIcon = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"guankan.png"]];
        self.shareIcon = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"fenxiang.png"]];
        
        self.iView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"list_img1.png"]];
        //self.mainLabel = [[UILabel alloc] init];
        self.mainLabel.text = @"假日";
        //self.mainLabel.font = [UIFont boldSystemFontOfSize: 25];
        self.writerLabel.text = @"SHARE 小白";
        self.typeLabel.text = @"原创-插画-练习习作";
        self.timeLabel.text = @"15分钟前";
        
        [cell01 addSubview: self.iView];
        [cell01 addSubview: self.mainLabel];
        [cell01 addSubview: self.writerLabel];
        [cell01 addSubview: self.typeLabel];
        [cell01 addSubview: self.timeLabel];
        [cell01 addSubview: self.likeIcon];
        [cell01 addSubview: self.viewingIcon];
        [cell01 addSubview: self.shareIcon];
        
        self.iView.frame = CGRectMake(0, 0, 195, 145);
        self.mainLabel.frame = CGRectMake(200, 10, 155, 50);
        self.writerLabel.frame = CGRectMake(200, 40, 155, 50);
        self.typeLabel.frame = CGRectMake(200, 57, 155, 50);
        self.timeLabel.frame = CGRectMake(200, 72, 155, 50);
        self.likeIcon.frame = CGRectMake(210, 110, 26, 26);
        self.viewingIcon.frame = CGRectMake(270, 110, 26, 26);
        self.shareIcon.frame = CGRectMake(330, 110, 26, 26);
        return cell01;
    } else if (indexPath.section == 1) {
        return cell02;
    } else if (indexPath.section == 2) {
        return cell03;
    } else if (indexPath.section == 3) {
        return cell04;
    } else {
        return nil;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (!self.holidayVieww) self.holidayVieww = [[HolidayViewController alloc] init];
        self.holidayVieww.view.backgroundColor = [UIColor whiteColor];
        
        
        //UINavigationController* navigationHoliday = [[UINavigationController alloc] initWithRootViewController: holidayView];
        

        
        UINavigationBarAppearance* appearance = [[UINavigationBarAppearance alloc] init];
        appearance.backgroundColor = [UIColor colorWithRed: (43.0 / 255) green: (123.0 / 255) blue: (191.0 / 255) alpha: 1];
        self.holidayVieww.navigationController.navigationBar.standardAppearance = appearance;
        self.holidayVieww.navigationController.navigationBar.barStyle = UIBarStyleDefault;
        self.holidayVieww.navigationController.navigationBar.scrollEdgeAppearance = appearance;
        
        self.holidayVieww.delegate = self;
        
        
        [self.navigationController pushViewController: self.holidayVieww animated: YES];
        self.holidayVieww.likeIcon.selected = self.likeIcon.selected;
        NSLog(@"%@", self.holidayVieww.likeIcon);

    }
}

- (void)pressLike {
    if (self.likeIcon.selected == NO) {
        self.likeIcon.selected = YES;
    } else {
        self.likeIcon.selected = NO;
    }
}

- (void)pushHeart: (BOOL)select {
    self.likeIcon.selected = select;
}

//拖拽画布，更新pageControl页数
- (void)scrollViewDidEndDecelerating: (UIScrollView *)scrollView {
    if (scrollView == self.advertisementView) {
//        double page = scrollView.contentOffset.x / scrollView.bounds.size.width;
//        self.pageControl.currentPage = page;
        [self reloadImage];
        [self.advertisementView setContentOffset: CGPointMake(370, 0) animated: NO];
        self.pageControl.currentPage = self.currentImageIndex;
        
    }
}
//初始化定时器
- (void)setupTimer {
    self.timer = [NSTimer timerWithTimeInterval: 2.0 target: self selector: @selector(timerChanged) userInfo: nil repeats: YES];
    [[NSRunLoop currentRunLoop] addTimer: self.timer forMode: NSRunLoopCommonModes];
}
//定时器生效，图片自动轮播
- (void)timerChanged {
//    int page = (self.pageControl.currentPage + 1) % kImageCount;
//    self.pageControl.currentPage = page;
    [self reloadImage];
    [self.advertisementView setContentOffset: CGPointMake(370, 0) animated: NO];
    [self.advertisementView setContentOffset: CGPointMake(370 * 2, 0) animated: YES];
    self.pageControl.currentPage = (self.currentImageIndex + 1) % kImageCount;
    //[self pageChanged: self.pageControl];
}
//根据页数改变偏移量
- (void)pageChanged: (UIPageControl *)pageControl {
    //根据页数，获得对应位置图片的x坐标
    //CGFloat x = pageControl.currentPage * WIDTH;
    //[self.scrollView setContentOffset: CGPointMake(x, 0) animated: YES];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    if (scrollView == self.advertisementView) [self.timer invalidate];
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (scrollView == self.advertisementView) [self setupTimer];
}


- (void)reloadImage {
    NSUInteger leftImageIndex, rightImageIndex;
    CGPoint offset = [self.advertisementView contentOffset];
    
    if (offset.x == 2 * 370) {
        self.currentImageIndex = (self.currentImageIndex + 1) % kImageCount;
        self.pageControl.currentPage = (self.pageControl.currentPage + 1) % kImageCount;
    } else if (offset.x == 0) {
        self.currentImageIndex = (self.currentImageIndex - 1) % kImageCount;
        self.pageControl.currentPage = (self.pageControl.currentPage - 1) % kImageCount;
    }
    
    self.centerImageView.image = [UIImage imageNamed: [NSString stringWithFormat: @"main_img%lu.png", self.currentImageIndex + 1]];
    
    //重新设置左右图片
    leftImageIndex = (self.currentImageIndex - 1) % kImageCount;
    rightImageIndex = (self.currentImageIndex + 1) % kImageCount;
    
    self.leftImageView.image = [UIImage imageNamed: [NSString stringWithFormat: @"main_img%lu.png", leftImageIndex + 1]];
    self.rightImageView.image = [UIImage imageNamed: [NSString stringWithFormat: @"main_img%lu.png", rightImageIndex + 1]];
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
