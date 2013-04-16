//
//  ConfigViewController.m
//  Golym
//
//  Created by Bruno Corrêa on 21/04/11.
//  Copyright 2011 LBSLocal. All rights reserved.
//

#import "ConfigurationsViewController.h"
#import "ConfigurationsController.h"

@implementation ConfigurationsViewController

#pragma mark - View lifecycle



- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Configurações";
    
    int degreeWay = [[ConfigurationsController shared] degreeViewWay];
    [self temperatureSwitchChanged: ((degreeWay == 0) ? _celsiusSwitch : _fahrenheitSwitch) ];

}


- (void)viewDidUnload {
    [super viewDidUnload];
    
}


#pragma -

-(IBAction) temperatureSwitchChanged:(UISwitch *)switch_ {
    if (switch_ == _celsiusSwitch) 
    {
        [_fahrenheitSwitch setOn:![switch_ isOn] animated:YES];
        [[ConfigurationsController shared] setDegreeViewWay:0];
    }
    else// if (switch_ == _fahrenheitSwitch)
    {
        [_celsiusSwitch setOn:![switch_ isOn] animated:YES];   
        [[ConfigurationsController shared] setDegreeViewWay:1];
    }
}


#pragma -

- (void)dealloc {
    [_celsiusSwitch release];
    [_fahrenheitSwitch release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
