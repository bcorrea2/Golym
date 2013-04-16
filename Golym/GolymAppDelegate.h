//
//  GolymAppDelegate.h
//  Golym
//
//  Created by Bruno Corrêa on 21/04/11.
//  Copyright 2011 LBSLocal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginViewController.h"

@interface GolymAppDelegate : NSObject <UIApplicationDelegate, LoginViewControllerDelegate> {
    IBOutlet UITabBarController *_tabBarController;
    
    LoginViewController *_loginController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end
