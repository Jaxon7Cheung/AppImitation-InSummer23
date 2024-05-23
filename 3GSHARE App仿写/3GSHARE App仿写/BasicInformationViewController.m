//
//  BasicInformationViewController.m
//  3G SHARE仿写
//
//  Created by 张旭洋 on 2023/7/29.
//

#import "BasicInformationViewController.h"
#import "BasicInformationTableViewCell.h"

@interface BasicInformationViewController ()

@end

@implementation BasicInformationViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithRed: (230.0 / 255) green: (222.0 / 255) blue: (220.0 / 255) alpha: 1];
    UIBarButtonItem* btn1 = [[UIBarButtonItem alloc] initWithImage: [UIImage imageNamed: @"holidayfanhui.png"] style: UIBarButtonItemStylePlain target: self action: @selector(pressReturn)];
    UIBarButtonItem* btn2 = [[UIBarButtonItem alloc] initWithTitle: @"基本资料" menu: nil];
    [self.navigationItem setLeftBarButtonItems: [NSArray arrayWithObjects: btn1, btn2, nil]];
    btn1.tintColor = [UIColor whiteColor];
    btn2.tintColor = [UIColor whiteColor];
    
    
    UILabel *firstlabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 80, 50, 100)];
    firstlabel.text = @"头像";
    firstlabel.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:firstlabel];
    
    UIImageView *imageview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"headShot.png"]];
    imageview.frame = CGRectMake(150, 100, 70, 70);
    [self.view addSubview:imageview];
    
    NSArray *bigArray = [NSArray arrayWithObjects:@"昵称", @"签名", @"性别", @"邮箱", nil];
    NSArray *smallArray = [NSArray arrayWithObjects:@"share小白", @"开心了就笑，不开心了就过会儿再笑", @"", @"186####3@qq.com", nil];
    for (int i = 0; i < 4; i++) {
        UILabel *bigLabel = [[UILabel alloc] init];
        bigLabel.font = [UIFont systemFontOfSize:20];
        bigLabel.frame = CGRectMake(30, 190 + 60 * i, 50, 50);
        bigLabel.text = bigArray[i];
        [self.view addSubview:bigLabel];
        
        UILabel *smallLabel = [[UILabel alloc] init];
        smallLabel.frame = CGRectMake(150, 190 + 60 * i, 200, 50);
        smallLabel.text = smallArray[i];
        [self.view addSubview:smallLabel];
    }
    
    UILabel* maleLabel = [[UILabel alloc] init];
    maleLabel.text = @"男";
    maleLabel.frame = CGRectMake(150, 310, 50, 50);
    [self.view addSubview: maleLabel];
    
    UILabel* femaleLabel = [[UILabel alloc] init];
    femaleLabel.text = @"女";
    femaleLabel.frame = CGRectMake(220, 310, 50, 50);
    [self.view addSubview: femaleLabel];
    
    self.maleButton = [[UIButton alloc] init];
    [self.maleButton setImage: [UIImage imageNamed: @"male.png"] forState: UIControlStateNormal];
    self.maleButton.frame = CGRectMake(180, 325, 20, 20);
    [self.view addSubview: self.maleButton];
    [self.maleButton addTarget: self action: @selector(pressMale) forControlEvents: UIControlEventTouchUpInside];
    
    self.femaleButton = [[UIButton alloc] init];
    [self.femaleButton setImage: [UIImage imageNamed: @"female.png"] forState: UIControlStateNormal];
    self.femaleButton.frame = CGRectMake(250, 325, 20, 20);
    [self.view addSubview: self.femaleButton];
    [self.femaleButton addTarget: self action: @selector(pressFemale) forControlEvents: UIControlEventTouchUpInside];
}

- (void)pressMale {
    [self.maleButton setImage: [UIImage imageNamed: @"male.png"] forState: UIControlStateNormal];
    [self.femaleButton setImage: [UIImage imageNamed: @"female.png"] forState: UIControlStateNormal];
}

- (void)pressFemale {
    [self.maleButton setImage: [UIImage imageNamed: @"female.png"] forState: UIControlStateNormal];
    [self.femaleButton setImage: [UIImage imageNamed: @"male.png"] forState: UIControlStateNormal];
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
