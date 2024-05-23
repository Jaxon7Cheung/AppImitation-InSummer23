//
//  SecondViewController.m
//  3G SHARE仿写
//
//  Created by 张旭洋 on 2023/7/26.
//

#import "SecondViewController.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width
#import "UpImageViewController.h"
#import "SearchResultsViewController.h"


@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UILabel* titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"搜索";
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont boldSystemFontOfSize: 26];
    self.navigationItem.titleView = titleLabel;
    self.searchBar = [[UISearchBar alloc] init];
    self.searchBar.placeholder = @"搜索 用户名 作品分类 文章";
    self.searchBar.barTintColor = [UIColor colorWithRed: (230.0 / 255) green: (222.0 / 255) blue: (220.0 / 255) alpha: 1];
    self.searchBar.showsSearchResultsButton = YES;
    self.searchBar.searchResultsButtonSelected = YES;
    self.searchBar.frame = CGRectMake(0, 100, WIDTH, 55);
    [self.view addSubview: self.searchBar];
    self.searchBar.delegate = self;
    
    self.supView1 = [[UIImageView alloc] initWithFrame: CGRectMake(WIDTH / 2 - 185, 175, 85, 30)];
    self.supView1.image = [UIImage imageNamed: @"fenlei.png"];
    UIImageView* lineView1 = [[UIImageView alloc] initWithFrame: CGRectMake(WIDTH / 2 - 185, 200, 370, 5)];
    lineView1.image = [UIImage imageNamed: @"home_line.png"];
    self.supView2 = [[UIImageView alloc] initWithFrame: CGRectMake(WIDTH / 2 - 185, 355, 85, 30)];
    self.supView2.image = [UIImage imageNamed: @"tuijian.png"];
    UIImageView* lineView2 = [[UIImageView alloc] initWithFrame: CGRectMake(WIDTH / 2 - 185, 380, 370, 5)];
    lineView2.image = [UIImage imageNamed: @"home_line.png"];
    self.supView3 = [[UIImageView alloc] initWithFrame: CGRectMake(WIDTH / 2 - 185, 485, 85, 30)];
    self.supView3.image = [UIImage imageNamed: @"shijian.png"];
    UIImageView* lineView3 = [[UIImageView alloc] initWithFrame: CGRectMake(WIDTH / 2 - 185, 510, 370, 5)];
    lineView3.image = [UIImage imageNamed: @"home_line.png"];

    [self.view addSubview: self.supView1];
    [self.view addSubview: self.supView2];
    [self.view addSubview: self.supView3];
    [self.view addSubview: lineView1];
    [self.view addSubview: lineView2];
    [self.view addSubview: lineView3];
    
    NSArray* arrayLabel = [NSArray arrayWithObjects: @"平面设计", @"网页设计", @"UI/icon", @"插画/手绘", @"虚拟与设计", @"影视", @"摄影", @"其他", @"人气最高", @"收藏最多", @"评论最多", @"编辑精选", @"30分钟前", @"1小时前", @"1月前", @"1年前", nil];
    for (int i = 0; i < 4; ++i) {
        UIButton* btn1 = [UIButton buttonWithType: UIButtonTypeRoundedRect];
        btn1.frame = CGRectMake(WIDTH / 2 - 185 + 95 * i,  235, 85, 30);
        btn1.backgroundColor = [UIColor whiteColor];
        [btn1 setTitle: arrayLabel[i] forState: UIControlStateNormal];
        [btn1 setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
        [btn1 setTitleColor: [UIColor whiteColor] forState: UIControlStateSelected];
        btn1.selected = NO;
        btn1.layer.cornerRadius = 3;
        btn1.layer.masksToBounds = YES;
        [self.view addSubview: btn1];
        
        UIButton* btn2 = [UIButton buttonWithType: UIButtonTypeRoundedRect];
        btn2.frame = CGRectMake(WIDTH / 2 - 185 + 95 * i,  295, 85, 30);
        btn2.backgroundColor = [UIColor whiteColor];
        [btn2 setTitle: arrayLabel[i + 4] forState: UIControlStateNormal];
        [btn2 setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
        [btn2 setTitleColor: [UIColor whiteColor] forState: UIControlStateSelected];
        btn2.selected = NO;
        btn2.layer.cornerRadius = 3;
        btn2.layer.masksToBounds = YES;
        [self.view addSubview: btn2];
        
        UIButton* btn3 = [UIButton buttonWithType: UIButtonTypeRoundedRect];
        btn3.frame = CGRectMake(WIDTH / 2 - 185 + 95 * i,  420, 85, 30);
        btn3.backgroundColor = [UIColor whiteColor];
        [btn3 setTitle: arrayLabel[i + 8] forState: UIControlStateNormal];
        [btn3 setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
        [btn3 setTitleColor: [UIColor whiteColor] forState: UIControlStateSelected];
        btn3.selected = NO;
        btn3.layer.cornerRadius = 3;
        btn3.layer.masksToBounds = YES;
        [self.view addSubview: btn3];
        
        UIButton* btn4 = [UIButton buttonWithType: UIButtonTypeRoundedRect];
        btn4.frame = CGRectMake(WIDTH / 2 - 185 + 95 * i,  545, 85, 30);
        btn4.backgroundColor = [UIColor whiteColor];
        [btn4 setTitle: arrayLabel[i + 9] forState: UIControlStateNormal];
        [btn4 setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
        [btn4 setTitleColor: [UIColor whiteColor] forState: UIControlStateSelected];
        btn4.selected = NO;
        btn4.layer.cornerRadius = 3;
        btn4.layer.masksToBounds = YES;
        [self.view addSubview: btn4];
        
        [btn1 addTarget: self action: @selector(pressBtn:) forControlEvents: UIControlEventTouchUpInside];
        [btn2 addTarget: self action: @selector(pressBtn:) forControlEvents: UIControlEventTouchUpInside];
        [btn3 addTarget: self action: @selector(pressBtn:) forControlEvents: UIControlEventTouchUpInside];
        [btn4 addTarget: self action: @selector(pressBtn:) forControlEvents: UIControlEventTouchUpInside];
    }
    
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage: [UIImage imageNamed: @"shangchuantupian.png"] style: UIBarButtonItemStylePlain target: self action: @selector(pressUpImage)];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
}

- (void)pressBtn: (UIButton *)btn {
    if (btn.selected == NO) {
        btn.selected = YES;
        btn.backgroundColor = [UIColor colorWithRed: (35.0 / 255) green: (102.0 / 255) blue: (177.0 / 255) alpha: 1.0];
    } else {
        btn.selected = NO;
        btn.backgroundColor = [UIColor whiteColor];
    }
}

- (void)pressUpImage {
    UpImageViewController* upImageView = [[UpImageViewController alloc] init];
    [self.navigationController pushViewController: upImageView animated: YES];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    if (self.searchBar.text == [NSString stringWithFormat: @"DB"]) {
        SearchResultsViewController* searchResultsView = [[SearchResultsViewController alloc] init];
        [self.navigationController pushViewController: searchResultsView animated: YES];
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
