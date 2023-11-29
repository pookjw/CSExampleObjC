//
//  SceneDelegate.mm
//  CSExampleObjC
//
//  Created by Jinwoo Kim on 11/29/23.
//

#import "SceneDelegate.hpp"
#import "RootViewController.hpp"

@implementation SceneDelegate

- (void)dealloc {
    [_window release];
    [super dealloc];
}

- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    auto window = [[UIWindow alloc] initWithWindowScene:static_cast<UIWindowScene *>(scene)];
    auto rootViewController = [RootViewController new];
    window.rootViewController = rootViewController;
    [rootViewController release];
    [window makeKeyAndVisible];
    self.window = window;
    [window release];
}

@end
