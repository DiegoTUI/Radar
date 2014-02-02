//
//  TUIBasketViewController.m
//  Radar
//
//  Created by Diego Lafuente on 30/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIBasketViewController.h"
// Extensions
#import "TUIBaseViewController_Private.h"
#import "TUIBasket_Private.h"
// Models
#import "TUISpotList.h"
// Controllers
#import "TUIBasketSpotListTableViewDataSource.h"
#import "TUIBasketSpotListTableViewController_Private.h"
#import "TUIBookingViewController.h"

static const CGFloat kTotalLabelXOffset = 10.0f;

@interface TUIBasketViewController ()

/**
 Container view for the list of spots in the basket
 */
@property (weak, nonatomic) IBOutlet UIView *basketSpotListContainerView;

/**
 The basket spot list view controller
 */
@property (strong, nonatomic) TUIBasketSpotListTableViewController *basketSpotListTableViewController;

/**
 Label for the "Total" title
 */
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;

/**
 Label for the price
 */
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

/**
 Book it now button
 */
@property (weak, nonatomic) IBOutlet UIButton *bookItButton;

@end

const CGFloat kTitleViewWidth = 250.0f;
const CGFloat kTitleViewHeight = 40.0f;
const CGFloat kTitleLabelWidth = 100.0f;
const CGFloat kTitleLabelHeight = 20.0f;
const CGFloat kTitleLabelY = 10.0f;
const CGFloat kPriceLabelPadding = 10.0f;


@implementation TUIBasketViewController


#pragma mark - Initilialize data -

- (void)initData
{
    [super initData];
    
    _basketSpotListTableViewController = (TUIBasketSpotListTableViewController *)self.childViewControllers[0];
}


#pragma mark - Initilialize user interface -

- (void)initUserInterface
{
    [super initUserInterface];
    
    [self initNavigationTitle];
    [self initPriceLabels];
    [self initBookItButton];
}

- (void)initNavigationTitle
{
    UIView * customTitleView = [[UIView alloc] initWithFrame:CGRectMake(ZERO_FLOAT, ZERO_FLOAT, kTitleViewWidth, kTitleViewHeight)];
    
    UILabel * customLabel = [[UILabel alloc] initWithFrame:CGRectMake(ZERO_FLOAT, kTitleLabelY, kTitleLabelWidth, kTitleLabelHeight)];
    [customLabel setBackgroundColor:[UIColor clearColor]];
    [customLabel setTextColor:[UIColor tuiLightGreenColor]];
    [customLabel setFont:[UIFont fontWithName:REGULAR_FONT size:TITLE_SECTION_FONT_SIZE]];
    [customLabel setTextAlignment:NSTextAlignmentCenter];
    [customLabel setText:NSLocalizedString(@"BASKET_TITLE", nil)];
    [customLabel sizeToFit];
    customLabel.x = (SCREEN_WIDTH - SLIDING_VIEW_CONTROLLER_LEFT_PEEK_AMOUNT - customLabel.width) / TWO_FLOAT;
    [customTitleView addSubview:customLabel];
    
    [self.navigationItem setTitleView:customTitleView];
    
}

- (void)initPriceLabels
{
    // Total label
    _totalLabel.x = SLIDING_VIEW_CONTROLLER_LEFT_PEEK_AMOUNT + kTotalLabelXOffset;
    [_totalLabel setBackgroundColor:[UIColor clearColor]];
    [_totalLabel setTextColor:[UIColor lightGrayColor]];
    [_totalLabel setFont:[UIFont fontWithName:REGULAR_FONT size:TITLE_SECTION_FONT_SIZE]];
    [_totalLabel setTextAlignment:NSTextAlignmentLeft];
    [_totalLabel setText:NSLocalizedString(@"BASKET_TOTAL", nil)];
    [_totalLabel sizeToFit];
    // Price label
    [_priceLabel setBackgroundColor:[UIColor clearColor]];
    [_priceLabel setTextColor:[UIColor blackColor]];
    [_priceLabel setFont:[UIFont fontWithName:LIGHT_FONT size:LARGE_FONT_SIZE]];
    [_priceLabel setTextAlignment:NSTextAlignmentRight];
    //[_priceLabel sizeToFit];
    _priceLabel.x = SCREEN_WIDTH - _priceLabel.width - kPriceLabelPadding;
    
}

- (void)initBookItButton
{
}


#pragma mark - Basket -

- (void)setBasket:(TUIBasket *)basket
{
    _basket = basket;
    TUISpotList *spotList = [[TUISpotList alloc] init];
    spotList.spots = basket.spots;
    double totalPrice = [[_basket totalPrice] doubleValue];
    [_priceLabel setText:[NSString stringWithFormat:@"%.2f €", totalPrice]];
    _basketSpotListTableViewController.dataSource = [[TUIBasketSpotListTableViewDataSource alloc] initWithSpotList:spotList];
    [_basketSpotListTableViewController updateData];
}

#pragma mark - Segue -

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:CHECKOUT_SEGUE])
    {
        TUIBookingViewController *bookingViewController = (TUIBookingViewController *)([(UINavigationController *)segue.destinationViewController topViewController]);
        bookingViewController.basket = _basket;
    }
}

@end
