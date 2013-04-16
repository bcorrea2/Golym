//
//  LoginViewController.h
//  Golym
//
//  Created by Bruno Corrêa on 21/04/11.
//  Copyright 2011 LBSLocal. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LoginViewController;

@protocol LoginViewControllerDelegate <NSObject>

@required 
-(void) loginViewControllerDidLoginWithSuccess:(LoginViewController *)loginController;

@end



@interface LoginViewController : UIViewController <UITextFieldDelegate> {
    id<LoginViewControllerDelegate> delegate;
    
    UITextField *_userTextField;
    UITextField *_passwordTextField;
    UIButton    *_loginButton;
}

@property (assign) id<LoginViewControllerDelegate> delegate;

@end
