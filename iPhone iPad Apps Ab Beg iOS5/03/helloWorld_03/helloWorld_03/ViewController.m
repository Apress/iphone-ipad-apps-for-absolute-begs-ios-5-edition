//
//  ViewController.m
//  helloWorld_03
//
//  Created by Rory Lewis on 10/28/11.
//  Copyright (c) 2011 University of Colorado at Colorado Springs. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
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

- (void)dealloc {
    [textBox release];
    [label release];
    [super dealloc];
}
- (IBAction)button:(id)sender {
    NSString *Name = textBox.text;
    NSString *Output = Nil;
    Output = [[NSString alloc] initWithFormat:@"%@ says: 'Hello World!", Name];
    label.text = Output;
    [Output release];
}

- (BOOL) textFieldShouldReturn:(UITextField *)theTextField{
    [textBox resignFirstResponder];
    return YES;
}
@end
