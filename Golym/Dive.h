//
//  Dive.h
//  Golym
//
//  Created by Bruno Corrêa on 22/04/11.
//  Copyright 2011 LBSLocal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Friend.h"

@interface Dive : NSObject <NSCoding> {
    NSString     *date;
    NSString     *startTime;
    NSString     *finishTime;
    NSString     *latitude;
    NSString     *longitude;
    NSString     *placeName;
    NSString     *depth;
    NSString     *temperature;
    
    NSMutableArray  *facebookFriends;
    NSMutableArray  *addressBookFriends;
}

@property (nonatomic, retain) NSString     *date;
@property (nonatomic, retain) NSString     *startTime;
@property (nonatomic, retain) NSString     *finishTime;
@property (nonatomic, retain) NSString     *latitude;
@property (nonatomic, retain) NSString     *longitude;
@property (nonatomic, retain) NSString     *placeName;
@property (nonatomic, retain) NSString     *depth;
@property (nonatomic, retain) NSString     *temperature;

@property (nonatomic, retain) NSMutableArray  *facebookFriends;
@property (nonatomic, retain) NSMutableArray  *addressBookFriends;



@end
