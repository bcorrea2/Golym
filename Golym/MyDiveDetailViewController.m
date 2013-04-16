//
//  MyDiveDetailViewController.m
//  Golym
//
//  Created by Bruno Corrêa on 22/04/11.
//  Copyright 2011 LBSLocal. All rights reserved.
//

#import "MyDiveDetailViewController.h"

@implementation MyDiveDetailViewController
@synthesize delegate;
@synthesize currentDive = _currentDive;


#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self performSelector:@selector(populateGUI)];
}


-(void) populateGUI {
    self.title = @"Mergulho";
    _dateLabel.text         = [_currentDive date];
    _placeNameLabel.text    = [_currentDive placeName];
    _startTimeLabel.text    = [_currentDive startTime];
    _finishTimeLabel.text   = [_currentDive finishTime];
    _depthLabel.text        = [_currentDive depth];
    _temperatureLabel.text  = [_currentDive temperature];
    
    
    [self performSelector:@selector(populateFriendsTextView)];
}


-(void) populateFriendsTextView {
    if ( ([_currentDive.addressBookFriends count] > 0) || 
        ([_currentDive.facebookFriends count] > 0) )
    {
        NSMutableString *friends = [NSMutableString string];
        
        for (Friend *f in _currentDive.addressBookFriends) {
            [friends appendFormat:@"%@, ", f.firstName];
        }
        for (Friend *f in _currentDive.facebookFriends) {
            [friends appendFormat:@"%@, ", f.firstName];
        }
           
        _friendsTextView.text = [friends substringToIndex: (friends.length - 2)];
    }
    else
    {
        _friendsTextView.text = @"Sozinho(a)";
    }
}


- (void)viewDidUnload {
    [super viewDidUnload];
}

-(void) viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    if (_disappearAction == ActionAtDisappearNone)
    {
        return;
    }
    else if (_disappearAction == ActionAtDisappearDelete) 
    {
        [self.delegate myDiveDetailViewController:self
                           didSelectDiveForRemove: _currentDive ];
    }
    else if (_disappearAction == ActionAtDisappearEdit) 
    { 
        [self.delegate myDiveDetailViewController:self
                          didSelectDiveForEdition: _currentDive replacingWith: _editedDive ];
    }
}


#pragma -

/*
 fim editar mergulho
 */
-(void) newDiveFormViewControllerDidFinishWithDive:(Dive *)dive {
    if (_editedDive)
    {
        [_editedDive release];
    }
    _editedDive = [dive retain];
    
    
    [self populateGUI];
    _disappearAction = ActionAtDisappearEdit;
}


#pragma -

-(IBAction) edit {
    NewDiveFormViewController   *ndvc   = [NewDiveFormViewController new];
    UINavigationController      *nc     = [[UINavigationController alloc] initWithRootViewController:ndvc];
    nc.navigationBar.tintColor = [UIColor colorWithRed:20/255.0f green:117/255.0f blue:220/255.0f alpha:1.0f];
    
    ndvc.delegate   = self;
    ndvc.diveToEdit = _currentDive;
    [self presentModalViewController:nc animated:YES];
    
    [ndvc   release];
    [nc     release];
}

-(IBAction) delete {
    _disappearAction = ActionAtDisappearDelete;
    [self.navigationController popViewControllerAnimated:YES];
}



-(IBAction) showMap {
    NSString *url = [NSString stringWithFormat:@"http://maps.google.com/maps?ll=%@,%@", [_currentDive latitude], [_currentDive longitude]];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
}


#pragma -

- (void)dealloc {
    self.delegate = nil;
    [_currentDive release];
    [_editedDive release];
    
    [_dateLabel release];
    [_placeNameLabel release];
    [_startTimeLabel release];
    [_finishTimeLabel release];
    [_depthLabel release];
    [_temperatureLabel release];
    [_friendsTextView release];
    
    [super dealloc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
