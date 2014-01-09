//
//  TUIBaseViewControllerSpec.m
//  Radar
//
//  Created by Diego Lafuente on 1/7/14.
//  Copyright (c) 2013 Tui Travel A&D. All rights reserved.
//

#import "Kiwi.h"
#import "TUIBaseViewController.h"
#import "TUIBaseViewController_Private.h"

SPEC_BEGIN(TUIBaseViewControllerSpec)

__block TUIBaseViewController *baseViewController;

beforeAll(^{
    baseViewController = [[TUIBaseViewController alloc] init];
});

describe(@"TUIBaseViewController", ^{
    it(@"should subclass UIViewController", ^{
        [[TUIBaseViewController should] beSubclassOfClass:[UIViewController class]];
    });
    
    it(@"should adjust scrollView insets correctly for iOS7", ^{
        UIScrollView *scrollView = [[UIScrollView alloc] init];
        [baseViewController adjustScrollViewInsetsForScrollView:scrollView];
        
        [[theValue(scrollView.contentInset.top) should] equal:(theValue(NAVIGATION_BAR_HEIGHT))];
    });
});

SPEC_END