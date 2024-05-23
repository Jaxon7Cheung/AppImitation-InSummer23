//
//  PhotoWallViewController.m
//  3G SHARE仿写
//
//  Created by 张旭洋 on 2023/7/28.
//

#import "PhotoWallViewController.h"
#define WIDTH [UIScreen mainScreen].bounds.size.width

@interface PhotoWallViewController ()

@end

@implementation PhotoWallViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithRed: (230.0 / 255) green: (222.0 / 255) blue: (220.0 / 255) alpha: 1];
    UIBarButtonItem* btn1 = [[UIBarButtonItem alloc] initWithImage: [UIImage imageNamed: @"holidayfanhui.png"] style: UIBarButtonItemStylePlain target: self action: @selector(pressReturn)];
    UIBarButtonItem* btn2 = [[UIBarButtonItem alloc] initWithTitle: @"选择图片" menu: nil];
    [self.navigationItem setLeftBarButtonItems: [NSArray arrayWithObjects: btn1, btn2, nil]];
    btn1.tintColor = [UIColor whiteColor];
    btn2.tintColor = [UIColor whiteColor];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle: @"上传" style: UIBarButtonItemStylePlain target: self action: @selector(rightButtonItemPress)];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
        
    self.photoWallScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    self.photoWallScrollView.backgroundColor = [UIColor whiteColor];
    self.photoWallScrollView.contentSize = CGSizeMake(WIDTH, 220 * 5 + 20 );
    [self.view addSubview: self.photoWallScrollView];
        
    self.imageNameArray = [[NSMutableArray alloc]init];;
        
    for (int i = 0; i < 7; i++) {
        self.photoButton = [UIButton buttonWithType: UIButtonTypeCustom];
        [self.photoButton setBackgroundImage:[UIImage imageNamed: [NSString stringWithFormat:@"photo%d.jpg",i + 1]] forState: UIControlStateNormal];
        [self.photoButton setImage: [UIImage imageNamed: @"xvanzhong.png"] forState: UIControlStateSelected];
        //_headPhotoButton.imageEdgeInsets = UIEdgeInsetsMake(0, 64, 65, 0);
        self.photoButton.frame = CGRectMake(4 + WIDTH / 4 * (i % 4), 10 + WIDTH / 4 * (i / 4), WIDTH / 4 - 8, WIDTH / 4 - 8);
        self.photoButton.tag = 101 + i;
        [self.photoButton addTarget: self action: @selector(pressPhoto:) forControlEvents: UIControlEventTouchUpInside];
        [self.photoWallScrollView addSubview: self.photoButton];
        }
    }

    - (void)pressPhoto: (UIButton*)button {
        if (button.selected == NO) {
            int selectNumber = (int)(button.tag - 100);
            self.numbersOfPhoto++;
            [self.imageNameArray addObject: [NSString stringWithFormat: @"photo%d.jpg", selectNumber]];
            button.selected = YES;
        } else {
            int selectNumber = (int)(button.tag - 100);
            self.numbersOfPhoto--;
            [self.imageNameArray removeObject: [NSString stringWithFormat: @"photo%d.jpg", selectNumber]];
            button.selected = NO;
        }
    }

    - (void)rightButtonItemPress {
        if (self.numbersOfPhoto == 0) {
            UIAlertController* boomAlert = [UIAlertController alertControllerWithTitle: @"警告" message: @"请选择至少 1 张图片" preferredStyle: UIAlertControllerStyleAlert];
            UIAlertAction* boomAction = [UIAlertAction actionWithTitle: @"确定" style: UIAlertActionStyleDestructive handler: ^(UIAlertAction* action) {}];
            [boomAlert addAction: boomAction];
            [self presentViewController: boomAlert animated: YES completion: nil];
        } else {
            NSString* message = [NSString stringWithFormat: @"成功上传 %d 张图片!", self.numbersOfPhoto];
            UIAlertController* boomAlert = [UIAlertController alertControllerWithTitle: @"提示" message: message preferredStyle: UIAlertControllerStyleAlert];
            UIAlertAction* boomAction= [UIAlertAction actionWithTitle: @"确定" style: UIAlertActionStyleDefault handler: ^(UIAlertAction *action) {
                [self.navigationController popViewControllerAnimated: YES];
                //[self.navigationController dismissViewControllerAnimated: YES completion: nil];
            }];
            [boomAlert addAction: boomAction];
            [self presentViewController: boomAlert animated:YES completion:nil];
            
            [self.delegate changedPhotoName: self.imageNameArray[0] andNumber: self.numbersOfPhoto];
        }
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
