//
//  helloWorld_02ViewController.m
//  helloWorld_02
//
//  Created by Rory Lewis on 5/4/11.
//  Copyright 2011 University of Colorado at Colorado Springs. All rights reserved.
//

#import "helloWorld_02ViewController.h"

@implementation helloWorld_02ViewController

- (void)dealloc
{
    [label release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (void)viewDidUnload
{
    [label release];
    label = nil;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

- (IBAction)button:(id)sender {
    
    label.text = @"Hello World!";
}
@end
