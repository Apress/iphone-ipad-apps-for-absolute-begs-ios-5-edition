//
//  myPos.h
//  myStory_01
//
//  Created by Rory Lewis on 10/2/11.
//  Copyright (c) 2011 University of Colorado at Colorado Springs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MkAnnotation.h>

@interface myPos : NSObject <MKAnnotation>
{
    CLLocationCoordinate2D coordinate;
    NSString *title;
    NSString *subtitle;
}

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy)  NSString *title;
@property (nonatomic, copy) NSString *subtitle;

@end
