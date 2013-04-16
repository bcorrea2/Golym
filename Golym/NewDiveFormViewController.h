//
//  NewDiveFormViewController.h
//  Golym
//
//  Created by Bruno Corrêa on 22/04/11.
//  Copyright 2011 LBSLocal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DivingFriendsListViewController.h"
#import "Dive.h"


@protocol NewDiveFormViewControllerDelegate <NSObject>

@required
-(void) newDiveFormViewControllerDidFinishWithDive:(Dive *)dive;

@optional
-(void) newDiveFormViewControllerDidCancel;

@end


@interface NewDiveFormViewController : UIViewController <UITextFieldDelegate, DivingFriendsListViewControllerDelegate> {
    id<NewDiveFormViewControllerDelegate> delegate;
    Dive            *_diveToEdit;
    
    UITextField     *_dateField;
    UITextField     *_startTimeField;
    UITextField     *_finishTimeField;
    UITextField     *_latitudeField;
    UITextField     *_longitudeField;
    UITextField     *_placeNameField;
    UITextField     *_depthField;
    UITextField     *_temperatureField;
    UIButton        *_friendsButton;
    
    NSMutableArray  *_friendsFromAddressBook;
    NSMutableArray  *_friendsFromFacebook;
}

@property (assign) id<NewDiveFormViewControllerDelegate> delegate;
@property (nonatomic, retain) Dive  *diveToEdit;


@end
