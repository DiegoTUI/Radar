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
#import "TUIFilters.h"


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

/**
 The data sources
 */
@property (strong, nonatomic) TUIWeatherPageViewControllerDataSource *weatherDataSource;
@property (strong, nonatomic) TUITimePageViewControllerDataSource *timeDataSource;
@property (strong, nonatomic) TUIDistancePageViewControllerDataSource *distanceDataSource;

/**
 The filters object
 */
@property (nonatomic, strong) TUIFilters *filters;
@property (nonatomic, strong) TUIFilters *temporalFilters;

/**
 The filter icons
 */
@property (weak, nonatomic) IBOutlet UIImageView *timeStatusFilterImage;
@property (weak, nonatomic) IBOutlet UIImageView *weatherStatusFilterImage;
@property (weak, nonatomic) IBOutlet UIImageView *distanceStatusFilterImage;

/**
 The active filters
 */
@property (nonatomic, copy) NSString *activeWeatherFilter;
@property (nonatomic) NSUInteger activeDistanceFilter;
@property (nonatomic, copy) NSString *activeTimeFilter;

- (IBAction)handlerButtonClicked:(UIButton *)sender;

@end

@implementation TUIFilterListViewController


#pragma mark - Data -

- (void)initData
{
    [super initData];
    // Get current filters
    _filters = [TUIFilters currentFilters];
    _temporalFilters = [TUIFilters currentFilters];
    // set view controllers from containers
    _weatherDataSource = [[TUIWeatherPageViewControllerDataSource alloc] init];
    _weatherFilterViewController.dataSource = _weatherDataSource;
    _weatherFilterViewController.delegate = self;
    _weatherFilterViewController.view.height =  _weatherFilterViewController.view.height;
    [_weatherFilterViewController setViewControllers:@[_weatherDataSource.viewControllers[_filters.weatherFilterIndex]] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    _timeDataSource = [[TUITimePageViewControllerDataSource alloc] init];
    _timeFilterViewController.dataSource = _timeDataSource;
    _timeFilterViewController.delegate = self;
    _timeFilterViewController.view.height =  _timeFilterViewController.view.height;
    [_timeFilterViewController setViewControllers:@[_timeDataSource.viewControllers[_filters.timeFilterIndex]] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    _distanceDataSource = [[TUIDistancePageViewControllerDataSource alloc] init];
    _distanceFilterViewController.dataSource = _distanceDataSource;
    _distanceFilterViewController.delegate = self;
    _distanceFilterViewController.view.height =  _distanceFilterViewController.view.height;
    [_distanceFilterViewController setViewControllers:@[_distanceDataSource.viewControllers[_filters.distanceFilterIndex]] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    // set displayed to false
    _displayed = NO;
    // update active filters
    [self updateActiveFilters];
}


#pragma mark - User interface -

- (void)initUserInterface
{
    [super initUserInterface];
    
    [self initHandlerButton];
    [self initFilterIcons];
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

- (void)initFilterIcons
{
    _weatherStatusFilterImage.image = [UIImage imageNamed:_filters.weatherFilterIconImage];
    _distanceStatusFilterImage.image = [UIImage imageNamed:_filters.distanceFilterIconImage];
    _timeStatusFilterImage.image = [UIImage imageNamed:_filters.timeFilterIconImage];
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
    
    if(completed){
        
        if(pageViewController == _weatherFilterViewController){
            
            _weatherStatusFilterImage.image = [UIImage imageNamed:_temporalFilters.weatherFilterIconImage];
            
        } else if(pageViewController == _distanceFilterViewController){
            
            _distanceStatusFilterImage.image = [UIImage imageNamed:_temporalFilters.distanceFilterIconImage];
            
        } else if(pageViewController == _timeFilterViewController){
            
            _timeStatusFilterImage.image = [UIImage imageNamed:_temporalFilters.timeFilterIconImage];
            
        }
        
        _filters = _temporalFilters;
        // update active filters
        [self updateActiveFilters];
    }
}


- (void)pageViewController:(UIPageViewController *)pageViewController
willTransitionToViewControllers:(NSArray *)pendingViewControllers
{
    TUIFilterContentViewController *pending = pendingViewControllers[ZERO_INT];
    NSString *lastChanged;
    
    if (pageViewController == _weatherFilterViewController)
    {
        _temporalFilters.weatherFilterIndex = pending.pageIndex;
        _temporalFilters.weatherFilterIconImage = pending.smallIcoImage;
        _temporalFilters.weatherFilterLabel = pending.labelString;
        lastChanged = @"weatherFilter";
    
    }
    
    if (pageViewController == _distanceFilterViewController)
    {
        _temporalFilters.distanceFilterIndex = pending.pageIndex;
        _temporalFilters.distanceFilterIconImage = pending.smallIcoImage;
        _temporalFilters.distanceFilterLabel = pending.labelString;
        lastChanged = @"distanceFilter";
        
    }
    
    if (pageViewController == _timeFilterViewController)
    {
        _temporalFilters.timeFilterIndex = pending.pageIndex;
        _temporalFilters.timeFilterIconImage = pending.smallIcoImage;
        _temporalFilters.timeFilterLabel = pending.labelString;
        lastChanged = @"timeFilter";
        
    }
    
    _temporalFilters.lastPageViewControllerChanged = lastChanged;
    
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


#pragma mark - Update Filters -

- (void)updateFilters
{
    [self initData];
    [self initFilterIcons];
}

- (void)updateActiveFilters
{
    // Weather
    _activeWeatherFilter = [_filters.weatherFilterLabel isEqualToString:NSLocalizedString(@"FILTERS_WEATHER_SUNNY", nil)] ?
                                                                                                    WEATHER_SUNNY: WEATHER_CLOUDY;
    // Distance
    _activeDistanceFilter = DISTANCE_300_M;
    if ([_filters.distanceFilterLabel isEqualToString:NSLocalizedString(@"FILTERS_DISTANCE_300M", nil)])
    {
        _activeDistanceFilter = DISTANCE_1000_M;
    }
    else if ([_filters.distanceFilterLabel isEqualToString:NSLocalizedString(@"FILTERS_DISTANCE_FAR", nil)])
    {
        _activeDistanceFilter = DISTANCE_FAR;
    }
    
    // Time
    _activeTimeFilter = [_filters.timeFilterLabel isEqualToString:NSLocalizedString(@"FILTERS_TIME_TODAY", nil)] ?
                                                                                                    TIME_TODAY: TIME_TOMORROW;
}

@end
