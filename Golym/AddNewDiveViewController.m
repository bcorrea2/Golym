//
//  AddNewDiveViewController.m
//  Golym
//
//  Created by Bruno Corrêa on 22/04/11.
//  Copyright 2011 LBSLocal. All rights reserved.
//

#import "AddNewDiveViewController.h"
#import "NewDiveFormViewController.h"


@implementation AddNewDiveViewController
//
//- (id)initWithRootViewController:(UIViewController *)rootViewController {
//    @throw [NSException exceptionWithName:@"ERRO" 
//                                   reason:@"Construtor não permitido, use o [obj controller]" 
//                                 userInfo:nil];
//}


+(id) controller {
    AddNewDiveViewController *controller;
    
    NewDiveFormViewController *diveForm = [NewDiveFormViewController new];
    controller = [[[UINavigationController alloc] init] autorelease];
    [controller pushViewController:diveForm animated:NO];
    
    return controller;
}


@end
