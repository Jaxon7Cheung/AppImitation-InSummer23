//
//  HolidayViewController.m
//  3G SHARE仿写
//
//  Created by 张旭洋 on 2023/7/27.
//

#import "HolidayViewController.h"
#import "HolidayTableViewCell.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width

@interface HolidayViewController ()

@end

@implementation HolidayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UILabel* titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"假日";
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont boldSystemFontOfSize: 26];
    self.navigationItem.titleView = titleLabel;
    
    self.tableView = [[UITableView alloc] initWithFrame: self.view.bounds style: UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview: self.tableView];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage: [UIImage imageNamed: @"holidayfanhui.png"] style: UIBarButtonItemStylePlain target: self action: @selector(pressReturn)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    
    
    [self.tableView registerClass: [HolidayTableViewCell class] forCellReuseIdentifier: @"holidayPage"];
    [self.tableView registerClass: [HolidayTableViewCell class] forCellReuseIdentifier: @"hP"];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 99;
    } else if (indexPath.section == 1) {
        return 1555;
    } else {
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HolidayTableViewCell* cell01 = [self.tableView dequeueReusableCellWithIdentifier: @"holidayPage"];
    
    HolidayTableViewCell* cell02 = [self.tableView dequeueReusableCellWithIdentifier: @"hP"];

    if (indexPath.section == 0) {
        self.likeIcon = [UIButton buttonWithType: UIButtonTypeCustom];
        [self.likeIcon setImage: [UIImage imageNamed: @"aixin.png"] forState: UIControlStateSelected];
        [self.likeIcon setImage: [UIImage imageNamed: @"xihuan.png"] forState: UIControlStateNormal];
        [self.likeIcon addTarget: self action: @selector(pressLike) forControlEvents: UIControlEventTouchUpInside];
        self.likeIcon.frame = CGRectMake(210, 65, 26, 26);
        
        [cell01 addSubview: self.likeIcon];

        return cell01;
    } else if (indexPath.section == 1) {
        return cell02;
    } else {
        return nil;
    }
}

- (void)pressLike {
    if (self.likeIcon.selected == NO) {
        self.likeIcon.selected = YES;
    } else {
        self.likeIcon.selected = NO;
    }
    [self.delegate pushHeart: self.likeIcon.selected];
}

- (void)pressReturn {
    [self.navigationController popViewControllerAnimated: YES];
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
