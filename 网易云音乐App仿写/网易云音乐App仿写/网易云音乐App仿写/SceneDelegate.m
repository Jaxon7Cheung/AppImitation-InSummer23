//
//  SceneDelegate.m
//  网易云音乐App仿写
//
//  Created by 张旭洋 on 2023/7/21.
//

#import "SceneDelegate.h"
#import "FirstViewController.h"
#import "FourthViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FifthViewController.h"
#import "SettingViewController.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
    
    UIWindowScene* windowScene = (UIWindowScene *)scene;
    self.window = [[UIWindow alloc] initWithWindowScene: windowScene];
    self.window.frame = windowScene.coordinateSpace.bounds;
    [self.window makeKeyAndVisible];
    
    FirstViewController* firstView = [[FirstViewController alloc] init];
    firstView.view.backgroundColor = [UIColor whiteColor];
    firstView.tabBarItem = [[UITabBarItem alloc] initWithTitle: @"首页" image: [UIImage imageNamed: @"faxian"] selectedImage: [UIImage imageNamed: @"faxianxvanzhong"] ];
    SecondViewController* secondView = [[SecondViewController alloc] init];
    secondView.view.backgroundColor = [UIColor whiteColor];
    secondView.tabBarItem = [[UITabBarItem alloc] initWithTitle: @"播客" image: [UIImage imageNamed: @"boke"] selectedImage: [UIImage imageNamed: @"bokexvanzhong"] ];
    ThirdViewController* thirdView = [[ThirdViewController alloc] init];
    thirdView.view.backgroundColor = [UIColor colorWithRed: (230.0 / 255) green: (222.0 / 255) blue: (220.0 / 255) alpha: 1];
    thirdView.tabBarItem = [[UITabBarItem alloc] initWithTitle: @"我的" image: [UIImage imageNamed: @"wode"] selectedImage: [UIImage imageNamed: @"wode"] ];
    FourthViewController* fourthView = [[FourthViewController alloc] init];
    fourthView.view.backgroundColor = [UIColor whiteColor];
    fourthView.tabBarItem = [[UITabBarItem alloc] initWithTitle: @"关注" image: [UIImage imageNamed: @"guanzhu"] selectedImage: [UIImage imageNamed: @"guanzhu"] ];
    fourthView.view.backgroundColor = [UIColor colorWithRed: (230.0 / 255) green: (222.0 / 255) blue: (220.0 / 255) alpha: 1];
    FifthViewController* fifthView = [[FifthViewController alloc] init];
    fifthView.view.backgroundColor = [UIColor whiteColor];
    fifthView.tabBarItem = [[UITabBarItem alloc] initWithTitle: @"社区" image: [UIImage imageNamed: @"shequ"] selectedImage: [UIImage imageNamed: @"shequ"] ];
    fifthView.view.backgroundColor = [UIColor colorWithRed: (230.0 / 255) green: (222.0 / 255) blue: (220.0 / 255) alpha: 1];
    
    
    
    UINavigationController* navigationFirst = [[UINavigationController alloc] initWithRootViewController: firstView];
    UINavigationController* navigationSecond = [[UINavigationController alloc] initWithRootViewController: secondView];
    UINavigationController* navigationThird = [[UINavigationController alloc] initWithRootViewController: thirdView];
    UINavigationController* navigationFourth =  [[UINavigationController alloc] initWithRootViewController: fourthView];
    UINavigationController* navigationFifth = [[UINavigationController alloc] initWithRootViewController: fifthView];
    //UINavigationController* navigationSetting = [[UINavigationController alloc] initWithRootViewController: settingView];
    
    UINavigationBarAppearance* appearance = [[UINavigationBarAppearance alloc] init];
    appearance.backgroundColor = [UIColor whiteColor];
    UINavigationBarAppearance* appearanceMy = [[UINavigationBarAppearance alloc] init];
    appearanceMy.backgroundColor = [UIColor colorWithRed: (230.0 / 255) green: (222.0 / 255) blue: (220.0 / 255) alpha: 1];
    firstView.navigationController.navigationBar.standardAppearance = appearance;
    firstView.navigationController.navigationBar.barStyle = UIBarStyleDefault;

    //firstView.navigationController.navigationBar.scrollEdgeAppearance = appearance;
    secondView.navigationController.navigationBar.scrollEdgeAppearance = appearance;
    thirdView.navigationController.navigationBar.scrollEdgeAppearance = appearanceMy;
    fourthView.navigationController.navigationBar.scrollEdgeAppearance = appearance;
    fifthView.navigationController.navigationBar.scrollEdgeAppearance = appearance;
    //settingView.navigationController.navigationBar.scrollEdgeAppearance = appearance;
    [[UINavigationBar appearance] setStandardAppearance: appearance];
     
    
    
    NSArray* arrayViewController = [NSArray arrayWithObjects: navigationFirst, navigationSecond, navigationThird, navigationFourth, navigationFifth, nil];
    
    
    UITabBarController* tabBarViewController = [[UITabBarController alloc] init];
    tabBarViewController.viewControllers = arrayViewController;
    self.window.rootViewController = tabBarViewController;
    tabBarViewController.tabBar.tintColor = [UIColor redColor];
    
}


- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
