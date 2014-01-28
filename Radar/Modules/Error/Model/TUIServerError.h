//
//  TUIServerError.h
//  Radar
//
//  Created by Diego Lafuente on 13/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIBaseModel.h"

/**
 The TUIServerError model represents a server error
 */
@interface TUIServerError : TUIBaseModel

/**
 The error title
 */
@property (nonatomic, copy) NSString *title;

/**
 The error code
 */
@property (nonatomic, copy) NSNumber *code;

/**
 The error message
 */
@property (nonatomic, copy) NSString *message;

@end
