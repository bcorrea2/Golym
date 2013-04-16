//
//  ConfigViewController.h
//  Golym
//
//  Created by Bruno Corrêa on 21/04/11.
//  Copyright 2011 LBSLocal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConfigurationsViewController : UIViewController {
    IBOutlet UISwitch *_celsiusSwitch;
    IBOutlet UISwitch *_fahrenheitSwitch;
}

-(IBAction) temperatureSwitchChanged:(UISwitch *)switch_;

@end
