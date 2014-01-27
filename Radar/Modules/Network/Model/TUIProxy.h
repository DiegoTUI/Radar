//
//  TUIProxy.h
//  Radar
//
//  Created by Diego Lafuente on 22/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//


/**
 The TUIProxy protocol defines methods for all proxy models
 */
@protocol TUIProxy <NSObject>

@required
/**
 @methodName cancelNetworkRequests
 @abstract Cancels all requests relevant for this proxy
 @discussion Clsses implementing this protocol should implement this protocol to cancel any and all request made by the proxy
 */
+ (void)cancelNetworkRequests;

@end
