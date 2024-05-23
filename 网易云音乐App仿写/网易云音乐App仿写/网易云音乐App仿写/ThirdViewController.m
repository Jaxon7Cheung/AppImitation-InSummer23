//
//  ThirdViewController.m
//  网易云音乐App仿写
//
//  Created by 张旭洋 on 2023/7/21.
//

#import "ThirdViewController.h"
#import "SettingViewController.h"
#import "MyTableViewCell.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.leftBtn = [[UIBarButtonItem alloc] initWithImage: [UIImage imageNamed: @"caidan"] style: UIBarButtonItemStylePlain target: self action: @selector(pressMenu)];
    self.rightBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemSearch target: nil action: nil];
    self.navigationItem.leftBarButtonItem = self.leftBtn;
    self.navigationItem.rightBarButtonItem = self.rightBtn;
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor blackColor];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor blackColor];
    
    self.scrollView = [[UIScrollView alloc] initWithFrame: self.view.bounds];
    self.scrollView.backgroundColor = [UIColor colorWithRed: (230.0 / 255) green: (222.0 / 255) blue: (220.0 / 255) alpha: 1];
    //self.scrollView.backgroundColor = [UIColor systemCyanColor];
    self.scrollView.contentSize = CGSizeMake(WIDTH, HEIGHT * 1.05);
    self.scrollView.scrollEnabled = YES;
    self.scrollView.pagingEnabled = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    
    self.topView = [[UIView alloc] initWithFrame: CGRectMake(22, 120, WIDTH - 44, 107)];
    self.topView.layer.cornerRadius = 9;
    self.topView.layer.masksToBounds = YES;
    self.topView.backgroundColor = [UIColor whiteColor];
    self.topViewIdentif = [[UIImageView alloc] initWithFrame: CGRectMake(WIDTH / 2 - 40, 66, 75, 75)];
    self.topViewIdentif.image = [UIImage imageNamed: @"touxiang.jpg"];
    self.topViewIdentif.layer.cornerRadius = 37.5;
    self.topViewIdentif.layer.masksToBounds = YES;
    self.nameD = [[UILabel alloc] initWithFrame: CGRectMake(166, 22, 100, 33)];
    self.nameD.text = @":)";
    self.nameD.font = [UIFont systemFontOfSize: 19];
    self.subLabel = [[UILabel alloc] initWithFrame: CGRectMake(77, 66, 200, 22)];
    self.subLabel.text = @"3 关注 ｜ 0 粉丝 ｜ Lv.3";
    self.subLabel.textColor = [UIColor grayColor];
    self.subLabel.font  =[UIFont systemFontOfSize: 16];
    self.topViewVip = [[UIImageView alloc] initWithFrame: CGRectMake(188, 33, 64, 20)];
    self.topViewVip.image = [UIImage imageNamed: @"chuangxiangzhizunvip.png"];
    self.topViewState = [[UIImageView alloc] initWithFrame: CGRectMake(179, 33, 32, 32)];
    self.topViewState.image = [UIImage imageNamed: @"jihuotianjiazhuangtai.png"];
    [self.scrollView addSubview: self.topViewState];
    [self.topView addSubview: self.topViewVip];
    [self.topView addSubview: self.nameD];
    [self.topView addSubview: self.subLabel];
    
    self.secondView = [[UIView alloc] initWithFrame: CGRectMake(22, 240, WIDTH - 44, 214)];
    self.secondView.layer.cornerRadius = 9;
    self.secondView.layer.masksToBounds = YES;
    self.secondView.backgroundColor = [UIColor whiteColor];
    NSArray* arrayLabel = [NSArray arrayWithObjects: @"最近播放", @"本地下载", @"云盘", @"已购", @"我的好友", @"收藏和赞", @"我的播客", @"乐迷团",  nil];
    for (int i = 0; i < 4; ++i) {
        UIImageView* imageView = [[UIImageView alloc] initWithImage: [UIImage imageNamed: [NSString stringWithFormat: @"z%d.png", i + 1]]];
        imageView.frame = CGRectMake(32 + 80 * i, 32, 32, 32);
        self.secondLabel01 = [[UILabel alloc] initWithFrame: CGRectMake(80 * i, 64, 100, 32)];
        self.secondLabel01.font = [UIFont systemFontOfSize: 15];
        self.secondLabel01.text = arrayLabel[i];
        self.secondLabel01.textColor = [UIColor darkGrayColor];
        self.secondLabel01.textAlignment = NSTextAlignmentCenter;
        [self.secondView addSubview: self.secondLabel01];
        
        UIImageView* imageView01 = [[UIImageView alloc] initWithImage: [UIImage imageNamed: [NSString stringWithFormat: @"z%d.png", i + 5]]];
        imageView01.frame = CGRectMake(32 + 80 * i, 128, 32, 32);
        self.secondLabel02 = [[UILabel alloc] initWithFrame: CGRectMake(80 * i, 160, 100, 32)];
        self.secondLabel02.font = [UIFont systemFontOfSize: 15];
        self.secondLabel02.text = arrayLabel[i + 4];
        self.secondLabel02.textColor = [UIColor darkGrayColor];
        self.secondLabel02.textAlignment = NSTextAlignmentCenter;
        [self.secondView addSubview: self.secondLabel02];

        [self.secondView addSubview: imageView01];
        [self.secondView addSubview: imageView];
    }
    
    self.thirdView = [[UIView alloc] initWithFrame: CGRectMake(22, 470, WIDTH - 44, 107)];
    self.thirdView.layer.cornerRadius = 9;
    self.thirdView.layer.masksToBounds = YES;
    self.thirdView.backgroundColor = [UIColor whiteColor];
    self.likeView = [[UIImageView alloc] initWithFrame: CGRectMake(22, 22, 64, 64)];
    self.likeView.image = [UIImage imageNamed: @"shoucang.jpg"];
    self.likeView.layer.cornerRadius = 9;
    self.likeView.layer.masksToBounds = YES;
    self.supLabel = [[UILabel alloc] initWithFrame: CGRectMake(115, 22, 150, 32)];
    self.supLabel.text = @"我喜欢的音乐";
    self.subbLabel = [[UILabel alloc] initWithFrame: CGRectMake(115, 44, 100, 32)];
    self.subbLabel.text = @"0首";
    self.subbLabel.textColor = [UIColor grayColor];
    self.heartView = [[UIImageView alloc] initWithFrame: CGRectMake(WIDTH - 125, 22, 80, 64)];
    self.heartView.image = [UIImage imageNamed: @"xindong.png"];
    [self.thirdView addSubview: self.heartView];
    [self.thirdView addSubview: self.supLabel];
    [self.thirdView addSubview: self.subbLabel];
    [self.thirdView addSubview: self.likeView];
    


    self.btnLeft = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    self.btnLeft.frame = CGRectMake(40, 584, WIDTH / 2 - 44, 44);
    self.btnLeft.layer.cornerRadius = 9;
    self.btnLeft.layer.masksToBounds = YES;
    self.redView = [[UIView alloc] init];
    self.redView.backgroundColor = [UIColor redColor];
    self.redView.frame = CGRectMake(65, 35, 20, 5);
    [self.btnLeft addSubview: self.redView];
    [self.btnLeft setTitle: @"创建歌单" forState: UIControlStateNormal];
    self.btnLeft.backgroundColor = [UIColor whiteColor];
    [self.btnLeft setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
    self.btnRight = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    self.btnRight.layer.cornerRadius = 9;
    self.btnRight.layer.masksToBounds = YES;
    [self.btnRight setTitle: @"收藏歌单" forState: UIControlStateNormal];
    self.btnRight.frame = CGRectMake(WIDTH / 2 + 7, 584, WIDTH / 2 - 44, 44);
    self.btnRight.backgroundColor = [UIColor colorWithRed: (230.0 / 255) green: (222.0 / 255) blue: (220.0 / 255) alpha: 1];
    //self.btnRight.backgroundColor = [UIColor whiteColor];
    [self.btnRight setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
    [self.btnLeft addTarget: self action: @selector(pressLeft) forControlEvents: UIControlEventTouchUpInside];
    [self.btnRight addTarget: self action: @selector(pressRight) forControlEvents: UIControlEventTouchUpInside];
    
    self.scrollView01 = [[UIScrollView alloc] initWithFrame: CGRectMake(0, HEIGHT - 218, WIDTH, 224)];
    self.scrollView01.contentSize = CGSizeMake(WIDTH * 2, 224);
    self.scrollView01.scrollEnabled = YES;
    self.scrollView01.pagingEnabled = YES;
    self.scrollView01.showsHorizontalScrollIndicator = NO;
    self.scrollView01.bounces = NO;
    self.scrollView01.delegate = self;
//    self.scrollView01.layer.cornerRadius = 9;
//    self.scrollView01.layer.masksToBounds = YES;
    //self.scrollView01.backgroundColor = [UIColor systemMintColor];
    
    [self.view addSubview: self.scrollView];
    [self.scrollView addSubview: self.topView];
    [self.scrollView addSubview: self.topViewIdentif];
    [self.scrollView addSubview: self.secondView];
    [self.scrollView addSubview: self.thirdView];
    [self.scrollView addSubview: self.scrollView01];
    [self.scrollView addSubview: self.btnLeft];
    [self.scrollView addSubview: self.btnRight];
    
    self.tableView = [[UITableView alloc] initWithFrame: CGRectMake(22, 0, WIDTH - 44, 224) style: UITableViewStylePlain] ;
    self.tableView.layer.cornerRadius = 9;
    self.tableView.layer.masksToBounds = YES;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.scrollView01 addSubview: self.tableView];
    self.tableView01 = [[UITableView alloc] initWithFrame: CGRectMake(22 + WIDTH, 0, WIDTH - 44, 224) style: UITableViewStylePlain];
    self.tableView01.layer.cornerRadius = 9;
    self.tableView01.layer.masksToBounds = YES;
    self.tableView01.delegate = self;
    self.tableView01.dataSource = self;
    [self.scrollView01 addSubview: self.tableView01];
    
    [self.tableView registerClass: [MyTableViewCell class] forCellReuseIdentifier: @"segmentTable"];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 87;
}

