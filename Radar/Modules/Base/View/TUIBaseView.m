//
//  TUIBaseView.m
//  TUIBaseClasses
//
//  Created by Diego Lafuente on 23/12/13.
//  Copyright (c) 2013 Tui Travel A&D. All rights reserved.
//

#import "TUIBaseView.h"

@implementation TUIBaseView

#pragma mark - Initilization

- (id)init
{
    self = [super init];
    if(self)
    {
#ifdef DEBUG
        [NSException raise:NSInternalInconsistencyException format:@"You must use one of the designed initialize methods of this class, not %@", NSStringFromSelector(_cmd)];
#endif
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        [self setup];
        [self setupAccessibility];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self setup];
    [self setupAccessibility];
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
