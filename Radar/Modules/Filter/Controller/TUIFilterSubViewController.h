//
//  TUIFilterSubViewController.h
//  Radar
//
//  Created by jmartin on 22/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIBaseViewController.h"

@interface TUIFilterSubViewController : TUIBaseViewController

@property (nonatomic, readwrite) NSUInteger pageIndex;

- (id)initWithImageName:(NSString*)imageName atIndex:(NSUInteger)index atText:(NSString*)text;
- (id)initWithImageName:(NSString*)imageName atIndex:(NSUInteger)index;

@end
