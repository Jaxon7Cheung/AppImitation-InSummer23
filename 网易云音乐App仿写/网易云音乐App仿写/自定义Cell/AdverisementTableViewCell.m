//
//  AdverisementTableViewCell.m
//  网易云音乐App仿写
//
//  Created by 张旭洋 on 2023/7/21.
//

#import "AdverisementTableViewCell.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define kImageCount 5

@implementation AdverisementTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle: style reuseIdentifier: reuseIdentifier];
# pragma mark --♾️无限轮播图🔥
    if ([self.reuseIdentifier isEqualToString: @"advertisement"]) {
        self.scrollView = [[UIScrollView alloc] init];
        self.scrollView.scrollEnabled = YES;
        self.scrollView.pagingEnabled = YES;
        self.scrollView.showsHorizontalScrollIndicator = NO;
        self.scrollView.showsVerticalScrollIndicator = NO;
        self.scrollView.bounces = NO;
        //[self.scrollView setContentOffset: CGPointMake(WIDTH, 0) animated: NO];
    //    self.scrollView
        self.scrollView.delegate = self;
        //self.scrollView.backgroundColor = [UIColor redColor];
        self.scrollView.contentSize = CGSizeMake(WIDTH * 3, (WIDTH - 45) * 0.618 - 65);
        self.scrollView.contentOffset = CGPointMake(WIDTH, 0);
        
        self.leftImageView = [[UIImageView alloc] init];
        self.leftImageView.frame = CGRectMake(12.5 + WIDTH * 0, 5, WIDTH - 25, (WIDTH - 45) * 0.618 - 75);
        self.leftImageView.layer.cornerRadius = 9;
        self.leftImageView.layer.masksToBounds = YES;
        self.centerImageView = [[UIImageView alloc] init];
        self.centerImageView.image = [UIImage imageNamed: @"a1.jpg"];
        self.centerImageView.frame = CGRectMake(12.5 + WIDTH * 1, 5, WIDTH - 25, (WIDTH - 45) * 0.618 - 75);
        self.centerImageView.layer.cornerRadius = 9;
        self.centerImageView.layer.masksToBounds = YES;
        self.rightImageView = [[UIImageView alloc] init];
        self.rightImageView.frame = CGRectMake(12.5 + WIDTH * 2, 5, WIDTH - 25, (WIDTH - 45) * 0.618 - 75);
        self.rightImageView.layer.cornerRadius = 9;
        self.rightImageView.layer.masksToBounds = YES;
        [self.scrollView addSubview: self.centerImageView];
        [self.scrollView addSubview: self.leftImageView];
        [self.scrollView addSubview: self.rightImageView];
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
        
        [self setupTimer];
        
    } else if ([self.reuseIdentifier isEqualToString: @"items"]) {
        self.scrollView01 = [[UIScrollView alloc] init];
        self.scrollView01.scrollEnabled = YES;
        self.scrollView01.pagingEnabled = NO;
        self.scrollView01.contentSize = CGSizeMake(WIDTH * 2.4, 64);
        self.scrollView01.showsHorizontalScrollIndicator = NO;
        //self.scrollView01.backgroundColor = [UIColor systemMintColor];
        
        NSArray* arrayLabel01 = [NSArray arrayWithObjects: @"每日推荐", @"私人漫游", @"歌单", @"排行榜", @"召回有礼", @"有声书", @"数字专辑", @"直播", @"关注新歌", @"一歌一遇", @"收藏家", @"游戏专区", nil];
        
        for (int i = 0; i < 12; ++i) {
            NSString* strName = [NSString stringWithFormat: @"b%d.png", i + 1];
            UIImageView* iView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: strName]];
            iView.frame = CGRectMake(23 + 78 * i, 10, 32, 32);
            [self.scrollView01 addSubview: iView];
            self.label = [[UILabel alloc] initWithFrame: CGRectMake(-9, 15, 50, 50)];
            self.label.font = [UIFont systemFontOfSize: 10];
            self.label.textAlignment = NSTextAlignmentCenter;
            self.label.text = arrayLabel01[i];
            [iView addSubview: self.label];
        }
    } else if ([self.reuseIdentifier isEqualToString: @"recommend"]) {
        self.scrollView02 = [[UIScrollView alloc] init];
        self.scrollView02.scrollEnabled = YES;
        self.scrollView02.pagingEnabled = YES;
        self.scrollView02.alwaysBounceHorizontal = NO;
        self.scrollView02.alwaysBounceVertical = NO;
        self.scrollView02.bounces = NO;
        self.scrollView02.contentSize = CGSizeMake(WIDTH * 2.1, 211);
        self.scrollView02.showsHorizontalScrollIndicator = NO;
        
        NSArray* arrayLabel02 = [NSArray arrayWithObjects: @"🖤撩人磁性嗓：王嘉尔英文歌收录🖤", @"致犹豫😔的恋人们", @"心动中💓情歌说唱藏匿纯粹热恋", @"Spotify | 播放量破10亿的歌曲", @"「欧美」这些999+弹幕神曲你听过几首", @"欧美男声：萦绕心房的柔情与细腻", nil];
        NSArray* arrayLabel2 = [NSArray arrayWithObjects: @"▶️2.5亿", @"▶️1.7万", @"▶️44.8万", @"▶️566.8万", @"▶️556.4万", @"▶️5064.7万", nil];
        
        for (int i = 0; i < 6; ++i) {
            NSString* strName = [NSString stringWithFormat: @"c%d.jpg", i + 1];
            UIImageView* iView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: strName]];
            iView.frame = CGRectMake(10 + 135 * i, 35, 125, 125);
            iView.layer.cornerRadius = 9;
            iView.layer.masksToBounds = YES;
            [self.scrollView02 addSubview: iView];
            self.label02 = [[UILabel alloc] initWithFrame: CGRectMake(10 + 135 * i, 160, 130, 50)];
            self.label02.font = [UIFont systemFontOfSize: 15];
            self.label02.text = arrayLabel02[i];
            self.label02.textColor = [UIColor darkGrayColor];
            self.label02.numberOfLines = 2;
            [self.scrollView02 addSubview: self.label02];
            self.label2 = [[UILabel alloc] initWithFrame: CGRectMake(5, 88, 100, 50)];
            self.label2.font = [UIFont systemFontOfSize: 15];
            self.label2.text = arrayLabel2[i];
            self.label2.textColor = [UIColor whiteColor];
            [iView addSubview: self.label2];
            
        }
        
        self.labelR = [[UILabel alloc] initWithFrame: CGRectMake(10, 8, WIDTH, 25)];
        self.labelR.text = @"推荐歌单 >                                                       :";
        self.labelR.font = [UIFont systemFontOfSize: 20];
        
        //self.scrollView02.backgroundColor = [UIColor systemRedColor];
        
    } else if ([self.reuseIdentifier isEqualToString: @"deeptime"]) {
        self.scrollView03 = [[UIScrollView alloc] init];
        self.scrollView03.delegate = self;
        self.scrollView03.contentSize = CGSizeMake(WIDTH * 3, 255);
        self.scrollView03.scrollEnabled = YES;
        self.scrollView03.pagingEnabled = YES;
        self.scrollView03.showsHorizontalScrollIndicator = NO;
        self.scrollView03.bounces = NO;
        
        self.label03 = [[UILabel alloc] initWithFrame: CGRectMake(10, 50, WIDTH, 25)];
        self.label03.text = @"新歌新碟|数字专辑 >                                    :";
        self.label03.font = [UIFont systemFontOfSize: 20];
        
        
        self.tableView0301 = [[UITableView alloc] initWithFrame: CGRectMake(0, 50, WIDTH, 233) style: UITableViewStylePlain];
        self.tableView0301.delegate = self;
        self.tableView0301.dataSource = self;
        self.tableView0302 = [[UITableView alloc] initWithFrame: CGRectMake(WIDTH, 50, WIDTH, 233) style: UITableViewStylePlain];
        self.tableView0302.delegate = self;
        self.tableView0302.dataSource = self;
        self.tableView0303 = [[UITableView alloc] initWithFrame: CGRectMake(WIDTH * 2, 50, WIDTH, 233) style: UITableViewStylePlain];
        self.tableView0303.delegate = self;
        self.tableView0303.dataSource = self;
        
        [self.tableView0301 registerClass: [UITableViewCell class] forCellReuseIdentifier: @"deeptime01"];
        [self.tableView0302 registerClass: [UITableViewCell class] forCellReuseIdentifier: @"deeptime02"];
        [self.tableView0303 registerClass: [UITableViewCell class] forCellReuseIdentifier: @"deeptime03"];
        
        [self.scrollView03 addSubview: self.tableView0301];
        [self.scrollView03 addSubview: self.tableView0302];
        [self.scrollView03 addSubview: self.tableView0303];
        
//        if (!self.table03Array) {
//            self.table03Array = [NSMutableArray array];
//        }
//        for (int i = 0; i < 3; ++i) {
//            UITableView* tableView = [[UITableView alloc] initWithFrame: CGRectMake(WIDTH * i, 0, self.scrollView03.frame.size.width, self.scrollView03.frame.size.height) ];
//            tableView.delegate = self;
//            tableView.dataSource = self;
//            [self.scrollView03 addSubview: tableView];
//            [self.table03Array addObject: tableView];
//        }
//        self.tableView03 = self.table03Array.firstObject;
        
        
        //self.scrollView03.backgroundColor = [UIColor systemMintColor];
    }
    
    [self.contentView addSubview: self.label03];
    [self.contentView addSubview: self.scrollView03];
    [self.contentView addSubview: self.labelR];
    [self.contentView addSubview: self.scrollView02];
    [self.contentView addSubview: self.scrollView01];
    [self.contentView addSubview: self.scrollView];
    [self.contentView addSubview: self.pageControl];

    
    return self;
}

