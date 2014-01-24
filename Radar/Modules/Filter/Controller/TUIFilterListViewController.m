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
// Controllers
#import "TUIWeatherPageViewControllerDataSource.h"
#import "TUITimePageViewControllerDataSource.h"
#import "TUIDistancePageViewControllerDataSource.h"
#import "TUIPageViewControllerDataSource.h"
#import "TUIFilterContentViewController.h"

static CGFloat kHandlerButtonHeight = 35.0f;
static CGFloat kFilterContainerHeight = 103.0f;

@interface TUIFilterListViewController ()<UIPageViewControllerDelegate>

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

@property (strong, nonatomic) TUIWeatherPageViewControllerDataSource *weatherDataSource;
@property (strong, nonatomic) TUITimePageViewControllerDataSource *timeDataSource;
@property (strong, nonatomic) TUIDistancePageViewControllerDataSource *distanceDataSource;


- (IBAction)handlerButtonClicked:(UIButton *)sender;

@end

@implementation TUIFilterListViewController


#pragma mark - Data -

- (void)initData
{
    [super initData];
    // set view controllers from containers
    _weatherDataSource = [[TUIWeatherPageViewControllerDataSource alloc] init];
    _weatherFilterViewController.dataSource = _weatherDataSource;
    _weatherFilterViewController.delegate = self;
    _weatherFilterViewController.view.height =  _weatherFilterViewController.view.height;
    [_weatherFilterViewController setViewControllers:@[_weatherDataSource.viewControllers[0]] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    _timeDataSource = [[TUITimePageViewControllerDataSource alloc] init];
    _timeFilterViewController.dataSource = _timeDataSource;
    _timeFilterViewController.delegate = self;
    _timeFilterViewController.view.height =  _timeFilterViewController.view.height;
    [_timeFilterViewController setViewControllers:@[_timeDataSource.viewControllers[0]] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    _distanceDataSource = [[TUIDistancePageViewControllerDataSource alloc] init];
    _distanceFilterViewController.dataSource = _distanceDataSource;
    _distanceFilterViewController.delegate = self;
    _distanceFilterViewController.view.height =  _distanceFilterViewController.view.height;
    [_distanceFilterViewController setViewControllers:@[_distanceDataSource.viewControllers[0]] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
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

#pragma mark - Changed filter

- (void)pageViewController:(UIPageViewController *)pageViewController
        didFinishAnimating:(BOOL)finished
   previousViewControllers:(NSArray *)previousViewControllers
       transitionCompleted:(BOOL)completed
{
    TUIFilterContentViewController *previousViewController = previousViewControllers[ZERO_INT];
    
    NSLog(@"Cambio el filtro: %d", previousViewControllers.count);
    
 if(  pageViewController == _weatherFilterViewController)
 {
    NSLog(@"Cambio weather");
     TUIPageViewControllerDataSource *weatherDataSource = _weatherFilterViewController.dataSource;
     if(previousViewController == weatherDataSource.viewControllers[ZERO_INT]){
         NSLog(@"outdoor");
     }
 }
    else if(pageViewController == _distanceFilterViewController)
    {
        NSLog(@"Cambio distance");
        TUIPageViewControllerDataSource *distanceDataSource = _distanceFilterViewController.dataSource;
        if(previousViewController == distanceDataSource.viewControllers[ZERO_INT] ||
           previousViewController == distanceDataSource.viewControllers[TWO_INT]){
            NSLog(@"1km");
        }else if(previousViewController == distanceDataSource.viewControllers[ONE_INT])
        {
            NSLog(@"previousViewCOntroller Title: %@", pageViewController.dataSource);
            NSLog(@"+1km");
        }
    }
}
- (void)pageViewController:(UIPageViewController *)pageViewController
willTransitionToViewControllers:(NSArray *)pendingViewControllers
{
    
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
