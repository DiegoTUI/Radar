//
//  TUIBookingFormViewDataSource.h
//  Radar
//
//  Created by jmartin on 28/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TUIBookingFormViewDataSource : NSObject <UITableViewDataSource>

- (instancetype)initWithArray:(NSArray *)array;

@end
