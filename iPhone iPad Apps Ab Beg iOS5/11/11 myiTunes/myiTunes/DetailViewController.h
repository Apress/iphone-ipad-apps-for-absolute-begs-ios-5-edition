//
//  DetailViewController.h
//  myiTunes
//
//  Created by Rory Lewis on 10/23/11.
//  Copyright (c) 2011 University of Colorado at Colorado Springs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end
