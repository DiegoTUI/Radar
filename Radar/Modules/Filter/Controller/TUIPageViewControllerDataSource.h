//
//  TUIPageViewControllerDataSource.h
//  Radar
//
//  Created by Diego Lafuente on 22/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

/**
 Generic Page View Data Source
 */
@interface TUIPageViewControllerDataSource : NSObject <UIPageViewControllerDataSource>
{
    id<UIPageViewControllerDelegate> filterStatusDelegate;
}

/**
 The TUIPageViewControllerDataSource delegate
 */
@property(nonatomic, assign) id<UIPageViewControllerDelegate> filterStatusDelegate;

/**
 The view controllers of the data source
 */
@property (nonatomic, strong) NSArray *viewControllers;

@end