- (void)layoutSubviews {
    self.scrollView.frame = CGRectMake(0, 0, WIDTH, (WIDTH - 45) * 0.618 - 65);
    self.scrollView01.frame = CGRectMake(0, 0, WIDTH, 64);
    self.scrollView02.frame = CGRectMake(0, 10, WIDTH, 211);
    self.scrollView03.frame = CGRectMake(0, 35, WIDTH, 255);
    self.pageControl.frame = CGRectMake(0, self.scrollView.bounds.size.height - 45, self.scrollView.bounds.size.width, 50);
}

//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
//
//    if (scrollView == self.scrollView03)
//    {
//        CGFloat a = self.scrollView03.contentOffset.x/self.scrollView03.frame.size.width;
//
//        self.tableView03 = [self.table03Array objectAtIndex: a];
//
////        self.segmentView.selectedSegmentIndex = a;
//
//        [self.tableView03 reloadData];
//    }
//}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 65;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
 
// 具体的cell显示
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell01 = [self.tableView0301 dequeueReusableCellWithIdentifier: @"deeptime01"];
    cell01 = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleSubtitle reuseIdentifier: @"deeptime01"];
    NSArray* array01 = [NSArray arrayWithObjects: @"永生所爱", @"Invited", @"Barbaric", nil];
    NSArray* array011 = [NSArray arrayWithObjects: @"为永生所爱 - 莫文蔚", @"我不是什么善妒之人 - Stephanie Poetri", @"你将会获胜 - Blur", nil];
    if (indexPath.row == 0) cell01.imageView.image = [UIImage imageNamed: @"yongshengsuoai.jpg"];
    if (indexPath.row == 1) cell01.imageView.image = [UIImage imageNamed: @"Invited.jpg"];
    if (indexPath.row == 2) cell01.imageView.image = [UIImage imageNamed: @"Barbaric.jpg"];
    cell01.imageView.layer.cornerRadius = 7;
    cell01.imageView.layer.masksToBounds = YES;
    cell01.textLabel.text = [array01 objectAtIndex: indexPath.row];
    cell01.detailTextLabel.textColor = [UIColor grayColor];
    cell01.detailTextLabel.text = [array011 objectAtIndex: indexPath.row];
