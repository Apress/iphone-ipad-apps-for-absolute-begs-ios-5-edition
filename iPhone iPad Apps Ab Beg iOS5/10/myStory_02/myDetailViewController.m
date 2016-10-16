//
//  myDetailViewController.m
//  myStory_02
//
//  Created by Rory Lewis on 10/10/11.
//  Copyright (c) 2011 University of Colorado at Colorado Springs. All rights reserved.
//

#import "myDetailViewController.h"
#import "myPos.h"

@interface myDetailViewController ()
- (void)configureView;  // private method
@end

@implementation myDetailViewController

@synthesize detailItem=_detailItem;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.
    
    if (self.detailItem) {
        //self.detailDescriptionLabel.text = [self.detailItem description];
        NSString* mapURI = @"http://maps.googleapis.com/maps/api/geocode/json?address=city&sensor=false";
        mapURI = [mapURI stringByReplacingOccurrencesOfString:@"city" withString:[self.detailItem description]];
        NSURL* mapURL = [NSURL URLWithString:[mapURI stringByReplacingOccurrencesOfString:@" " withString:@"%20"]];
        
        NSURLConnection* connection = [NSURLConnection connectionWithRequest:[NSURLRequest requestWithURL:mapURL] delegate:self];
        if (connection)
            locData = [NSMutableData data];
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    [locData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [locData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    
    // encapsulate this stuff in another class because I am not explaining string parsing.
    NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern:@"location.*?\\}"
                                                                           options:NSRegularExpressionDotMatchesLineSeparators
                                                                             error:nil];
    NSString* dataString = [[NSString alloc] initWithData:locData encoding:NSASCIIStringEncoding];
    NSTextCheckingResult* locResult = [regex firstMatchInString:dataString options:0 range:NSMakeRange(0, [dataString length])];
    NSString* locString = [dataString substringWithRange:[locResult range]];
    
    NSRange latRange = [locString rangeOfString:@"\"lat\" : "];
    NSString* lat = [[[locString substringWithRange:NSMakeRange(latRange.location + latRange.length , 20)] stringByReplacingOccurrencesOfString:@"," withString:@""] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    NSRange lngRange = [locString rangeOfString:@"\"lng\" : "];
    NSString* lng = [[locString substringWithRange:NSMakeRange(lngRange.location + lngRange.length, 20)] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    // setup zoom and pin drop stuff
    [(MKMapView*)self.view setZoomEnabled:YES];
    [(MKMapView*)self.view setScrollEnabled:YES];
    MKCoordinateRegion region;
    region.center.latitude = [lat floatValue];
    region.center.longitude = [lng floatValue];
    region.span.longitudeDelta = 0.01f;
    region.span.latitudeDelta = 0.01f;
    [(MKMapView*)self.view setRegion:region animated:YES];
    
    myPos* ann = [[myPos alloc] init];
    ann.title = [self.detailItem description] ;
    ann.coordinate = region.center;
    [(MKMapView*)self.view addAnnotation:ann];
}

- (MKAnnotationView *)mapView:(MKMapView *)mV viewForAnnotation:(id <MKAnnotation>)annotation { 
    MKPinAnnotationView *pinView = nil;
    if(annotation != ((MKMapView*)self.view).userLocation) {
        static NSString *defaultPinID = @"pinID";
        pinView = (MKPinAnnotationView *)[(MKMapView*)self.view dequeueReusableAnnotationViewWithIdentifier:defaultPinID];
        if ( pinView == nil )
            pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:defaultPinID];
        pinView.pinColor = MKPinAnnotationColorRed;
        pinView.canShowCallout = YES;
        pinView.animatesDrop = YES;
    } else {
        [((MKMapView*)self.view).userLocation setTitle:@"I am here"];
    } 
    return pinView; 
}


@end
