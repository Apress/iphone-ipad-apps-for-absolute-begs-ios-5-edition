//
//  touchesAppDelegate.h
//  touches
//
//  Created by Rory Lewis on 7/13/11.
//  Copyright 2011 University of Colorado at Colorado Springs. All rights reserved.
//

#import <UIKit/UIKit.h>

@class touchesViewController;

@interface touchesAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) touchesViewController *viewController;

@end
