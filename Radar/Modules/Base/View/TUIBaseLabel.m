//
//  TUIBaseLabel.m
//  TUIBaseClasses
//
//  Created by Diego Lafuente on 23/12/13.
//  Copyright (c) 2013 Tui Travel A&D. All rights reserved.
//

#import "TUIBaseLabel.h"
// Extension
#import "TUIBaseView_Private.h"


@implementation TUIBaseLabel

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

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        [self setup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self)
    {
        [self setup];
    }
    return self;
}


#pragma mark - Setup

- (void)setup
{
    [self setupAppearance];
}

- (void)setupAppearance
{
    self.font = [UIFont fontWithName:REGULAR_FONT size:REGULAR_FONT_SIZE];
    self.backgroundColor = [UIColor clearColor];
    self.textColor = [UIColor bodyTextColor];
}


#pragma mark - Kerning

- (void)setKerning:(CGFloat)kerning
{
    if(self.text)
    {
        NSAttributedString *string = self.attributedText.length > ZERO_INT ? self.attributedText : [[NSAttributedString alloc] initWithString:self.text];
        NSMutableAttributedString *mutableAttributedString = [[NSMutableAttributedString alloc] initWithAttributedString:string];
        [mutableAttributedString addAttribute:NSKernAttributeName value:[NSNumber numberWithFloat:kerning] range:NSMakeRange(ZERO_INT, string.length)];
        
        self.attributedText = mutableAttributedString;
    }
}


#pragma mark - Actual Text

- (NSString *)actualText
{
    NSString *actualText = self.text;
    
    return actualText;
}

@end
