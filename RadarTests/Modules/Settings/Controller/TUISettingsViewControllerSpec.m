//
//  TuiSettingsViewControllerSpec.m
//  Radar
//
//  Created by Diego Lafuente on 1/9/14.
//  Copyright 2014 TUI Travel A&D. All rights reserved.
//

#import "Kiwi.h"
#import "TUISettingsViewController.h"
#import "TUISettings.h"

SPEC_BEGIN(TUISettingsViewControllerSpec)

__block TUISettingsViewController *viewController;

describe(@"TUISettingsViewController", ^{
    
    beforeEach(^{
        viewController = [[TUISettingsViewController alloc] init];
    });
    
    it(@"should have a delegate", ^{
        [[viewController should] respondToSelector:@selector(delegate)];
    });
    
    describe(@"when initiating the data", ^{
        
        it(@"should retrieve the settings from the cache", ^{
            [TUISettings stub:@selector(cachedSettings) andReturn:[TUISettings mock]];
            [[TUISettings should] receive:@selector(cachedSettings) withCount:2];
            [viewController performSelector:@selector(initData)];
        });
    });
   
});

SPEC_END