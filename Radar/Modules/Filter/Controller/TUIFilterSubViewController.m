//
//  TUIFilterSubViewController.m
//  Radar
//
//  Created by jmartin on 22/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIFilterSubViewController.h"
// Extension
#import "TUIBaseViewController_Private.h"

@interface TUIFilterSubViewController ()
{
    UIImageView* _imageView;
    NSUInteger _pageIndex;
    UILabel* _textLabel;
    UIPageControl* _pageControl;
}
@end

@implementation TUIFilterSubViewController

-(id)initWithImageName:(NSString *)imageName atIndex:(NSUInteger)index atText:(NSString *)text
{
    if(self = [super init]){
        
        _pageIndex = index;
        
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.width/2-12, 22, 25, 25)];
        [_imageView setImage:[UIImage imageNamed:imageName]];
        [self.view addSubview:_imageView];
        
        _textLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.view.width/2-50, 52, 100, 10)];
         _textLabel.text = text;
        [_textLabel setTextAlignment:NSTextAlignmentCenter];
         _textLabel.textColor = [UIColor tuiLightGreenColor];
         _textLabel.font = [UIFont systemFontOfSize:FILTER_MENU_FONT_SIZE];
         [self.view addSubview:_textLabel];
    }
    return self;
}

-(id)initWithImageName:(NSString *)imageName atIndex:(NSUInteger)index
{
    if(self = [super init]){
        _pageIndex = index;
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.width/2-12, 22, 25, 25)];
        [_imageView setImage:[UIImage imageNamed:imageName]];
        [self.view addSubview:_imageView];
    }
    return self;
}

#pragma mark - Data

- (void)initData
{
    [super initData];
    
    
}

#pragma mark - User interface

- (void)initUserInterface
{
    [super initUserInterface];
    self.view.backgroundColor = [UIColor whiteBackgroundColor];
}

@end
