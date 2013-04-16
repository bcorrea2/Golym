//
//  Dive.m
//  Golym
//
//  Created by Bruno Corrêa on 22/04/11.
//  Copyright 2011 LBSLocal. All rights reserved.
//

#import "Dive.h"


@implementation Dive
@synthesize date;
@synthesize startTime;
@synthesize finishTime;
@synthesize latitude;
@synthesize longitude;
@synthesize placeName;
@synthesize depth;
@synthesize temperature;

@synthesize facebookFriends;
@synthesize addressBookFriends;


#pragma -

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.date           forKey:@"date"];
    [coder encodeObject:self.startTime      forKey:@"startTime"];
    [coder encodeObject:self.finishTime     forKey:@"finishTime"];
    [coder encodeObject:self.latitude       forKey:@"latitude"];
    [coder encodeObject:self.longitude      forKey:@"longitude"];
    [coder encodeObject:self.placeName      forKey:@"placeName"];
    [coder encodeObject:self.depth          forKey:@"depth"];
    [coder encodeObject:self.temperature    forKey:@"temperature"];
    [coder encodeObject:self.facebookFriends       forKey:@"facebookFriends"];
    [coder encodeObject:self.addressBookFriends    forKey:@"addressBookFriends"];
}


- (id)initWithCoder:(NSCoder *)aDecoder {
    self.date           = [aDecoder decodeObjectForKey:@"date"];
    self.startTime      = [aDecoder decodeObjectForKey:@"startTime"];
    self.finishTime     = [aDecoder decodeObjectForKey:@"finishTime"];
    self.latitude       = [aDecoder decodeObjectForKey:@"latitude"];
    self.longitude      = [aDecoder decodeObjectForKey:@"longitude"];
    self.placeName      = [aDecoder decodeObjectForKey:@"placeName"];
    self.depth          = [aDecoder decodeObjectForKey:@"depth"];
    self.temperature    = [aDecoder decodeObjectForKey:@"temperature"];
    self.facebookFriends       = [aDecoder decodeObjectForKey:@"facebookFriends"];
    self.addressBookFriends    = [aDecoder decodeObjectForKey:@"addressBookFriends"];
    
    return self;
}

#pragma -


-(NSString *) description {
    NSMutableString *description = [NSMutableString string];
    
    [description appendFormat:@"( %@ - ", date];
    [description appendFormat:@"%@ - ", startTime];
    [description appendFormat:@"%@ - ", finishTime];
    [description appendFormat:@"%@ - ", latitude];
    [description appendFormat:@"%@ - ", longitude];
    [description appendFormat:@"%@ - ", placeName];
    [description appendFormat:@"%@ - ", depth];
    [description appendFormat:@"%@ )", temperature];
    
    return description;
}


-(BOOL) isEqual:(id)object {
    Dive *dive = (Dive *)object;
    
    if (dive.date != nil && self.date != nil)
    {
        if ([dive.date isEqualToString:self.date] == NO)
        {
            return NO;
        }
    }
    
    if (dive.startTime != nil && self.startTime != nil)
    {
        if ([dive.startTime isEqualToString:self.startTime] == NO)
        {
            return NO;
        }
    }
    
    if (dive.latitude != nil && self.latitude != nil)
    {
        if ([dive.latitude isEqualToString:self.latitude] == NO)
        {
            return NO;
        }
    }
    
    if (dive.longitude != nil && self.longitude != nil)
    {
        if ([dive.longitude isEqualToString:self.longitude] == NO)
        {
            return NO;
        }
    }
    
    return YES;
}




-(void) dealloc {
    [date release];
    [startTime release];
    [finishTime release];
    [latitude release];
    [longitude release];
    [placeName release];
    [depth release];
    [temperature release];
    
    [facebookFriends release];
    [addressBookFriends release];
    
    [super dealloc];
}

@end
