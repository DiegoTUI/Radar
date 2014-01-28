//
//  TUISpotsViewController.m
//  Radar
//
//  Created by Diego Lafuente Garcia on 19/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUISpotsViewController.h"
// Extensions
#import "TUIBaseViewController_Private.h"
#import "TUISpotListTableViewController_Private.h"
// Controllers
#import "TUISpotListTableViewDataSource.h"

static CGFloat kHandlerHeight = 22.0f;
static NSInteger kNumberOfElementsShownInTheList = 4;
static CGFloat kRowHeight = 89.0f;

@interface TUISpotsViewController ()

/**
 The handler button
 */
@property (weak, nonatomic) IBOutlet UIButton *handlerButton;

/**
 The container of the TUISpotListTableViewController
 */
@property (weak, nonatomic) IBOutlet UIView *spotListContainerView;

/**
 The TUISpotListTableViewController itself
 */
@property (strong, nonatomic) TUISpotListTableViewController *spotListTableViewController;

/**
 The handler button click event handler
 */
- (IBAction)handlerButtonClicked:(UIButton *)sender;

@end

@implementation TUISpotsViewController


#pragma mark - Data -

- (void)initData
{
    [super initData];
    // default displayed flag
    _displayed = NO;
    // spot list table view controller
    _spotListTableViewController = (TUISpotListTableViewController *) self.childViewControllers[0];
}


#pragma mark - User interface -

- (void)initUserInterface
{
    [super initUserInterface];
    
    [self initHandlerButton];
    [self initContainerListView];
}

- (void)initHandlerButton
{
    _handlerButton.x = ZERO_FLOAT;
    _handlerButton.y = ZERO_FLOAT;
    _handlerButton.width = self.view.width;
    _handlerButton.height = kHandlerHeight;
    // set image
    UIImage *listUpImage = [UIImage imageNamed:@"ux-list-up.png"];
    [_handlerButton setImage:listUpImage forState:UIControlStateNormal];
}

- (void)initContainerListView
{
    _spotListContainerView.x = ZERO_FLOAT;
    _spotListContainerView.y = _handlerButton.y + _handlerButton.height;
    _spotListContainerView.width = self.view.width;
    _spotListContainerView.height = kNumberOfElementsShownInTheList*kRowHeight;
}


#pragma mark - Toggle list -

- (IBAction)handlerButtonClicked:(UIButton *)sender
{
    if (_displayed)
    {
        UIImage *listUpImage = [UIImage imageNamed:@"ux-list-up.png"];
        [_handlerButton setImage:listUpImage forState:UIControlStateNormal];
        
        [_delegate hideList];
    }
    else
    {
        UIImage *listDownImage = [UIImage imageNamed:@"ux-list-down.png"];
        [_handlerButton setImage:listDownImage forState:UIControlStateNormal];
        
        [_delegate displayList];
    }
}


#pragma mark - Reload spots -

- (void)reloadSpotsWithSpotList:(TUISpotList *)spotList
{
    _spotListTableViewController.dataSource = [[TUISpotListTableViewDataSource alloc] initWithSpotList:spotList];
    [_spotListTableViewController updateData];
}

@end
