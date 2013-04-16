//
//  MyDiveDetailViewController.h
//  Golym
//
//  Created by Bruno Corrêa on 22/04/11.
//  Copyright 2011 LBSLocal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Dive.h"
#import "NewDiveFormViewController.h"

@class MyDiveDetailViewController;

typedef enum  {
    ActionAtDisappearNone,
    ActionAtDisappearEdit,
    ActionAtDisappearDelete,
} ActionAtDisappear;


@protocol MyDiveDetailViewControllerDelegate <NSObject>

@required
-(void) myDiveDetailViewController:(MyDiveDetailViewController *)detailViewController 
            didSelectDiveForRemove:(Dive *)dive;

-(void) myDiveDetailViewController:(MyDiveDetailViewController *)detailViewController 
           didSelectDiveForEdition:(Dive *)dive replacingWith:(Dive *)dive;

@end


@interface MyDiveDetailViewController : UIViewController <NewDiveFormViewControllerDelegate> {
    id<MyDiveDetailViewControllerDelegate> delegate;
    
    ActionAtDisappear _disappearAction;
    
    Dive *_currentDive;
    Dive *_editedDive;
    
    IBOutlet UILabel    *_dateLabel;
    IBOutlet UILabel    *_placeNameLabel;
    IBOutlet UILabel    *_startTimeLabel;
    IBOutlet UILabel    *_finishTimeLabel;
    IBOutlet UILabel    *_depthLabel;
    IBOutlet UILabel    *_temperatureLabel;
    IBOutlet UITextView *_friendsTextView;
}

@property (assign) id<MyDiveDetailViewControllerDelegate> delegate;
@property (nonatomic, retain) Dive *currentDive;

-(IBAction) edit;
-(IBAction) delete;
-(IBAction) showMap;


@end
