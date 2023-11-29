//
//  main.m
//  CSExampleObjC
//
//  Created by Jinwoo Kim on 11/29/23.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "AppDelegate.hpp"

int main(int argc, char * argv[]) {
    NSAutoreleasePool *pool = [NSAutoreleasePool new];
    auto result = UIApplicationMain(argc, argv, nil, NSStringFromClass(AppDelegate.class));
    [pool release];
    return result;
}
