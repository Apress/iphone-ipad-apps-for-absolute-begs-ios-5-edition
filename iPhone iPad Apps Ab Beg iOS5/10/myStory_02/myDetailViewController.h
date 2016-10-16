//
//  myDetailViewController.h
//  myStory_02
//
//  Created by Rory Lewis on 10/10/11.
//  Copyright (c) 2011 University of Colorado at Colorado Springs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface myDetailViewController : UIViewController <NSURLConnectionDataDelegate, MKMapViewDelegate> {
    NSMutableData* locData;
}

@property (strong, nonatomic) id detailItem;

@end