//头部标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (tableView == self.tableView) {
        return [NSString stringWithFormat: @"创建歌单(%d个)", 1];
    } else {
        return @"创建歌单(2个)";
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyTableViewCell* cell = [self.tableView dequeueReusableCellWithIdentifier: @"segmentTable"];
    cell = [[MyTableViewCell alloc] initWithStyle: UITableViewCellStyleSubtitle reuseIdentifier: @"segmentTable"];
    cell.textLabel.text = @"YO-YO";
    cell.textLabel.font = [UIFont systemFontOfSize: 19];
    cell.detailTextLabel.text = @"9首";
    cell.detailTextLabel.textColor = [UIColor grayColor];
    cell.detailTextLabel.font = [UIFont systemFontOfSize: 15];
    cell.imageView.image = [UIImage imageNamed: [NSString stringWithFormat: @"yoyo.jpg"]];
    cell.imageView.layer.cornerRadius = 9;
    cell.imageView.layer.masksToBounds = YES;
    CGSize itemSize = CGSizeMake(60, 60);
    UIGraphicsBeginImageContext(itemSize);
    CGRect imageRect = CGRectMake(0.0, 0.0, itemSize.width, itemSize.height);
    [cell.imageView.image drawInRect:imageRect];
    cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    //cell.accessoryType = UITableViewCellAccessoryDetailButton;
    
    MyTableViewCell* cell01 = [self.tableView dequeueReusableCellWithIdentifier: @"segmentTable"];
    cell01 = [[MyTableViewCell alloc] initWithStyle: UITableViewCellStyleSubtitle reuseIdentifier: @"segmentTable"];
    cell01.textLabel.text = @"一键导入外部音乐";
    cell01.textLabel.font = [UIFont systemFontOfSize: 19];
    cell01.imageView.image = [UIImage imageNamed: [NSString stringWithFormat: @"yijiandaoru.jpg"]];
    cell01.imageView.layer.cornerRadius = 9;
    cell01.imageView.layer.masksToBounds = YES;
    CGSize itemSize01 = CGSizeMake(60, 60);
    UIGraphicsBeginImageContext(itemSize01);
    CGRect imageRect01 = CGRectMake(0.0, 0.0, itemSize01.width, itemSize01.height);
    [cell01.imageView.image drawInRect:imageRect01];
    cell01.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    MyTableViewCell* cell02 = [self.tableView dequeueReusableCellWithIdentifier: @"segmentTable"];
    cell02 = [[MyTableViewCell alloc] initWithStyle: UITableViewCellStyleSubtitle reuseIdentifier: @"segmentTable"];
    cell02.textLabel.text = @"叮！你收到了来自C418的邀请函！";
    cell02.textLabel.font = [UIFont systemFontOfSize: 19];
    cell02.detailTextLabel.text = @"136首 来自witty qiwei";
    cell02.detailTextLabel.textColor = [UIColor grayColor];
    cell02.detailTextLabel.font = [UIFont systemFontOfSize: 15];
    cell02.imageView.image = [UIImage imageNamed: [NSString stringWithFormat: @"C418.jpg"]];
    cell02.imageView.layer.cornerRadius = 9;
    cell02.imageView.layer.masksToBounds = YES;
    CGSize itemSize02 = CGSizeMake(60, 60);
    UIGraphicsBeginImageContext(itemSize02);
    CGRect imageRect02 = CGRectMake(0.0, 0.0, itemSize02.width, itemSize02.height);
    [cell02.imageView.image drawInRect:imageRect02];
    cell02.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    MyTableViewCell* cell03 = [self.tableView dequeueReusableCellWithIdentifier: @"segmentTable"];
    cell03 = [[MyTableViewCell alloc] initWithStyle: UITableViewCellStyleSubtitle reuseIdentifier: @"segmentTable"];
    cell03.textLabel.text = @"GAP店铺背景音乐";
    cell03.textLabel.font = [UIFont systemFontOfSize: 19];
    cell03.detailTextLabel.text = @"56首 来自颁奖 · 更新";
    cell03.detailTextLabel.textColor = [UIColor grayColor];
    cell03.detailTextLabel.font = [UIFont systemFontOfSize: 15];
    cell03.imageView.image = [UIImage imageNamed: [NSString stringWithFormat: @"GAP.jpg"]];
    cell03.imageView.layer.cornerRadius = 9;
    cell03.imageView.layer.masksToBounds = YES;
    CGSize itemSize03 = CGSizeMake(60, 60);
    UIGraphicsBeginImageContext(itemSize03);
    CGRect imageRect03 = CGRectMake(0.0, 0.0, itemSize03.width, itemSize03.height);
    [cell03.imageView.image drawInRect:imageRect03];
    cell03.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    if (tableView == self.tableView && indexPath.row == 0) {
        return cell;
    } else if (tableView == self.tableView && indexPath.row == 1) {
        return cell01;
    } else if (tableView == self.tableView01 && indexPath.row == 0) {
        return cell02;
    } else if (tableView == self.tableView01 && indexPath.row == 1){
        return cell03;
    } else {
        return nil;
    }
}


