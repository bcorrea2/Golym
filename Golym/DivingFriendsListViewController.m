//
//  DivingFriendsListViewController.m
//  Golym
//
//  Created by Bruno Corrêa on 22/04/11.
//  Copyright 2011 LBSLocal. All rights reserved.
//

#import "DivingFriendsListViewController.h"


@implementation DivingFriendsListViewController
@synthesize delegate;
@synthesize friendsFromAddressBook  = _selectedFromAddressBook;
@synthesize friendsFromFacebook     = _selectedFromFacebook;



#pragma mark - View lifecycle

- (void)loadView {
    self.view = [[[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 414.0f)] autorelease];
    
    _friendsSelectionTypeSegment = [[UISegmentedControl alloc] initWithFrame:CGRectMake(20.0f, (49 / 2) - (31 / 2), 280.0f, 31.0f)];
    [_friendsSelectionTypeSegment insertSegmentWithTitle:@"Agenda" atIndex:0 animated:NO];
    [_friendsSelectionTypeSegment insertSegmentWithTitle:@"Facebook" atIndex:1 animated:NO];
    [_friendsSelectionTypeSegment setSegmentedControlStyle:UISegmentedControlStyleBar];
    [_friendsSelectionTypeSegment addTarget:self action:@selector(friendsSelectionSegmentChanged:) 
                           forControlEvents:UIControlEventValueChanged];
    _friendsSelectionTypeSegment.tintColor = [UIColor colorWithRed:20/255.0f green:117/255.0f blue:220/255.0f alpha:1.0f];
    
    UINavigationBar *segmentContainer;
    segmentContainer = [[UINavigationBar alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 49.0f)];
    [segmentContainer addSubview:_friendsSelectionTypeSegment];
    segmentContainer.tintColor = [UIColor colorWithRed:20/255.0f green:117/255.0f blue:220/255.0f alpha:1.0f];
    [self.view addSubview:segmentContainer];
    
    CGRect r = [self.view bounds];
    r.origin.y      += 49.0f;
    r.size.height   -= 49.0f;
    _tableView = [[UITableView alloc] initWithFrame:r style:UITableViewStylePlain];
    _tableView.delegate     = self;
    _tableView.dataSource   = self;
    
    [self.view addSubview: _tableView ];
    
    [segmentContainer release];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Amigos";
    
    
    
    if (_selectedFromAddressBook == nil)
    {
        _selectedFromAddressBook    = [NSMutableArray new];
    }
    
    if (_selectedFromFacebook == nil)
    {
        _selectedFromFacebook       = [NSMutableArray new];
    }
        
    [_friendsSelectionTypeSegment setSelectedSegmentIndex:0];
}


- (void)viewDidUnload {
    [super viewDidUnload];
}


-(void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.delegate divingFriendsListViewControllerDidFinish:_selectedFromAddressBook
                                 friendsFromFacebook:_selectedFromFacebook];
}

#pragma -

-(void) friendsSelectionSegmentChanged:(UISegmentedControl *)segmentControl {
    if (segmentControl.selectedSegmentIndex == 0)
    {
        if (_addressBookFriends == nil)
        {
            [self performSelector:@selector(loadAddressBookContacts)];
        }
        
        _currentFriends     = _addressBookFriends;
        _selectedFriends    = _selectedFromAddressBook;
    }
    else if (segmentControl.selectedSegmentIndex == 1)
    {
        if (_facebookFriends == nil)
        {
            // fetch data ;(
//#warning implementar buscar contatos facebok
        }
        _currentFriends     = _facebookFriends;
        _selectedFriends    = _selectedFromFacebook;
        
        [[[[UIAlertView alloc] initWithTitle:nil
                                     message:@"Aguarde updates."
                                    delegate:nil
                           cancelButtonTitle:@"OK" 
                           otherButtonTitles:nil] autorelease] show];
    }
    
    
    
    [_tableView reloadData];
}


-(void) loadAddressBookContacts {
    ABAddressBookRef m_addressbook = ABAddressBookCreate();
	CFArrayRef  allPeople   = ABAddressBookCopyArrayOfAllPeople(m_addressbook);
    CFIndex     nPeople     = ABAddressBookGetPersonCount(m_addressbook);
    
    
    _addressBookFriends = [NSMutableArray new];
    
    Friend      *friend = nil;
    for (int i=0; i < nPeople; i++) { 
		ABRecordRef ref = CFArrayGetValueAtIndex(allPeople,i);
        
        friend = [[Friend alloc] initWithABRecordRef:ref];
        if (friend)
        {   
            [_addressBookFriends addObject: friend ];
        }
        [friend release];
    }
    
    CFRelease(allPeople);
    CFRelease(m_addressbook);
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_currentFriends count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    
    Friend  *f = [_currentFriends objectAtIndex:indexPath.row];
        
    cell.textLabel.text         = [f firstName];
    cell.detailTextLabel.text   = [f lastName];
    
    cell.imageView.image = [_selectedFriends containsObject:f] ? [UIImage imageNamed:@"checkmark.png"] : nil;    
    
    return cell;
}



#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {    
    if ([_friendsSelectionTypeSegment selectedSegmentIndex] == 0)
    {
        _selectedFriends = _selectedFromAddressBook;
    }
    else 
    {
        _selectedFriends = _selectedFromFacebook;
    }
    
    
    Friend *f = [_currentFriends objectAtIndex:indexPath.row];
    if ([_selectedFriends containsObject: f ])
    {
        [_selectedFriends removeObject:f];
    }
    else 
    {
        [_selectedFriends addObject:f];
    }
    
    [_tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationMiddle];
}


#pragma -

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


- (void)dealloc {
    self.delegate = nil;
    
    [_tableView release];
    [_friendsSelectionTypeSegment release];
    
    _currentFriends     = nil;
    _selectedFriends    = nil;
    
    [_addressBookFriends release];
    [_selectedFromAddressBook release];
    
    [_facebookFriends release];
    [_selectedFromFacebook release];
    
    [super dealloc];
}


@end
