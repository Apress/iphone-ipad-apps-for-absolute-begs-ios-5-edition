//
//  ViewController.m
//  myStory_01
//
//  Created by Rory Lewis on 10/2/11.
//  Copyright (c) 2011 University of Colorado at Colorado Springs. All rights reserved.
//

#import "ViewController.h"
#import "myPos.h"

@implementation ViewController

@synthesize mapView;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	[mapView setMapType:MKMapTypeStandard];
	[mapView setZoomEnabled:YES];
	[mapView setScrollEnabled:YES];
	mapView.mapType=MKMapTypeHybrid;
    
	MKCoordinateRegion region = { {0.0, 0.0 }, { 0.0, 0.0 } };
	region.center.latitude = 38.893432 ;
	region.center.longitude = -104.800161;
	region.span.longitudeDelta = 0.01f;
	region.span.latitudeDelta = 0.01f;	
	[mapView setRegion:region animated:YES];
	[mapView setDelegate:self];
	
	myPos *ann = [[myPos alloc] init];
	ann.title = @"Dr. Rory Lewis";
	ann.subtitle = @"University of Colorado at Colorado Springs";
	ann.coordinate = region.center;
	[mapView addAnnotation:ann];
}

- (MKAnnotationView *)mapView:(MKMapView *)mV viewForAnnotation:(id <MKAnnotation>)annotation
{
	MKPinAnnotationView *pinView = nil;
	if(annotation != mapView.userLocation) 
	{
		static NSString *defaultPinID = @"com.rorylewis";
		pinView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:defaultPinID];
		if ( pinView == nil )
			pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:defaultPinID];
		
		pinView.pinColor = MKPinAnnotationColorRed;
		pinView.canShowCallout = YES;
		pinView.animatesDrop = YES;
	}
	else
	{
		[mapView.userLocation setTitle:@"I am here"];
	}
	
    return pinView;
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
