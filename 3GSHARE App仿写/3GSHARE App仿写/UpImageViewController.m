//
//  UpImageViewController.m
//  3G SHARE仿写
//
//  Created by 张旭洋 on 2023/7/28.
//

#import "UpImageViewController.h"
#import "PhotoWallViewController.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width

@interface UpImageViewController ()

@end

@implementation UpImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithRed: (230.0 / 255) green: (222.0 / 255) blue: (220.0 / 255) alpha: 1];
    UIBarButtonItem* btn1 = [[UIBarButtonItem alloc] initWithImage: [UIImage imageNamed: @"holidayfanhui.png"] style: UIBarButtonItemStylePlain target: self action: @selector(pressReturn)];
    UIBarButtonItem* btn2 = [[UIBarButtonItem alloc] initWithTitle: @"上传" menu: nil];
    [self.navigationItem setLeftBarButtonItems: [NSArray arrayWithObjects: btn1, btn2, nil]];
    btn1.tintColor = [UIColor whiteColor];
    btn2.tintColor = [UIColor whiteColor];
    //gao--junjie
    //    self.navigationController.navigationBar.translucent = NO;
    //    self.title = @" ";
    //    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,nil]];
    //    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.choosePhotoButton = [UIButton buttonWithType: UIButtonTypeCustom];
    [self.choosePhotoButton setBackgroundImage: [UIImage imageNamed: @"masaike.png"] forState: UIControlStateNormal];
    //self.choosePhotoButton.backgroundColor = [UIColor grayColor];
    [self.choosePhotoButton setTitle: @"选择图片" forState: UIControlStateNormal];
    [self.choosePhotoButton setTitleColor: [UIColor darkGrayColor] forState: UIControlStateNormal];
    self.choosePhotoButton.titleLabel.font = [UIFont systemFontOfSize: 25];
    self.choosePhotoButton.frame = CGRectMake(27, 105, 170, 170);
    [self.choosePhotoButton addTarget: self action: @selector(pressChoosePhotoButton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: self.choosePhotoButton];
    
    self.navigationIcon = [[UIImageView alloc] initWithImage: [UIImage imageNamed: @"weizhi.png"]];
    self.navigationIcon.frame = CGRectMake(225, 140, 25, 25);
    [self.view addSubview: self.navigationIcon];
    self.locationButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.locationButton.frame = CGRectMake(250, 140, 110, 25);
    self.locationButton.backgroundColor = [UIColor colorWithDisplayP3Red: 50.0 / 255 green: 108.0 / 255 blue: 179.0 / 255 alpha: 1.0];
    [self.locationButton setTitle:@"陕西省，西安市" forState: UIControlStateNormal];
    [self.locationButton setTitleColor: [UIColor whiteColor] forState: UIControlStateNormal];
    self.locationButton.layer.masksToBounds = YES;
    self.locationButton.layer.cornerRadius = 9.0;
    [self.view addSubview: self.locationButton];
    
    self.foldTableView = [[UITableView alloc] init];
    self.foldTableView.frame = CGRectMake(225, 180, 110, 25);
    self.foldTableView.delegate = self;
    self.foldTableView.dataSource = self;
    [self.view addSubview: self.foldTableView];
    [self.foldTableView registerClass: [UITableViewCell class] forCellReuseIdentifier: @"foldcell"];
    self.cellArray = [[NSMutableArray alloc] initWithObjects: @"原创作品", @"设计资料", @"设计教程", @"设计师观点", nil];
    self.foldButton = [UIButton buttonWithType: UIButtonTypeCustom];
    self.foldButton.frame = CGRectMake(315, 168, 48, 48);
    [self.foldButton setImage: [UIImage imageNamed: @"关闭.png"] forState: UIControlStateNormal];
    [self.foldButton addTarget: self action: @selector(pressUnfold) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview: self.foldButton];
    self.foldTableView.layer.cornerRadius = 3.0;
    self.foldTableView.layer.masksToBounds = YES;
    
    NSArray* labelArray = [[NSArray alloc] initWithObjects: @"平面设计", @"网页设计", @"UI/icon", @"插画/手绘", @"虚拟与设计", @"影视", @"摄影", @"其他", nil];
    for (int i = 0; i < 4; ++i) {
        UIButton* btn1 = [UIButton buttonWithType: UIButtonTypeRoundedRect];
        btn1.frame =  CGRectMake(7 + ((WIDTH - 14 - 4 * 85) / 3 + 85) * i, 281, 85, 30);
        btn1.backgroundColor = [UIColor whiteColor];
        [btn1 setBackgroundImage:[UIImage imageNamed:@"background_main.png"] forState:UIControlStateSelected];
        [btn1 setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
        [btn1 setTitleColor: [UIColor whiteColor] forState: UIControlStateSelected];
        [btn1 setTitle: labelArray[i] forState: UIControlStateNormal];
        [self.view addSubview: btn1];
        [btn1 addTarget: self action: @selector(pressBtn:) forControlEvents: UIControlEventTouchUpInside];
        btn1.selected = NO;
        btn1.layer.cornerRadius = 3;
        btn1.layer.masksToBounds = YES;
        
        UIButton* btn2 = [UIButton buttonWithType: UIButtonTypeRoundedRect];
        btn2.frame =  CGRectMake(7 + ((WIDTH - 14 - 4 * 85) / 3 + 85) * i, 331, 85, 30);
        btn2.backgroundColor = [UIColor whiteColor];
        [btn2 setBackgroundImage:[UIImage imageNamed:@"background_main.png"] forState:UIControlStateSelected];
        [btn2 setTitleColor: [UIColor blackColor] forState: UIControlStateNormal];
        [btn2 setTitleColor: [UIColor whiteColor] forState: UIControlStateSelected];
        [btn2 setTitle: labelArray[i + 4] forState: UIControlStateNormal];
        [self.view addSubview: btn2];
        [btn2 addTarget: self action: @selector(pressBtn:) forControlEvents: UIControlEventTouchUpInside];
        btn2.selected = NO;
        btn2.layer.cornerRadius = 3;
        btn2.layer.masksToBounds = YES;
        
        self.nameTextField = [[UITextField alloc] init];
        self.nameTextField.frame = CGRectMake(5, 375, WIDTH - 10, 45);
        self.nameTextField.backgroundColor = [UIColor whiteColor];
        self.nameTextField.font = [UIFont systemFontOfSize:20];
        self.nameTextField.borderStyle = UITextBorderStyleRoundedRect;
        self.nameTextField.placeholder = @"作品名称";
        self.nameTextField.clearButtonMode = UITextFieldViewModeAlways;
        [self.view addSubview: self.nameTextField];
        
        
        self.describeTextField = [[UITextField alloc] init];
        self.describeTextField.frame = CGRectMake(5, 435, WIDTH - 10, 190);
        self.describeTextField.backgroundColor = [UIColor whiteColor];
        self.describeTextField.borderStyle = UITextBorderStyleRoundedRect;
        self.describeTextField.font = [UIFont systemFontOfSize: 20];
        self.describeTextField.placeholder = @"请添加作品说明文章内容......";
        self.describeTextField.clearButtonMode = UITextFieldViewModeAlways;
        self.describeTextField.textAlignment = NSTextAlignmentLeft;
        self.describeTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
        self.describeTextField.adjustsFontSizeToFitWidth = YES;
        self.describeTextField.adjustsFontSizeToFitWidth = YES;
        self.describeTextField.minimumFontSize = 20;
        [self.view addSubview: self.describeTextField];
            
            
        UIButton* publishButton = [UIButton buttonWithType:UIButtonTypeSystem];
        publishButton.frame = CGRectMake(5, 645, WIDTH - 10, 40);
        publishButton.backgroundColor = [UIColor colorWithRed:0.2 green:0.6 blue:0.9 alpha: 1];
        [publishButton setTitle: @"发布" forState: UIControlStateNormal];
        publishButton.titleLabel.font = [UIFont systemFontOfSize:23];
        [publishButton setTitleColor: [UIColor whiteColor] forState: UIControlStateNormal];
        [publishButton addTarget: self action: @selector(pressPublishButton) forControlEvents:UIControlEventTouchUpInside];
        [publishButton.layer setMasksToBounds:YES];
        [publishButton.layer setCornerRadius:8.0];
        [self.view addSubview: publishButton];
        
        UILabel* banLabel = [[UILabel alloc] init];
        banLabel.frame = CGRectMake(27, 693, 100, 21);
        banLabel.text = @"禁止下载";
        banLabel.font = [UIFont systemFontOfSize: 15];
        banLabel.textColor = [UIColor colorWithRed: 0.2 green: 0.6 blue: 0.9 alpha: 1];
        UIButton* banButton = [UIButton buttonWithType:UIButtonTypeCustom];
        banButton.frame = CGRectMake(5, 695, 16, 16);
        [banButton setImage: [UIImage imageNamed: @"allow.png"] forState: UIControlStateNormal];
        [banButton setImage: [UIImage imageNamed: @"ban.png"] forState: UIControlStateSelected];
        [banButton addTarget: self action: @selector(pressBanButton:) forControlEvents: UIControlEventTouchUpInside];
        [self.view addSubview: banLabel];
        [self.view addSubview: banButton];
    }
}

- (void)pressPublishButton {
    if (self.numbersOfPhoto != 0) {
        UIAlertController* boomAlert = [UIAlertController alertControllerWithTitle: @"提示" message:@"您已成功发布！" preferredStyle: UIAlertControllerStyleAlert];
        UIAlertAction* boomAction = [UIAlertAction actionWithTitle: @"确认" style: UIAlertActionStyleDefault handler: ^(UIAlertAction* action) {
            [self.navigationController popViewControllerAnimated: YES];
            //[self.navigationController dismissViewControllerAnimated: YES completion: nil];
        }];
        [boomAlert addAction: boomAction];
        [self presentViewController: boomAlert animated: YES completion: nil];
    } else {
        UIAlertController* boomAlert = [UIAlertController alertControllerWithTitle: @"警告" message: @"请上至少上传一张图片" preferredStyle: UIAlertControllerStyleAlert];
        UIAlertAction* boomAction = [UIAlertAction actionWithTitle: @"好的" style:  UIAlertActionStyleDestructive handler: ^(UIAlertAction* action) {
        }];
        [boomAlert addAction: boomAction];
        [self presentViewController: boomAlert animated: YES completion: nil];
    }
}

- (void)pressBanButton: (UIButton*)button {
    if (button.selected == NO) {
        button.selected = YES;
    } else {
        button.selected = NO;
    }
}

- (void)pressUnfold {
    if (self.foldButton.selected == NO) {
        self.foldTableView.frame = CGRectMake(225, 180, 110, 100);
        [self.foldButton setImage: [UIImage imageNamed: @"打开.png"] forState: UIControlStateNormal];
        self.foldButton.selected = YES;
    } else {
        self.foldTableView.frame = CGRectMake(225, 180, 110, 25);
        [self.foldButton setImage: [UIImage imageNamed: @"关闭.png"] forState: UIControlStateNormal];
        self.foldButton.selected = NO;
    }
    
}

- (void)pressBtn: (UIButton *)btn {
    if (btn.selected == NO) {
        btn.selected = YES;
    } else {
        btn.selected = NO;
    }
    
}

- (void)pressReturn {
    [self.navigationController popViewControllerAnimated: YES];
}

- (void)pressChoosePhotoButton {
    PhotoWallViewController* photoWallViewController = [[PhotoWallViewController alloc] init];
    photoWallViewController.delegate = self;
    [self.navigationController pushViewController: photoWallViewController animated: YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 25;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier: @"foldcell"];
    
    cell.textLabel.text = self.cellArray[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize: 14];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.foldButton.selected == NO) {
        self.foldTableView.frame = CGRectMake(225, 180, 110, 100);
        self.foldButton.selected = YES;
        [self.foldTableView reloadData];
        [self.foldButton setImage: [UIImage imageNamed: @"打开.png"] forState: UIControlStateNormal];
    } else {
        UITableViewCell *cell = [self.foldTableView cellForRowAtIndexPath: indexPath];
        NSString *str = [NSString stringWithFormat: @"%@", cell.textLabel.text];
        
        for (int i = 0; i < 4; i++) {
            if ([self.cellArray[i] isEqualToString: str]) {
                self.cellArray[i] = self.cellArray[0];
                break;
            }
        }
        self.cellArray[0] = str;
        self.foldTableView.frame = CGRectMake(225, 180, 110, 25);
        self.foldButton.selected = NO;
        [self.foldTableView reloadData];
        [self.foldButton setImage: [UIImage imageNamed: @"关闭.png"] forState: UIControlStateNormal];
    }
}

- (void)changedPhotoName: (NSString*)nameOfPhoto andNumber: (int)numbersOfPhoto {
    self.numbersOfPhoto = numbersOfPhoto;
    [self.choosePhotoButton setImage: [UIImage imageNamed: nameOfPhoto] forState: UIControlStateNormal];
    
    UILabel* numbersOfPhotoLabel = [[UILabel alloc] init];
    numbersOfPhotoLabel.frame = CGRectMake(140, 0, 30, 30);
    numbersOfPhotoLabel.backgroundColor = [UIColor clearColor];
    numbersOfPhotoLabel.textAlignment = NSTextAlignmentCenter;
    numbersOfPhotoLabel.text = [NSString stringWithFormat:@"%d", numbersOfPhoto];
    numbersOfPhotoLabel.font = [UIFont systemFontOfSize: 20];
    [self.choosePhotoButton addSubview: numbersOfPhotoLabel];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.nameTextField resignFirstResponder];
    [self.describeTextField resignFirstResponder];
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