#pragma mark change the size of imageView on cell
    CGSize itemSize01 = CGSizeMake(55, 55);
    UIGraphicsBeginImageContext(itemSize01);
    CGRect imageRect01 = CGRectMake(0.0, 0.0, itemSize01.width, itemSize01.height);
    [cell01.imageView.image drawInRect:imageRect01];
    cell01.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
#pragma mark 😁😁😁😁😁😁😁😁😁😁
    UITableViewCell* cell02 = [self.tableView0302 dequeueReusableCellWithIdentifier: @"deeptime02"];
    NSArray* array02 = [NSArray arrayWithObjects: @"ME", @"Let Me In", @"仲夏", nil];
    cell02 = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleSubtitle reuseIdentifier: @"deeptime02"];
    NSArray* array022 = [NSArray arrayWithObjects: @"看花朵在盛夏耀眼开放！ - JISOO", @"即使深陷海底，我们依然相拥 - EXO", @"与李宏毅一起开启仲夏之梦 - 李宏毅", nil];
    if (indexPath.row == 0) cell02.imageView.image = [UIImage imageNamed: @"ME.jpg"];
    if (indexPath.row == 1) cell02.imageView.image = [UIImage imageNamed: @"Let Me In.jpg"];
    if (indexPath.row == 2) cell02.imageView.image = [UIImage imageNamed: @"zhongxia.jpg"];
    cell02.imageView.layer.cornerRadius = 7;
    cell02.imageView.layer.masksToBounds = YES;
    cell02.textLabel.text = [array02 objectAtIndex: indexPath.row];
    cell02.detailTextLabel.text = [array022 objectAtIndex: indexPath.row];
    cell02.detailTextLabel.textColor = [UIColor grayColor];
    CGSize itemSize02 = CGSizeMake(55, 55);
    UIGraphicsBeginImageContext(itemSize02);
    CGRect imageRect02 = CGRectMake(0.0, 0.0, itemSize02.width, itemSize02.height);
    [cell02.imageView.image drawInRect:imageRect02];
    cell02.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UITableViewCell* cell03 = [self.tableView0303 dequeueReusableCellWithIdentifier: @"deeptime03"];
    cell03 = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleSubtitle reuseIdentifier: @"deeptime03"];
    NSArray* array03 = [NSArray arrayWithObjects: @"希忘Hope", @"Speak Now（Taylor's Version）", @"I feel", nil];
    NSArray* array033 = [NSArray arrayWithObjects: @"一起倾听华晨宇的希忘哲学~ - 华晨宇", @"和Tayloe Swift一起度过黑色国度~ - Taylor Swift", @"击碎镜像做自己的Queen~ - (G)I-DLE", nil];
    if (indexPath.row == 0) cell03.imageView.image = [UIImage imageNamed: @"xiwang.jpg"];
    if (indexPath.row == 1) cell03.imageView.image = [UIImage imageNamed: @"speaknow.jpg"];
    if (indexPath.row == 2) cell03.imageView.image = [UIImage imageNamed: @"ifeel.jpg"];
    //cell02.imageView.contentMode = UIViewContentModeScaleAspectFit;
    cell03.imageView.layer.cornerRadius = 7;
    cell03.imageView.layer.masksToBounds = YES;
    cell03.textLabel.text = [array03 objectAtIndex: indexPath.row];
    cell03.detailTextLabel.text = [array033 objectAtIndex: indexPath.row];
    cell03.detailTextLabel.textColor = [UIColor grayColor];
    CGSize itemSize03 = CGSizeMake(55, 55);
    UIGraphicsBeginImageContext(itemSize02);
    CGRect imageRect03 = CGRectMake(0.0, 0.0, itemSize03.width, itemSize03.height);
    [cell03.imageView.image drawInRect:imageRect03];
    cell03.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    if (tableView == self.tableView0301) {
        return cell01;
    } else if (tableView == self.tableView0302) {
        return cell02;
    } else {
        return cell03;
    }
}

