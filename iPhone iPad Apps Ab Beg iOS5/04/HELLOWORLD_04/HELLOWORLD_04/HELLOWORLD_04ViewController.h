//
//  HELLOWORLD_04ViewController.h
//  HELLOWORLD_04
//
//  Created by Rory Lewis on 6/12/11.
//  Copyright 2011 University of Colorado at Colorado Springs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HELLOWORLD_04ViewController : UIViewController {
    
    IBOutlet UILabel *label;
    IBOutlet UIImageView *Kant;
}

@property (nonatomic, retain) IBOutlet UILabel *label;
@property (nonatomic, retain) IBOutlet UIImageView *Kant;

- (IBAction)buttonGuess:(id)sender;


@end
