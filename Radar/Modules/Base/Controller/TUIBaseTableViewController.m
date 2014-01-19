//
//  TUIBaseTableViewController.m
//  Radar
//
//  Created by Diego Lafuente Garcia on 19/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIBaseTableViewController.h"

@interface TUIBaseTableViewController ()

@end

@implementation TUIBaseTableViewController

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initData];
    [self initUserInterface];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self updateData];
    [self updateUserInterface];
}

- (void)dealloc
{
    [self deinitUserInterface];
    [self deinitData];
}


#pragma mark - Data

- (void)initData
{
    
}

- (void)updateData
{
    
}

- (void)deinitData
{
    
}


#pragma mark - User interface

- (void)initUserInterface
{
    
}

- (void)updateUserInterface
{
    
}

- (void)deinitUserInterface
{
    
}

@end
