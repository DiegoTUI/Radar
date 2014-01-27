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


@property (strong, nonatomic) TUIWeatherPageViewControllerDataSource *weatherDataSource;
@property (strong, nonatomic) TUITimePageViewControllerDataSource *timeDataSource;
@property (strong, nonatomic) TUIDistancePageViewControllerDataSource *distanceDataSource;

/**
 The settings object
 */
@property (nonatomic, strong) TUIFilters *settings;
@property (nonatomic, strong) TUIFilters *temporalSetings;

@property (weak, nonatomic) IBOutlet UIImageView *timeStatusFilterImage;
@property (weak, nonatomic) IBOutlet UIImageView *weatherStatusFilterImage;
@property (weak, nonatomic) IBOutlet UIImageView *distanceStatusFilterImage;

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
    
    _settings = [TUIFilters defaultSettings];
    _temporalSetings = [TUIFilters defaultSettings];
    
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
    
    if(completed){
        
        if(pageViewController == _weatherFilterViewController){
            
            _weatherStatusFilterImage.image = [UIImage imageNamed:_temporalSetings.weatherFilterIconImage];
            
        } else if(pageViewController == _distanceFilterViewController){
            
            _distanceStatusFilterImage.image = [UIImage imageNamed:_temporalSetings.distanceFilterIconImage];
            
        } else if(pageViewController == _timeFilterViewController){
            
            _timeStatusFilterImage.image = [UIImage imageNamed:_temporalSetings.timeFilterIconImage];
            
        }
        
        _settings = _temporalSetings;
    }
}


- (void)pageViewController:(UIPageViewController *)pageViewController
willTransitionToViewControllers:(NSArray *)pendingViewControllers
{
    TUIFilterContentViewController *pending = pendingViewControllers[ZERO_INT];
    NSString *lastChanged;
    
    if (pageViewController == _weatherFilterViewController)
    {
        _temporalSetings.weatherFilterIndex = pending.pageIndex;
        _temporalSetings.weatherFilterIconImage = pending.smallIcoImage;
        _temporalSetings.weatherFilterLabel = pending.labelString;
        lastChanged = @"weatherFilter";
    
    }
    
    if (pageViewController == _distanceFilterViewController)
    {
        _temporalSetings.distanceFilterIndex = pending.pageIndex;
        _temporalSetings.distanceFilterIconImage = pending.smallIcoImage;
        _temporalSetings.distanceFilterLabel = pending.labelString;
        lastChanged = @"distanceFilter";
        
    }
    
    if (pageViewController == _timeFilterViewController)
    {
        _temporalSetings.timeFilterIndex = pending.pageIndex;
        _temporalSetings.timeFilterIconImage = pending.smallIcoImage;
        _temporalSetings.timeFilterLabel = pending.labelString;
        lastChanged = @"timeFilter";
        
    }
    
    _temporalSetings.lastPageViewControllerChanged = lastChanged;
    
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


#pragma mark - Update Settings -

- (void)updateSettings
{
   // _settings.weather = [_weatherView.weatherSegmentedControl titleForSegmentAtIndex:_weatherView.weatherSegmentedControl.selectedSegmentIndex];
    //_settings.weatherFilterIndex =
}

@end
