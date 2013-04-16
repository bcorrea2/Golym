//
//  ConfigurationsController.m
//  Golym
//
//  Created by Bruno Corrêa on 23/04/11.
//  Copyright 2011 LBSLocal. All rights reserved.
//

#import "ConfigurationsController.h"
#include "ObjectArchiver.h"

@implementation ConfigurationsController

static ConfigurationsController *shared = nil;

static NSString *degree = @"degree";


+(ConfigurationsController *) shared {
    if (shared == nil)
    {
        shared = [ConfigurationsController new];
    }
    return shared;
}

#pragma -

- (id)init {
    self = [super init];
    if (self) 
    {
        _degreeViewWay = [[[ObjectArchiver archiver] unarchiveObjectForKey: degree ] intValue];
    }
    return self;
}



#pragma -

-(void) setDegreeViewWay:(int)way {
    _degreeViewWay = way;
    [[ObjectArchiver archiver] archiveObject:[NSNumber numberWithInt:_degreeViewWay] 
                                      forKey: degree ];
}

-(int) degreeViewWay {
    return _degreeViewWay;
}

-(NSString *) stringDegreeViewWay {
    if ([self degreeViewWay] == 0)
    {
        return @"Celsius";
    }
    else 
    {
        return @"Fahrenheit";
    }
}


@end
