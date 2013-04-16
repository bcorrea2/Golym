//
//  DivingsContainer.m
//  Golym
//
//  Created by Bruno Corrêa on 22/04/11.
//  Copyright 2011 LBSLocal. All rights reserved.
//

#import "DivingsContainer.h"

static NSString *key = @"divings_key";

@implementation DivingsContainer
@synthesize divings = _divings;

- (id)init {
    self = [super init];
    if (self) 
    {
        _archiver   = [ObjectArchiver new];
        _divings    = [_archiver unarchiveObjectForKey: key ];
        if (_divings)
        {
            [_divings retain];
        }
        else 
        {
            _divings = [NSMutableArray new];
        }
    }
    return self;
}

-(void) addNewDive:(Dive *)dive {
    [_divings addObject: dive ];
    _changesMade = YES;
}

-(void) removeDive:(Dive *)dive {
    [_divings removeObject: dive ];
    _changesMade = YES;
}


-(void) commitChangesIfNecessary {
    if (_changesMade)
    {
        [_archiver archiveObject:_divings forKey: key ];
        _changesMade = NO;
    }
}


-(void) dealloc {
    [_divings release];
    [_archiver release];
    [super dealloc];
}

@end
