//
//  LoginViewController.m
//  Golym
//
//  Created by Bruno Corrêa on 21/04/11.
//  Copyright 2011 LBSLocal. All rights reserved.
//

#import "LoginViewController.h"


@implementation LoginViewController
@synthesize delegate;

#pragma mark - View lifecycle

- (void)loadView {
    self.view = [[[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 20.0f, 320.0f, 460.0f)] autorelease];
    [(UIImageView *)self.view setImage:[UIImage imageNamed:@"splash.png"]];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.view.userInteractionEnabled = YES;
   
    _userTextField = [[UITextField alloc] initWithFrame:CGRectMake(35.0f, 340.0f, 250.0f, 30.0f)];
    _userTextField.borderStyle  = UITextBorderStyleNone;    
    _userTextField.placeholder  = @"Usuário";
    _userTextField.keyboardType = UIKeyboardTypeEmailAddress;
    _userTextField.delegate     = self;
    _userTextField.returnKeyType = UIReturnKeyNext;
    //[_userTextField becomeFirstResponder];
    [self.view addSubview:_userTextField];

    
    _passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(35.0f, 383.0f, 250.0f, 30.0f)];
    _passwordTextField.borderStyle      = UITextBorderStyleNone;
    _passwordTextField.placeholder      = @"Senha";
    _passwordTextField.secureTextEntry  = YES;
    _passwordTextField.delegate         = self;
    _passwordTextField.returnKeyType    = UIReturnKeyDone;
    [self.view addSubview:_passwordTextField];
    
    _loginButton = [[UIButton buttonWithType:UIButtonTypeRoundedRect] retain];
    _loginButton.frame = CGRectMake(200.0f, 423.0f, 111.0f, 30.0f);
    [_loginButton setTitle:@"Login" forState:UIControlStateNormal];
    [_loginButton setTitle:@"logando..." forState:UIControlStateDisabled];
    [_loginButton addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_loginButton];
}

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)viewDidUnload {
    [super viewDidUnload];
}


-(void) viewDidAppear:(BOOL)animated {
    //[self fakeLogin];
}

#pragma -

-(void) login {
    NSString *message = nil;
    if ( (_userTextField.text.length == 0) || ([_userTextField.text rangeOfString:@"@"].location == NSNotFound) )
    {   
        message = @"Digite um email válido";
    }
    else if (_passwordTextField.text.length == 0)
    {
        message = @"Digite sua senha";   
    }
    
    if (message) {
        [[[[UIAlertView alloc] initWithTitle:nil
                                     message:message
                                    delegate:nil
                           cancelButtonTitle:@"OK"
                           otherButtonTitles:nil] autorelease] show];
        return;
    }
    
    
    [_loginButton setEnabled:NO];
    [NSTimer scheduledTimerWithTimeInterval:2.0f 
                                     target:self
                                   selector:@selector(fakeLogin) 
                                   userInfo:nil
                                    repeats:NO];
}


-(void) fakeLogin {
    [self.delegate loginViewControllerDidLoginWithSuccess:self];
}

#pragma -

-(void) beginAnimations {
    [UIView beginAnimations:@"move_view" context:self.view];
    [UIView setAnimationDuration:0.3f];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
}

-(void) endAnimations {
    [UIView commitAnimations];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    [self beginAnimations];
    self.view.frame = CGRectMake(0.0f, -190.0f, 320.0f, 460.0f);
    [self endAnimations];
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == _userTextField)
    {
        [_passwordTextField becomeFirstResponder];
        return NO;
    }
    
    [self beginAnimations];
    self.view.frame = CGRectMake(0.0f, 20.0f, 320.0f, 460.0f);
    [self endAnimations];
    
    [self login];
    [textField resignFirstResponder];
    return YES;
}


#pragma -

- (void)dealloc {
    self.delegate = nil;
    [_userTextField         release];
    [_passwordTextField     release];
    [_loginButton           release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
