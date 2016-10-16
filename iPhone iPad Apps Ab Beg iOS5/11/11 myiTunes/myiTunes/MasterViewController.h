//
//  MasterViewController.h
//  myiTunes
//
//  Created by Rory Lewis on 10/23/11.
//  Copyright (c) 2011 University of Colorado at Colorado Springs. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController <UIWebViewDelegate>
{
    NSURL *iTunesURL;
}

@property (strong, nonatomic) DetailViewController *detailViewController;
@property (strong, nonatomic) NSURL *iTunesURL;

@end
