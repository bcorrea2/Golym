//
//  ConfigurationsController.h
//  Golym
//
//  Created by Bruno Corrêa on 23/04/11.
//  Copyright 2011 LBSLocal. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ConfigurationsController : NSObject {    
@private
    int _degreeViewWay;
}

+(ConfigurationsController *) shared;

-(void) setDegreeViewWay:(int)way;
-(int) degreeViewWay;
-(NSString *) stringDegreeViewWay;

@end
