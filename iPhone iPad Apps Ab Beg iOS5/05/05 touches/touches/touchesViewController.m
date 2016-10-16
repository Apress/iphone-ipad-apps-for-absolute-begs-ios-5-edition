//
//  touchesViewController.m
//  touches
//
//  Created by Rory Lewis on 7/13/11.
//  Copyright 2011 University of Colorado at Colorado Springs. All rights reserved.
//

#import "touchesViewController.h"

@implementation touchesViewController

@synthesize  myIcon, myBackground, bgImages, shrinkButton;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    hasMoved = NO;
    hasShrunk = NO;
    currentBackground = 0;
    
    bgImages = [[NSArray alloc] initWithObjects:
                [UIImage imageNamed:@"WallPaper_01.png"],
                [UIImage imageNamed:@"WallPaper_02.png"],
                [UIImage imageNamed:@"WallPaper_03.png"],
                [UIImage imageNamed:@"WallPaper_04.png"],
                [UIImage imageNamed:@"WallPaper_05.png"],
                nil];
    
    size = CGAffineTransformMakeScale(.25, .25);
    translate = CGAffineTransformMakeTranslation(0,-100);
    
    myBackground.image = [bgImages objectAtIndex:currentBackground];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
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

-(void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [[event allTouches] anyObject];
    
    if (CGRectContainsPoint([myIcon frame], [touch locationInView:nil])) 
    {
        if (hasMoved == YES && hasShrunk == YES) {
            myIcon.transform = CGAffineTransformTranslate(size, 0, 0);
            hasMoved = NO;
        }
        
        if (hasMoved == YES && hasShrunk == NO) {
            myIcon.transform = translate;
            hasMoved = NO;
        }
        
        myIcon.center = [touch locationInView:nil];
    }
                      
}


- (IBAction)shrinl:(id)sender {
    if (hasShrunk) {
        [shrinkButton setTitle:@"Shrink" forState:UIControlStateNormal];
    } else{
        [shrinkButton setTitle:@"Grow" forState:UIControlStateNormal];
    }
    
    if (hasShrunk == NO && hasMoved == NO) {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1.0];
        myIcon.transform = size;
        [UIView commitAnimations];
        hasShrunk = YES;
    }
    else if (hasShrunk == NO && hasMoved == YES) {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1.0];
        myIcon.transform = CGAffineTransformScale(translate, .25, .25);
        [UIView commitAnimations];
        hasShrunk = YES;
    }
    else if (hasShrunk == YES && hasMoved == YES) {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1.0];
        myIcon.transform = CGAffineTransformScale(translate, 1, 1);
        [UIView commitAnimations];
        hasShrunk = NO;
    }
    else {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1.0];
        myIcon.transform = CGAffineTransformIdentity;
        [UIView commitAnimations];
        hasShrunk = NO;
    }
}

- (IBAction)move:(id)sender {
    
    if (hasMoved == NO && hasShrunk == NO) {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1.0];
        myIcon.transform = translate;
        [UIView commitAnimations];
        hasMoved = YES;
    }
    else if (hasMoved == NO && hasShrunk == YES) {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1.0];
        myIcon.transform = CGAffineTransformTranslate(size, 0, -100);
        [UIView commitAnimations];
        hasMoved = YES;
    }
    else if (hasMoved == YES && hasShrunk == YES) {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1.0];
        myIcon.transform = CGAffineTransformTranslate(size, 0, 0);
        [UIView commitAnimations];
        hasMoved = YES;
    }
    else {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:1.0];
        myIcon.transform = CGAffineTransformMakeTranslation(0, 0);
        [UIView commitAnimations];
        hasMoved = YES;
    }
    
}

- (IBAction)change:(id)sender {
    currentBackground++;
    if (currentBackground >=[bgImages count])
        currentBackground = 0;
        
        [UIView beginAnimations:@"changeview" context:nil];
        [UIView setAnimationDuration:1];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        
        if (currentBackground == 1) 
            [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.view cache:YES];
        
        if (currentBackground == 2) 
            [UIView setAnimationTransition:UIViewAnimationTransitionCurlDown forView:self.view cache:YES];
        
        if (currentBackground == 3) 
            [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.view cache:YES];
        
        if (currentBackground == 4) 
            [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.view cache:YES];
    
    [UIView commitAnimations];
    myBackground.image = [bgImages objectAtIndex:currentBackground];
      
}





















@end
