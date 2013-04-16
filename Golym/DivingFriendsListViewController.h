//
//  DivingFriendsListViewController.h
//  Golym
//
//  Created by Bruno Corrêa on 22/04/11.
//  Copyright 2011 LBSLocal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBook/AddressBook.h>
#import "Friend.h"


@protocol DivingFriendsListViewControllerDelegate <NSObject>

@required
-(void) divingFriendsListViewControllerDidFinish:(NSMutableArray *)friendsFromAddressBook
                             friendsFromFacebook:(NSMutableArray *)friendsFromFacebook;

@end


@interface DivingFriendsListViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    id<DivingFriendsListViewControllerDelegate> delegate;
    
    UITableView         *_tableView;
    UISegmentedControl  *_friendsSelectionTypeSegment;
    
    NSMutableArray  *_currentFriends;
    NSMutableArray  *_selectedFriends;
    
    
    NSMutableArray  *_addressBookFriends;
    NSMutableArray  *_selectedFromAddressBook;
    
    NSMutableArray  *_facebookFriends;
    NSMutableArray  *_selectedFromFacebook;
}

@property (nonatomic, assign) id<DivingFriendsListViewControllerDelegate> delegate;

@property (nonatomic, retain) NSMutableArray  *friendsFromAddressBook;
@property (nonatomic, retain) NSMutableArray  *friendsFromFacebook;


@end
