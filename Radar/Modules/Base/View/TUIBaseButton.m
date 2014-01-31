//
//  TUIBaseButton.m
//  Radar
//
//  Created by Diego Lafuente on 29/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIBaseButton.h"
// Extensions
#import "TUIBaseButton_Private.h"

@implementation TUIBaseButton

#pragma mark - Init

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setup];
        [self setupAccessibility];
    }
    
    return self;
}

- (id)init
{
    self = [super init];
    if(self)
    {
#ifdef DEBUG
        [NSException raise:NSInternalInconsistencyException format:@"You must one of the designed initialize methods of this class, not %@", NSStringFromSelector(_cmd)];
#endif
    }
    
    return self;
}


#pragma mark - Setup

- (void)setup
{
    
}


#pragma mark - Accessibility

- (void)setupAccessibility
{
    
}

@end
