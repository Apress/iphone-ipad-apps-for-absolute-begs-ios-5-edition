//
//  switchAppDelegate.h
//  switch
//
//  Created by Rory Lewis on 7/18/11.
//  Copyright 2011 University of Colorado at Colorado Springs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface switchAppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UITabBarController *tabBarController;

@end
