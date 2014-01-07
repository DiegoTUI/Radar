//
//  TUIBaseViewController.m
//  TUIBaseClasses
//
//  Created by Diego Lafuente on 23/12/13.
//  Copyright (c) 2013 Tui Travel A&D. All rights reserved.
//

#import "TUIBaseViewController.h"
#import "TUIBaseViewController_Private.h"
#import "TUITitleView.h"


@interface TUIBaseViewController () <UIGestureRecognizerDelegate>
{
    BOOL _isObservingKeyboard;
}
@end


@implementation TUIBaseViewController


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
    [self stopObservingKeyboard];
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
    [self initNavigationBar];
    [self initTitleView];
    [self initCustomLeftBarButtonItem];
    [self initGestureToHideKeyboard];
    
    [self setInteractivePopGestureEnabled:YES];
}

- (void)initNavigationBar
{
    if (SYSTEM_VERSION_LESS_THAN_7)
    {
        // Force black status bar in iOS6
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    }
}

- (void)initTitleView
{
    TUITitleView *titleView = [TUITitleView titleView];
    self.navigationItem.titleView = titleView;
}

- (void)initCustomLeftBarButtonItem
{
    // Set custom back button
    self.leftBarButtonItem = [UIBarButtonItem backBarButtonItemWithTarget:self action:@selector(backButtonPressed:)];
    self.navigationItem.leftBarButtonItem = self.leftBarButtonItem;
}

- (void)setInteractivePopGestureEnabled:(BOOL)enabled
{
    // Activate back swipe gesture after setting custom back button
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO_7)
    {
        if (enabled)
        {
            self.navigationController.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;
        }
        else
        {
            self.navigationController.interactivePopGestureRecognizer.delegate = nil;
        }
    }
}

- (void)updateGlobalNavigationBehavior
{
    
}


#pragma mark - Update user interface

- (void)updateUserInterface
{
    [self updateTitle];
    [self updateGlobalNavigationBehavior];
}

- (void)updateTitle
{
    TUITitleView *titleView = (TUITitleView *)self.navigationItem.titleView;
    if ([titleView isKindOfClass:[TUITitleView class]])
    {
        titleView.titleLabel.text = self.title;
    }
}


#pragma mark - Deinitialize user interface

- (void)deinitUserInterface
{
    
}


#pragma mark - Navigation

- (void)backButtonPressed:(UIBarButtonItem *)barButtonItem
{
    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark - ScrollView

- (void)adjustScrollViewInsetsForScrollView:(UIScrollView *)scrollView
{
    scrollView.contentInset = UIEdgeInsetsMake(NAVIGATION_BAR_HEIGHT, ZERO_ORIGIN, ZERO_FLOAT, ZERO_FLOAT);
}


@end



#pragma mark - TUIBaseViewController (Keyboard) -


static UIScrollView *keyboardScrollView;


@implementation TUIBaseViewController (Keyboard)


#pragma mark - Hide keyboard

- (void)initGestureToHideKeyboard
{
    UIGestureRecognizer *tapGestureRecgonizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    tapGestureRecgonizer.cancelsTouchesInView = NO;
    tapGestureRecgonizer.delegate = self;
    [self.tapInterceptionView addGestureRecognizer:tapGestureRecgonizer];
}

- (void)hideKeyboard
{
    [self.tapInterceptionView endEditing:YES];
}

- (UIView *)tapInterceptionView
{
    return self.view;
}


#pragma mark - Keyboard scrolling and insets

- (void)registerScrollViewForKeyboardBehavior:(UIScrollView *)scrollView
{
    keyboardScrollView = scrollView;
    
    [self observeKeyboard];
}

- (void)observeKeyboard
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
    _isObservingKeyboard = YES;
}

- (void)stopObservingKeyboard
{
    if ( _isObservingKeyboard )
    {
        _isObservingKeyboard = NO;
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    }
}

- (void)keyboardWasShown:(NSNotification*)aNotification
{
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize      = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    
    UIEdgeInsets contentInsets               = UIEdgeInsetsMake(ZERO_ORIGIN, ZERO_ORIGIN, kbSize.height, ZERO_ORIGIN);
    keyboardScrollView.contentInset          = contentInsets;
    keyboardScrollView.scrollIndicatorInsets = contentInsets;
}

- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    UIEdgeInsets contentInsets               = UIEdgeInsetsZero;
    keyboardScrollView.contentInset          = contentInsets;
    keyboardScrollView.scrollIndicatorInsets = contentInsets;
}

@end