//拖拽画布，更新pageControl页数
- (void)scrollViewDidEndDecelerating: (UIScrollView *)scrollView {
    if (scrollView == self.scrollView) {
//        double page = scrollView.contentOffset.x / scrollView.bounds.size.width;
//        self.pageControl.currentPage = page;
        [self reloadImage];
        [self.scrollView setContentOffset: CGPointMake(WIDTH, 0) animated: NO];
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
    [self.scrollView setContentOffset: CGPointMake(WIDTH, 0) animated: NO];
    [self.scrollView setContentOffset: CGPointMake(WIDTH * 2, 0) animated: YES];
    self.pageControl.currentPage = (self.currentImageIndex + 1) % kImageCount;
    //[self pageChanged: self.pageControl];
}
//根据页数改变偏移量
- (void)pageChanged: (UIPageControl *)pageControl {
    //根据页数，获得对应位置图片的x坐标
    //CGFloat x = pageControl.currentPage * WIDTH;
    //[self.scrollView setContentOffset: CGPointMake(x, 0) animated: YES];
}
//这里还需要注意的是，由于加入定时器有自动轮播的效果了，会与手动拖拽ScrollView冲突，即手动拖拽ScrollView过程时ScrollView可能自动移动更新图片了，显然这种效果是不符合用户习惯的，这时需要在ScrollView的代理事件中进行处理，即开始拖拽ScrollView时停止定时器，拖拽结束后再开启定时器⏲️。
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    if (scrollView == self.scrollView) [self.timer invalidate];
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (scrollView == self.scrollView) [self setupTimer];
}


- (void)reloadImage {
    NSUInteger leftImageIndex, rightImageIndex;
    CGPoint offset = [self.scrollView contentOffset];
    
    if (offset.x == 2 * WIDTH) {
        self.currentImageIndex = (self.currentImageIndex + 1) % kImageCount;
        self.pageControl.currentPage = (self.pageControl.currentPage + 1) % kImageCount;
    } else if (offset.x == 0) {
        self.currentImageIndex = (self.currentImageIndex - 1) % kImageCount;
        self.pageControl.currentPage = (self.pageControl.currentPage - 1) % kImageCount;
    }
    
    self.centerImageView.image = [UIImage imageNamed: [NSString stringWithFormat: @"a%lu.jpg", self.currentImageIndex + 1]];
    
    //重新设置左右图片
    leftImageIndex = (self.currentImageIndex - 1) % kImageCount;
    rightImageIndex = (self.currentImageIndex + 1) % kImageCount;
    
    self.leftImageView.image = [UIImage imageNamed: [NSString stringWithFormat: @"a%lu.jpg", leftImageIndex + 1]];
    self.rightImageView.image = [UIImage imageNamed: [NSString stringWithFormat: @"a%lu.jpg", rightImageIndex + 1]];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
