//
//  TUIBaseTableViewCell.m
//  Radar
//
//  Created by Diego Lafuente Garcia on 19/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIBaseTableViewCell.h"
#import "TUIBaseTableViewCell_Private.h"

@implementation TUIBaseTableViewCell

#pragma mark - Init

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

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        [self setup];
        [self setupAccessibility];
    }
    return self;
}


#pragma mark - Setup

- (void)setup
{
    [self setupSelectionStyle];
    [self setupBackground];
}

- (void)setupSelectionStyle
{
    
}

- (void)setupBackground
{
    
}

- (void)setupAccessibility
{
    
}


#pragma mark - Reusing

+ (NSString *)reuseIdentifier
{
    return NSStringFromClass(self);
}


#pragma mark - Height

- (CGFloat)cellHeight
{
    return ZERO_FLOAT;
}

@end
