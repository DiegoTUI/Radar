//
//  TUIBasePageViewController.m
//  Radar
//
//  Created by Diego Lafuente Garcia on 20/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIBasePageViewController.h"

@interface TUIBasePageViewController ()

@end

@implementation TUIBasePageViewController

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
