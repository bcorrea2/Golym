//
//  Friend.m
//  Golym
//
//  Created by Bruno Corrêa on 22/04/11.
//  Copyright 2011 LBSLocal. All rights reserved.
//

#import "Friend.h"

@implementation Friend

@synthesize firstName;
@synthesize lastName;


#pragma -

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeObject:self.firstName     forKey:@"firstName"];
    [coder encodeObject:self.lastName      forKey:@"lastName"];
}


- (id)initWithCoder:(NSCoder *)aDecoder {
    self.firstName      = [aDecoder decodeObjectForKey:@"firstName"];
    self.lastName      = [aDecoder decodeObjectForKey:@"lastName"];
    return self;
}


#pragma -

-(id) initWithABRecordRef:(ABRecordRef)ref {
    if ( (self = [super init]) )
    {
        CFStringRef firstName_  = ABRecordCopyValue(ref, kABPersonFirstNameProperty);
        CFStringRef lastName_   = ABRecordCopyValue(ref, kABPersonLastNameProperty);
        
        if (firstName_)
        {
            self.firstName  = [NSString stringWithFormat:@"%@", firstName_];
            CFRelease(firstName_);
        }
        else 
        {
            self.firstName = nil;
            [self release];
            return nil;
        }
        
        if (lastName_)
        {
            self.lastName   = [NSString stringWithFormat:@"%@", lastName_];
            CFRelease(lastName_);
        }
        else
        {
            self.lastName = nil;
        }
        
    }
    return self;
}

-(BOOL) isEqual:(id)object {
    Friend *f = (Friend *)object;
    
    if (f.firstName != nil && self.firstName != nil)
    {
        if ([f.firstName isEqualToString:self.firstName] == NO)
        {
            return NO;
        }
    }
    
    if (f.lastName != nil && self.lastName != nil)
    {
        if ([f.lastName isEqualToString:self.lastName] == NO)
        {
            return NO;
        }
    }
    
    return YES;
}


-(void) dealloc {
    //NSLog(@"%@ dealloc", [self class]);
    
    self.firstName = nil;
    self.lastName = nil;
    [super dealloc];
}

@end
