//
//  SceneDelegate.m
//  ZARA App仿写
//
//  Created by 张旭洋 on 2023/7/20.
//

#import "SceneDelegate.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"

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
    firstView.view.backgroundColor = [UIColor blackColor];
    //firstView.title = @"🏠";
    firstView.tabBarItem = [[UITabBarItem alloc] initWithTitle: @"Main" image: [UIImage imageNamed: @"icon-shouyeweixuanzhong"] selectedImage: [UIImage imageNamed: @"icon-shouyexuanzhong"] ];
    
    
    SecondViewController* searchView = [[SecondViewController alloc] init];
    searchView.view.backgroundColor = [UIColor blackColor];
    //searchView.title = @"Search";
    searchView.tabBarItem = [[UITabBarItem alloc] initWithTitle: @"Search" image: [UIImage imageNamed: @"sousuoweixuanzhong"] selectedImage: [UIImage imageNamed: @"sousuoxuanzhong"] ];
    
    ThirdViewController* shoppingView = [[ThirdViewController alloc] init];
    //shoppingView.title = @"Shopping";
    shoppingView.tabBarItem = [[UITabBarItem alloc] initWithTitle: @"Shopping" image: [UIImage imageNamed: @"gouwu"] tag: 101];
    
    FourthViewController* personView = [[FourthViewController alloc] init];
    //personView.title = @"Me";
    //personView.view.backgroundColor = [UIColor blackColor];
    personView.tabBarItem = [[UITabBarItem alloc] initWithTitle: @"Me" image: [UIImage imageNamed: @"gerenzhongxin"] tag: 102];
    personView.tabBarItem.badgeValue = @"77";
    personView.tabBarItem.badgeColor = [UIColor blueColor];
    
    UINavigationController* navigation = [[UINavigationController alloc] initWithRootViewController: personView];
    
    
    UITabBarController* tabBarZ = [[UITabBarController alloc] init];
    NSArray* arrayTabBar = [NSArray arrayWithObjects: firstView, searchView, shoppingView, navigation, nil];
    tabBarZ.viewControllers = arrayTabBar;
    
    self.window.rootViewController = tabBarZ;
    
    tabBarZ.tabBar.backgroundColor = [UIColor darkGrayColor];  //LMLY
    tabBarZ.tabBar.tintColor = [UIColor whiteColor];
    tabBarZ.tabBar.unselectedItemTintColor = [UIColor blackColor];
    tabBarZ.tabBar.alpha = 0.9;
    //tabBarZ.selectedIndex = 0;
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
