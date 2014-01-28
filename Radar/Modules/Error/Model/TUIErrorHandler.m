//
//  TUIErrorHandler.m
//  Radar
//
//  Created by Diego Lafuente on 22/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "TUIErrorHandler.h"

/**
 Class Extension
 */
@interface TUIErrorHandler () <UIAlertViewDelegate>

/**
 The error being handled
 */
@property (nonatomic, strong) NSError *error;

/**
 The completion block to call when finished
 */
@property (nonatomic, copy) void(^completionBlock)(NSError *handledError);

@end


@implementation TUIErrorHandler


#pragma mark - Singleton

+ (TUIErrorHandler *)sharedInstance
{
    static TUIErrorHandler *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[TUIErrorHandler alloc] init];
    });
    return sharedInstance;
}


#pragma mark - Error handling

- (void)handleError:(NSError *)error
         completion:(void(^)(NSError *handledError))completion
{
    self.completionBlock = completion;
    self.error = error;
    [UIAlertView showWithError:error delegate:self];
}


#pragma mark - UIAlertView delegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (self.completionBlock)
    {
        self.completionBlock(self.error);
    }
}

@end
