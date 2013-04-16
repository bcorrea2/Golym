//
//  NewDiveFormViewController.m
//  Golym
//
//  Created by Bruno Corrêa on 22/04/11.
//  Copyright 2011 LBSLocal. All rights reserved.
//

#import "NewDiveFormViewController.h"
#import "ConfigurationsController.h"

@implementation NewDiveFormViewController
@synthesize delegate;
@synthesize diveToEdit = _diveToEdit;

- (id)init {
    self = [super init];
    if (self) 
    {
        self.view.backgroundColor = [UIColor colorWithWhite:0.92 alpha:1.0f];
    }
    return self;
}

#pragma mark - View lifecycle

-(UILabel *) descriptionLabelWithText:(NSString *)text {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20.0f, 0.0f, 280.0f, 18.0f)];
    
    label.backgroundColor   = [UIColor clearColor];
    label.textColor         = [UIColor darkGrayColor];
    label.font              = [UIFont boldSystemFontOfSize:15.0f];
    label.text              = text;
    
    return [label autorelease];
}


-(UITextField *) textFieldWithPlaceholder:(NSString *)placeholder {
    UITextField *tf = [[UITextField alloc] initWithFrame:CGRectMake(20.0, 320.0f, 280.0f, 30.0f)];
    
    tf.borderStyle = UITextBorderStyleRoundedRect;
    tf.placeholder = placeholder;
    tf.delegate    = self;
    
    return [tf autorelease];
}

-(UIView *) separator {
    UIView *s = [[UIView alloc] initWithFrame:CGRectMake(10.0f, 0.0f, 300.0f, 5.2f)];
    s.backgroundColor = [UIColor clearColor];
    s.alpha = 0.4f;
    return [s autorelease];
}


-(void) drawItems:(NSMutableArray *)items inScrollView:(UIScrollView *)scrollView {
    float space = 6.0f;
    float y     = space;
    for (UIView *v in items) {
        CGRect r = [v frame];
        
        r.origin.y = y;
        v.frame = r;
        
        [scrollView addSubview: v ];
        
        y += v.frame.size.height + space;
    }
    scrollView.contentSize = CGSizeMake(320.0f, y + 20.0f);
}


- (void)loadView {
    self.view = [[[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 480.0f)] autorelease];
    
    UIScrollView        *scrollViewFieldsContainer;
    NSMutableArray      *itemsToDraw = [NSMutableArray array];
    UILabel             *label;    
    
    scrollViewFieldsContainer = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 431.0f)];
    [self.view addSubview:scrollViewFieldsContainer];
    
    /*
     data do mergulho
     */
    label = [self descriptionLabelWithText:@"Data:"];
    [itemsToDraw addObject:label];
    
    _dateField = [self textFieldWithPlaceholder:@"29/08/1989"];
    _dateField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    [itemsToDraw addObject:_dateField];
    
    
    /*
     hora inicio
     */
    label = [self descriptionLabelWithText:@"Horário inicio:"];
    [itemsToDraw addObject:label];
    
    _startTimeField = [self textFieldWithPlaceholder:@"12:30"];
    _startTimeField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    [itemsToDraw addObject:_startTimeField];
    
    
    /*
     hora fim
     */
    label = [self descriptionLabelWithText:@"Horário fim:"];
    [itemsToDraw addObject:label];
    
    _finishTimeField = [self textFieldWithPlaceholder:@"15:30"];
    _finishTimeField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    [itemsToDraw addObject:_finishTimeField];
    
    
    [itemsToDraw addObject:[self separator]];
    
    /*
     lat e lon
     */
    label = [self descriptionLabelWithText:@"Coordenadas:"];
    [itemsToDraw addObject:label];
    
    
    _latitudeField = [self textFieldWithPlaceholder:@"-26.4767"];
    _latitudeField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    [itemsToDraw addObject:_latitudeField];
    
    _longitudeField = [self textFieldWithPlaceholder:@"-46.4767"];
    _longitudeField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    [itemsToDraw addObject:_longitudeField];
    
    
    [itemsToDraw addObject:[self separator]];
    
    /*
     nome do local
     */
    label = [self descriptionLabelWithText:@"Nome do local:"];
    [itemsToDraw addObject:label];
    
    _placeNameField = [self textFieldWithPlaceholder:@"Angra dos reis"];
    _placeNameField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    [itemsToDraw addObject:_placeNameField];
    
    
    
    [itemsToDraw addObject:[self separator]];
    
    
    /*
     profundidade
     */
    label = [self descriptionLabelWithText:@"Profundidade atingida (metros):"];
    [itemsToDraw addObject:label];
    
    _depthField = [self textFieldWithPlaceholder:@"10"];
    _depthField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    [itemsToDraw addObject:_depthField];
    
    /*
     temperatura
     */
    NSString *text = [NSString stringWithFormat:@"Temperatura (%@):", [[ConfigurationsController shared] stringDegreeViewWay]];
    label = [self descriptionLabelWithText: text ];
    [itemsToDraw addObject:label];
    
    _temperatureField = [self textFieldWithPlaceholder:@"10"];
    _temperatureField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    [itemsToDraw addObject:_temperatureField];
    
    
    [itemsToDraw addObject:[self separator]];
    
    /*
     pessoas no mergulho
     */
    label = [self descriptionLabelWithText:@"Pessoas comigo no mergulho:"];
    [itemsToDraw addObject:label];
    
    _friendsButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_friendsButton setTitle:@"0 pessoas" forState:UIControlStateNormal];
    [_friendsButton setFrame:CGRectMake(20.0f, 0.0f, 280.0f, 40.0f)];
    [_friendsButton addTarget:self action:@selector(selectFriends) forControlEvents:UIControlEventTouchUpInside];
    [itemsToDraw addObject:_friendsButton];
    
    /*
     jogando na tela
     */
    [self drawItems:itemsToDraw inScrollView:scrollViewFieldsContainer];
    [scrollViewFieldsContainer release];
}




- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Novo Mergulho";
    
    self.navigationItem.leftBarButtonItem   = [[[UIBarButtonItem alloc] initWithTitle:@"Cancelar" 
                                                                                style:UIBarButtonSystemItemCancel 
                                                                               target:self
                                                                               action:@selector(cancel)] autorelease];
    
    self.navigationItem.rightBarButtonItem  = [[[UIBarButtonItem alloc] initWithTitle:@"Confirmar" 
                                                                                style:UIBarButtonItemStyleDone 
                                                                               target:self
                                                                               action:@selector(confirmForm)] autorelease];
    
}

- (void)viewDidUnload {
    [super viewDidUnload];
    
}
-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (_diveToEdit)
    {
        _dateField.text         = _diveToEdit.date;
        _startTimeField.text    = _diveToEdit.startTime;
        _finishTimeField.text   = _diveToEdit.finishTime;
        _latitudeField.text     = _diveToEdit.latitude;
        _longitudeField.text    = _diveToEdit.longitude;
        _placeNameField.text    = _diveToEdit.placeName;
        _depthField.text        = _diveToEdit.depth;
        _temperatureField.text  = _diveToEdit.temperature;
        
        /*
         muito feioooo :( */
        [self divingFriendsListViewControllerDidFinish:_diveToEdit.addressBookFriends
                                   friendsFromFacebook:_diveToEdit.facebookFriends];
    }
}


#pragma -


-(void) divingFriendsListViewControllerDidFinish:(NSMutableArray *)friendsFromAddressBook
                             friendsFromFacebook:(NSMutableArray *)friendsFromFacebook {
    if (_friendsFromAddressBook)
    {
        [_friendsFromAddressBook release];
    }
    if (_friendsFromFacebook)
    {
        [_friendsFromFacebook release];
    }
    
    _friendsFromAddressBook = [friendsFromAddressBook retain];
    _friendsFromFacebook    = [friendsFromFacebook retain];
    
    [_friendsButton setTitle:[NSString stringWithFormat:@"%d amigo(s)", ([_friendsFromFacebook count] + [_friendsFromAddressBook count])]
                    forState:UIControlStateNormal];
}



-(void) cancel {
    [self dismissModalViewControllerAnimated:YES];
    
    if ([self.delegate respondsToSelector:@selector(newDiveFormViewControllerDidCancel)])
    {
        [self.delegate newDiveFormViewControllerDidCancel];
    }
}


-(BOOL) fieldsOK {
    if (_dateField.text.length != 0 &&
        _startTimeField.text.length != 0 &&
        _finishTimeField.text.length != 0 &&
        _latitudeField.text.length != 0 &&
        _longitudeField.text.length != 0 &&
        _placeNameField.text.length != 0 &&
        _depthField.text.length != 0 &&
        _temperatureField.text.length != 0)
    {
        return YES;
    }
    
    [[[[UIAlertView alloc] initWithTitle:nil
                                message:@"Preencha todos os campos." 
                               delegate:nil
                      cancelButtonTitle:@"OK"
                       otherButtonTitles:nil] autorelease] show];
    
    return NO;
}


-(void) confirmForm {
    if ([self fieldsOK])
    {
        Dive *dive = [[Dive new] autorelease];
        
        dive.date       = [_dateField text];
        dive.startTime  = [_startTimeField text];
        dive.finishTime = [_finishTimeField text];
        dive.latitude   = [_latitudeField text];
        dive.longitude  = [_longitudeField text];
        dive.placeName  = [_placeNameField text];
        dive.depth      = [_depthField text];
        dive.temperature = [_temperatureField text];
        
        dive.facebookFriends    = _friendsFromFacebook;
        dive.addressBookFriends = _friendsFromAddressBook;
        
        [self.delegate newDiveFormViewControllerDidFinishWithDive: dive ];
        
        [self dismissModalViewControllerAnimated:YES];
    }
}

-(void) selectFriends {
    DivingFriendsListViewController *friends = [DivingFriendsListViewController new];
    
    friends.delegate                = self;
    
    friends.friendsFromAddressBook  = _friendsFromAddressBook;
    friends.friendsFromFacebook     = _friendsFromFacebook;
    
    
    [self.navigationController pushViewController:friends animated:YES];
    [friends release];
}

#pragma -
#pragma UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    NSLog(@"### colocar picker para data e hora ###");
#warning colocar um picker para data
#warning retirar este hard code feio
    UIScrollView *scroll = (UIScrollView *)[self.view.subviews objectAtIndex:0];
    
    //NSLog(@"%f", scroll.contentSize.height);
    
    scroll.contentSize = CGSizeMake(320.0f, 838.0f);
    
    
    /*return YES;
     
     if (textField == _dateField)
     {
     
     return NO;
     }
     else if (textField == _startTimeField)
     {
     
     return NO;
     }
     else if (textField == _finishTimeField)
     {
     
     return NO;
     }
     else if (textField == _placeNameField)
     {
     }
     else if (textField == _depthField)
     {
     }
     else if (textField == _temperatureField)
     {
     }*/
    
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    UIScrollView *scroll = (UIScrollView *)[self.view.subviews objectAtIndex:0];
    
    scroll.contentSize = CGSizeMake(320.0f, 588.0f);
    
    [textField resignFirstResponder];
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)dealloc {
    
    self.delegate = nil;
    
    [_friendsFromAddressBook release];
    [_friendsFromFacebook release];
    
    [super dealloc];
}

@end
