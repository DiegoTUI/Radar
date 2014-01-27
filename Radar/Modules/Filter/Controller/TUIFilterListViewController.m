//
//  TUIFilterListViewController.m
//  Radar
//
//  Created by Diego Lafuente Garcia on 20/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIFilterListViewController.h"
// Extensions
#import "TUIBaseViewController_Private.h"


static CGFloat kHandlerButtonHeight = 35.0f;
static CGFloat kFilterContainerHeight = 103.0f;

@interface TUIFilterListViewController ()

/**
 The handler button
 */
@property (weak, nonatomic) IBOutlet UIButton *handlerButton;

/**
 The time filter container view
 */
@property (weak, nonatomic) IBOutlet UIView *timeFilterContainerView;

/**
 The time filter view controller
 */
@property (strong, nonatomic) UIPageViewController *timeFilterViewController;

/**
 The distance filter container view
 */
@property (weak, nonatomic) IBOutlet UIView *distanceFilterContainerView;

/**
 The distance filter view controller
 */
@property (strong, nonatomic) UIPageViewController *distanceFilterViewController;

/**
 The weather filter container view
 */
@property (weak, nonatomic) IBOutlet UIView *weatherFilterContainerView;

/**
 The weather filter view controller
 */
@property (strong, nonatomic) UIPageViewController *weatherFilterViewController;


- (IBAction)handlerButtonClicked:(UIButton *)sender;

@end

@implementation TUIFilterListViewController


#pragma mark - Data -

- (void)initData
{
    [super initData];
    // set view controllers from containers
    // set displayed to false
    _displayed = NO;
}


#pragma mark - User interface -

- (void)initUserInterface
{
    [super initUserInterface];
    
    [self initHandlerButton];
    [self initTimeFilterContainerView];
    [self initDistanceFilterContainerView];
    [self initWeatherFilterContainerView];

}

- (void)initHandlerButton
{
    _handlerButton.x = ZERO_FLOAT;
    _handlerButton.y = THREE_INT * kFilterContainerHeight;
    _handlerButton.width = self.view.width;
    _handlerButton.height = kHandlerButtonHeight;
}

- (void)initTimeFilterContainerView
{
    _timeFilterContainerView.x = ZERO_FLOAT;
    _timeFilterContainerView.y = TWO_INT * kFilterContainerHeight;
    _timeFilterContainerView.width = self.view.width;
    _timeFilterContainerView.height = kFilterContainerHeight;
}

- (void)initDistanceFilterContainerView
{
    _distanceFilterContainerView.x = ZERO_FLOAT;
    _distanceFilterContainerView.y = ONE_INT * kFilterContainerHeight;
    _distanceFilterContainerView.width = self.view.width;
    _distanceFilterContainerView.height = kFilterContainerHeight;
}

- (void)initWeatherFilterContainerView
{
    _weatherFilterContainerView.x = ZERO_FLOAT;
    _weatherFilterContainerView.y = ZERO_FLOAT;
    _weatherFilterContainerView.width = self.view.width;
    _weatherFilterContainerView.height = kFilterContainerHeight;
}

#pragma mark - Public methods -

- (CGFloat)filterHeight
{
    return kFilterContainerHeight;
}

- (NSInteger)numberOfFilters
{
    return THREE_INT;
}


#pragma mark - Handler button -

- (IBAction)handlerButtonClicked:(UIButton *)sender
{
    if (_displayed)
    {
        [_delegate hideFilters];
    }
    else
    {
        [_delegate displayFilters];
    }
}

#pragma mark - Segue -
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSString * segueName = segue.identifier;
    if ([segueName isEqualToString: @"weatherFilterContainerSegue"])
    {
        _weatherFilterViewController = [segue destinationViewController];
    }
    else if ([segueName isEqualToString: @"distanceFilterContainerSegue"])
    {
        _distanceFilterViewController = [segue destinationViewController];
    }
    else if ([segueName isEqualToString: @"timeFilterContainerSegue"])
    {
        _timeFilterViewController = [segue destinationViewController];
    }
}

@end
