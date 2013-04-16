//
//  MyDivingsTableViewCell.m
//  Golym
//
//  Created by Bruno Corrêa on 22/04/11.
//  Copyright 2011 LBSLocal. All rights reserved.
//

#import "MyDivingsTableViewCell.h"


@implementation MyDivingsTableViewCell
@synthesize dateLabel;
@synthesize depthLabel;
@synthesize placeNameLabel; 

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) 
    {
        dateLabel   = [[UILabel alloc] initWithFrame:CGRectMake(5.0f, 5.0f, 150.0f, 20.0f)];
        dateLabel.textColor = [UIColor lightGrayColor];
        dateLabel.font      = [UIFont systemFontOfSize:15.0f];
        [self.contentView addSubview:dateLabel];
        
        depthLabel  = [[UILabel alloc] initWithFrame:CGRectMake(240.0f, 5.0f, 80.0f, 20.0f)];
        depthLabel.textColor    = [UIColor darkGrayColor];
        depthLabel.font         = [UIFont italicSystemFontOfSize:14.0f];
        [self.contentView addSubview:depthLabel];
        
        placeNameLabel  = [[UILabel alloc] initWithFrame:CGRectMake(5.0f, 27.0f, 300.0f, 20.0f)];
        placeNameLabel.textColor    = [UIColor darkGrayColor];
        placeNameLabel.font         = [UIFont boldSystemFontOfSize:16.0f];;
        [self.contentView addSubview:placeNameLabel];
    }
    return self;
}



- (void)dealloc {
    [dateLabel release];
    [depthLabel release];
    [placeNameLabel release];
    [super dealloc];
}

@end
