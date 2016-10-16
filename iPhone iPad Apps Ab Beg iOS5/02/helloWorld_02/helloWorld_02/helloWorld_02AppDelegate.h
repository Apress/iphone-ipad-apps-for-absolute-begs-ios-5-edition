//
//  helloWorld_02AppDelegate.h
//  helloWorld_02
//
//  Created by Rory Lewis on 5/4/11.
//  Copyright 2011 University of Colorado at Colorado Springs. All rights reserved.
//

#import <UIKit/UIKit.h>

@class helloWorld_02ViewController;

@interface helloWorld_02AppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet helloWorld_02ViewController *viewController;

@end
