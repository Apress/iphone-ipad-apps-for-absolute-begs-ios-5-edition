//
//  HELLOWORLD_04ViewController.m
//  HELLOWORLD_04
//
//  Created by Rory Lewis on 6/12/11.
//  Copyright 2011 University of Colorado at Colorado Springs. All rights reserved.
//

#import "HELLOWORLD_04ViewController.h"

@implementation HELLOWORLD_04ViewController
@synthesize label, Kant;


- (void)dealloc
{
    [label release];
    [Kant release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle



- (void)viewDidUnload
{
    [label release];
    label = nil;
    [Kant release];
    Kant = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)buttonGuess:(id)sender {
    label.text = @"Hello World I'm back!";
    UIImage *imageSource = [UIImage imageNamed:@"kantStair.png"];
    Kant.image = imageSource;
}
@end
