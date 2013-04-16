//
//  DivingsContainer.h
//  Golym
//
//  Created by Bruno Corrêa on 22/04/11.
//  Copyright 2011 LBSLocal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ObjectArchiver.h"
#import "Dive.h"

@interface DivingsContainer : NSObject {
@private
    BOOL _changesMade;
    
    ObjectArchiver  *_archiver;
    NSMutableArray  *_divings;
}

@property (nonatomic, readonly) NSArray  *divings;

-(void) addNewDive:(Dive *)dive;
-(void) removeDive:(Dive *)dive;

-(void) commitChangesIfNecessary;


@end
