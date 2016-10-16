//
//  ViewController.h
//  myStory_01
//
//  Created by Rory Lewis on 10/2/11.
//  Copyright (c) 2011 University of Colorado at Colorado Springs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController <MKMapViewDelegate>
{
    MKMapView *mapView;
}

@property (nonatomic, retain) IBOutlet MKMapView *mapView;

@end
