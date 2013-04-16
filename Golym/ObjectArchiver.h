//
//  ObjectArchiver.h
//  Golym
//
//  Created by Bruno Corrêa on 22/04/11.
//  Copyright 2011 LBSLocal. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ObjectArchiver : NSObject {}

+(ObjectArchiver *) archiver;

#pragma -

-(void) archiveObject:(id<NSCoding>)object forKey:(NSString *)key;

-(id) unarchiveObjectForKey:(NSString *)key;


@end
