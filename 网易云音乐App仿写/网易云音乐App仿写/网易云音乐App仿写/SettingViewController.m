//
//  SettingViewController.m
//  网易云音乐App仿写
//
//  Created by 张旭洋 on 2023/7/21.
//

#import "SettingViewController.h"
#import "SettingTableViewCell.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIBarButtonItem* leftBtn = [[UIBarButtonItem alloc] initWithImage: [UIImage imageNamed: @"touxiang"]  menu: nil];
    self.navigationItem.leftBarButtonItem = leftBtn;
    self.view.backgroundColor = [UIColor colorWithRed: 239.0 / 255 green: 239.0 / 255 blue: 245.0 / 255 alpha: 1.0];
    
    self.tableView = [[UITableView alloc] initWithFrame: CGRectMake(16, 0, self.view.bounds.size.width - 32, self.view.bounds.size.height) style: UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.layer.cornerRadius = 9;
    self.tableView.layer.masksToBounds = YES;
    self.tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview: self.tableView];
    
    [self.tableView registerClass: [SettingTableViewCell class] forCellReuseIdentifier: @"caidan"];
    [self.tableView registerClass: [SettingTableViewCell class] forCellReuseIdentifier: @"heijiao"];
    [self.tableView registerClass: [SettingTableViewCell class] forCellReuseIdentifier: @"hongdian"];
    [self.tableView registerClass: [SettingTableViewCell class] forCellReuseIdentifier: @"night"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 6;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else if (section == 1) {
        return 3;
    } else if (section == 2) {
        return 7;
    } else if (section == 3) {
        return 9;
    } else if (section == 4) {
        return 8;
    } else if (section == 5) {
        return 1;
    } else {
        return 0;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 155;
    } else {
        return 66;
    }
}

//获取每组头部标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section == 2) {
        return @"音乐服务";
    } else if (section == 3) {
        return @"其他";
    } else {
        return nil;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSMutableArray* arrayLabel = [NSMutableArray arrayWithObjects: @[@""], @[@"我的消息", @"云贝中心", @"创作者中心"], @[@"趣测", @"云村有票", @"多多西西口袋", @"商城",  @"Beat专区",  @"口袋彩铃",  @"游戏专区"],  @[@"设置",  @"深色模式",  @"定时关闭",  @"个性装扮",  @"边听边存",  @"在线听歌免流量",  @"音乐黑名单",  @"青少年模式",  @"音乐闹钟"],  @[@"我的订单",  @"优惠券",  @"我的客服",  @"分享网易云音乐",  @"个人信息收集与使用清单",  @"个人信息第三方共享清单",  @"个人信息隐私保护",  @"关于"], @[@"退出登录/关闭"], nil];
    self.cell = [self.tableView dequeueReusableCellWithIdentifier: @"caidan"];
    if (indexPath.section != 5) {
        self.cell = [[SettingTableViewCell alloc] initWithStyle: UITableViewCellStyleValue1 reuseIdentifier: @"caidan"];
        self.cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    } else if (indexPath.section ==  5) {
        self.cell = [[SettingTableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier: @"caidan"];
        self.cell.textLabel.textColor = [UIColor redColor];
        self.cell.textLabel.textAlignment = NSTextAlignmentCenter;
    }
    self.cell.textLabel.text = arrayLabel[indexPath.section][indexPath.row];
    
    if (indexPath.section == 1 && indexPath.row == 1) {
        self.cell.detailTextLabel.text = @"签到";
    } else if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            self.cell.detailTextLabel.text = @"点击查看今日运势";
        } else if (indexPath.row == 4) {
            self.cell.detailTextLabel.text = @"投稿赢万元好礼！";
        } else if (indexPath.row == 6) {
            self.cell.detailTextLabel.text = @"音乐浇灌治愈花园";
        }
    } else if (indexPath.section == 3) {
        if (indexPath.row == 4) {
            self.cell.detailTextLabel.text = @"未开启";
        } else if (indexPath.row == 7) {
            self.cell.detailTextLabel.text = @"未开启";
        }
    }
    self.cell.detailTextLabel.font = [UIFont systemFontOfSize: 13];
    if (indexPath.section != 0) {
        self.cell.imageView.image = [UIImage imageNamed: [NSString stringWithFormat: @"x%ld%ld.png", (long)indexPath.section, (long)indexPath.row]];
    }

    self.cell00 = [self.tableView dequeueReusableCellWithIdentifier: @"heijiao"];
    self.cell01 = [self.tableView dequeueReusableCellWithIdentifier: @"hongdian"];
    self.cell01.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    self.cell01.textLabel.text = @"我的消息";
    self.cell01.imageView.image = [UIImage imageNamed: @"x10.png"];
  

    
    
    if (indexPath.section == 1 && indexPath.row == 0) {
        return self.cell01;
    } else if (indexPath.section == 0) {
        return self.cell00;
    } else if (indexPath.section == 3 && indexPath.row == 1) {
        self.cellNight = [self.tableView dequeueReusableCellWithIdentifier: @"night"];
        return self.cellNight;
    } else {
        return self.cell;
    }
    
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Cell 分区圆角
    CGFloat radius = 10;
    if ([tableView numberOfRowsInSection:indexPath.section] == 1) {
        // 当前section有且仅有1行，则四个角都要绘制圆角
        UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:cell.bounds cornerRadius:radius];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = cell.bounds;
        maskLayer.path = maskPath.CGPath;
        cell.layer.mask = maskLayer;
    } else {
        // 当前section不止1行
        if (indexPath.row == 0) {
            // 当前cell为第一行
            UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:cell.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(radius, radius)];
            CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
            maskLayer.frame = cell.bounds;
            maskLayer.path = maskPath.CGPath;
            cell.layer.mask = maskLayer;
          
        } else if (indexPath.row == [tableView numberOfRowsInSection: indexPath.section] - 1) {
            // 当前cell为最后一行
            UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:cell.bounds byRoundingCorners:UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(radius, radius)];
            CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
            maskLayer.frame = cell.bounds;
            maskLayer.path = maskPath.CGPath;
            cell.layer.mask = maskLayer;
        } else {
            // 当前cell为中间行
            cell.layer.mask = nil;
        }
    }
}

- (void)pressNight: (UISwitch *)sw {
    if (sw.on == NO) {
        self.tableView.backgroundColor = [UIColor whiteColor];
        self.view.backgroundColor = [UIColor colorWithRed: 239.0 / 255 green: 239.0 / 255 blue: 245.0 / 255 alpha: 1.0];
        
    } else {
        self.tableView.backgroundColor = [UIColor blackColor];
        self.view.backgroundColor = [UIColor blackColor];
        self.cell.contentView.backgroundColor = [UIColor colorWithRed: 23.0 / 255 green: 23.0 / 255 blue: 25.0 / 255 alpha: 1.0];
        self.cell00.contentView.backgroundColor = [UIColor colorWithRed: 23.0 / 255 green: 23.0 / 255 blue: 25.0 / 255 alpha: 1.0];
        self.cell01.contentView.backgroundColor = [UIColor colorWithRed: 23.0 / 255 green: 23.0 / 255 blue: 25.0 / 255 alpha: 1.0];
    }
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