- (void)pressMenu {
    SettingViewController* settingView = [[SettingViewController alloc] init];
    [self presentViewController: settingView animated: YES completion: nil];
}

- (void)pressLeft {
    self.btnLeft.backgroundColor = [UIColor whiteColor];
    [self.btnLeft setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
    self.btnRight.backgroundColor = [UIColor colorWithRed: (230.0 / 255) green: (222.0 / 255) blue: (220.0 / 255) alpha: 1];
    [self.btnRight setTitleColor: [UIColor lightGrayColor] forState: UIControlStateNormal];
    [self.scrollView01 setContentOffset: CGPointMake(0, 0) animated: YES];
    //[self.redView removeFromSuperview];
    [self.btnLeft addSubview: self.redView];
}

- (void)pressRight {
    self.btnRight.backgroundColor = [UIColor whiteColor];
    [self.btnRight setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
    self.btnLeft.backgroundColor = [UIColor colorWithRed: (230.0 / 255) green: (222.0 / 255) blue: (220.0 / 255) alpha: 1];
    [self.btnLeft setTitleColor: [UIColor lightGrayColor] forState: UIControlStateNormal];
    [self.scrollView01 setContentOffset: CGPointMake(WIDTH, 0) animated: YES];
    //[self.redView removeFromSuperview];
    [self.btnRight addSubview: self.redView];
}

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    CGFloat contentOffsetX = scrollView.contentOffset.x;
//    NSInteger selectedIndex = (double)(contentOffsetX / scrollView.frame.size.width + 0.5);
//    if (selectedIndex < 1) {
//        [self pressRight];
//    }
//    } else if (selectedIndex > 1) {
//        [self pressLeft];
//    }
    //NSLog(@"y = %f", scrollView.contentOffset.y);
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
