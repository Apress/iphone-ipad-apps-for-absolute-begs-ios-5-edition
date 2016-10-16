//
//  myPos.h
//  myStory_02
//
//  Created by Rory Lewis on 10/10/11.
//  Copyright (c) 2011 University of Colorado at Colorado Springs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MKAnnotation.h>


@interface myPos : NSObject <MKAnnotation> 
{
    CLLocationCoordinate2D _coordinate;
    NSString *_title;
}

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;

@end

