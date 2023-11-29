//
//  AppDelegate.mm
//  CSExampleObjC
//
//  Created by Jinwoo Kim on 11/29/23.
//

#import "AppDelegate.hpp"
#import "SceneDelegate.hpp"
#import "ImmersiveSceneDelegate.hpp"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    return YES;
}

- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)option {
    __block NSUserActivity * _Nullable immersiveUserActivity = nil;
    
    [option.userActivities enumerateObjectsUsingBlock:^(NSUserActivity * _Nonnull obj, BOOL * _Nonnull stop) {
        if ([obj.activityType isEqualToString:@"ImmersiveSpace"]) {
            immersiveUserActivity = obj;
            *stop = YES;
        }
    }];
    
    if (immersiveUserActivity) {
        UISceneConfiguration *configuration = connectingSceneSession.configuration;
        configuration.delegateClass = ImmersiveSceneDelegate.class;
        configuration.sceneClass = NSClassFromString(@"CPImmersiveScene");
        return configuration;
    } else {
        UISceneConfiguration *configuration = connectingSceneSession.configuration;
        configuration.delegateClass = SceneDelegate.class;
        return configuration;
    }
}

@end
