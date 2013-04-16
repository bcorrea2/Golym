//
//  MyDivingsViewController.m
//  Golym
//
//  Created by Bruno Corrêa on 21/04/11.
//  Copyright 2011 LBSLocal. All rights reserved.
//

#import "MyDivingsViewController.h"

@implementation MyDivingsViewController

#pragma mark - View lifecycle

- (void)loadView {
    self.view = [[[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 367.0)] autorelease];
    
    _tableView = [[UITableView alloc] initWithFrame:[self.view bounds] style:UITableViewStylePlain];
    _tableView.delegate     = self;
    _tableView.dataSource   = self;
    
    [self.view addSubview: _tableView ];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Meus Mergulhos";
    _tableView.rowHeight = 60.0f;
    
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                                            target:self
                                                                                            action:@selector(addNewDive)] autorelease];
    
    _divingsContainer = [DivingsContainer new];
    
}

-(void) viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    [_divingsContainer commitChangesIfNecessary];
}


- (void)viewDidUnload {
    [super viewDidUnload];
}

#pragma -


-(void) addNewDive {
    NewDiveFormViewController   *ndvc   = [NewDiveFormViewController new];
    UINavigationController      *nc     = [[UINavigationController alloc] initWithRootViewController:ndvc];
    nc.navigationBar.tintColor = [UIColor colorWithRed:20/255.0f green:117/255.0f blue:220/255.0f alpha:1.0f];
    
    ndvc.delegate = self;
    [self presentModalViewController:nc animated:YES];
    
    [ndvc   release];
    [nc     release];
}

-(void) newDiveFormViewControllerDidFinishWithDive:(Dive *)dive {
    [_divingsContainer addNewDive: dive ];
    [_tableView reloadData];
    [_divingsContainer commitChangesIfNecessary];
}


-(void) myDiveDetailViewController:(MyDiveDetailViewController *)detailViewController 
            didSelectDiveForRemove:(Dive *)dive {
    
    [_tableView beginUpdates];
    
    NSIndexPath *index = [NSIndexPath indexPathForRow:[_divingsContainer.divings indexOfObject:dive ] inSection:0];
    
    [_divingsContainer removeDive: dive ];
    
    [_tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:index] withRowAnimation:UITableViewRowAnimationLeft];
    [_divingsContainer commitChangesIfNecessary];
    
    [_tableView endUpdates];
}


-(void) myDiveDetailViewController:(MyDiveDetailViewController *)detailViewController 
           didSelectDiveForEdition:(Dive *)dive replacingWith:(Dive *)replacedDive {

    [_divingsContainer removeDive: dive ];
    [_divingsContainer addNewDive: replacedDive  ];
    
    [_tableView reloadData];
}




#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_divingsContainer.divings count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    MyDivingsTableViewCell *cell = (MyDivingsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[MyDivingsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    Dive *dive = [_divingsContainer.divings objectAtIndex:indexPath.row];
    
    cell.dateLabel.text         = [NSString stringWithFormat:@"%@ - %@", [dive date], [dive startTime]];
    cell.depthLabel.text        = [NSString stringWithFormat:@"%@ metros", [dive depth]];
    cell.placeNameLabel.text    = [dive placeName];
    
    return cell;
}



#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    MyDiveDetailViewController *detail = [MyDiveDetailViewController new];
    
    detail.currentDive  = [_divingsContainer.divings objectAtIndex:indexPath.row];
    detail.delegate     = self;
    
    [self.navigationController pushViewController:detail animated:YES];
    [detail release];
}

#pragma -



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];    
}

- (void)dealloc {
    [_tableView         release];
    [_divingsContainer  release];
    [super dealloc];
}

@end
