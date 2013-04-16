//
//  ObjectArchiver.m
//  Golym
//
//  Created by Bruno Corrêa on 22/04/11.
//  Copyright 2011 LBSLocal. All rights reserved.
//

#import "ObjectArchiver.h"


@implementation ObjectArchiver

+(ObjectArchiver *) archiver {
    return [[ObjectArchiver new] autorelease];
}

#pragma -

-(void) archiveObject:(id<NSCoding>)object forKey:(NSString *)key {
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:object];
    
    [[NSUserDefaults standardUserDefaults] setObject:data forKey: key ];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


-(id) unarchiveObjectForKey:(NSString *)key {
    NSData *objectData = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    
    if (objectData) 
    {
        return [NSKeyedUnarchiver unarchiveObjectWithData:objectData];
    }
    return nil;
}

@end
