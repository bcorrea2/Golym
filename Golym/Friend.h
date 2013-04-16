//
//  Friend.h
//  Golym
//
//  Created by Bruno Corrêa on 22/04/11.
//  Copyright 2011 LBSLocal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AddressBook/AddressBook.h>

@interface Friend : NSObject <NSCoding> {
    NSString *firstName;
    NSString *lastName;
}
  
@property (nonatomic, retain) NSString *firstName;
@property (nonatomic, retain) NSString *lastName;

-(id) initWithABRecordRef:(ABRecordRef)ref;

@end
