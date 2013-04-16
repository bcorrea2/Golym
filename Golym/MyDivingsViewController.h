//
//  MyDivingsViewController.h
//  Golym
//
//  Created by Bruno Corrêa on 21/04/11.
//  Copyright 2011 LBSLocal. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NewDiveFormViewController.h"
#import "DivingsContainer.h"
#import "MyDivingsTableViewCell.h"
#import "MyDiveDetailViewController.h"

@interface MyDivingsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate,
NewDiveFormViewControllerDelegate, MyDiveDetailViewControllerDelegate> {

    UITableView      *_tableView;
    DivingsContainer *_divingsContainer;
    
}

@end
