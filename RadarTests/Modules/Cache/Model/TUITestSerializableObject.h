//
//  TUITestSerializableObject.h
//  laterooms
//
//  Created by Diego Lafuente Garcia on 9/17/13.
//  Copyright (c) 2013 TUI Travel A&D. All rights reserved.
//

#import "TUIBaseModel.h"
#import "TUISerializable.h"

@interface TUITestSerializableObject : TUIBaseModel<TUISerializable>

@property (strong,nonatomic) NSString *property1;
@property (strong,nonatomic) NSString *property2;

@end
