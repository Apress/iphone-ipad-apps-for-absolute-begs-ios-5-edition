//
//  UberView.h
//  MyStory
//
//  Created by Rory Lewis on 7/29/11.
//  Copyright 2011 University of Colorado at Colorado Springs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UberView : UIViewController {
    UIWebView *webView;
}

@property (nonatomic, strong) IBOutlet UIWebView *webView;

@end
