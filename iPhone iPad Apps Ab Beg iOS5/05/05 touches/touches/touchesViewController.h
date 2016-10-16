//
//  touchesViewController.h
//  touches
//
//  Created by Rory Lewis on 7/13/11.
//  Copyright 2011 University of Colorado at Colorado Springs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface touchesViewController : UIViewController
{
    
    IBOutlet UIImageView *myIcon;
    IBOutlet UIImageView *myBackground;
    IBOutlet UIButton *shrinkButton;
    
    NSArray *bgImages;
    int currentBackground;
    bool hasMoved;
    bool hasShrunk;
    
    CGAffineTransform translate;
    CGAffineTransform size;
}

@property (retain, nonatomic) UIImageView *myIcon;
@property (retain, nonatomic) UIImageView *myBackground;
@property (retain, nonatomic) NSArray *bgImages;
@property (retain, nonatomic) UIButton *shrinkButton;


- (IBAction)shrinl:(id)sender;
- (IBAction)move:(id)sender;
- (IBAction)change:(id)sender;

@end
