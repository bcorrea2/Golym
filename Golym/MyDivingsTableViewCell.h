//
//  MyDivingsTableViewCell.h
//  Golym
//
//  Created by Bruno Corrêa on 22/04/11.
//  Copyright 2011 LBSLocal. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface MyDivingsTableViewCell : UITableViewCell {
    UILabel *dateLabel;
    UILabel *depthLabel;
    UILabel *placeNameLabel;    
}

@property (nonatomic, readonly) UILabel *dateLabel;
@property (nonatomic, readonly) UILabel *depthLabel;
@property (nonatomic, readonly) UILabel *placeNameLabel;

@end
