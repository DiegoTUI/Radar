//
//  NSError+TUIErrorSpec.m
//  Radar
//
//  Created by Diego Lafuente on 22/01/14.
//  Copyright (c) 2014 Tui Travel A&D. All rights reserved.
//

#import "Kiwi.h"
#import "NSError+TUIError.h"

SPEC_BEGIN(NSError_TUIErrorSpec)

describe(@"NSError+TUIError", ^{
    
    __block NSArray *errorCodes;
    __block NSString *localizedMessage;
    __block NSString *localizedTitle;
    __block TUIErrorCode expectedErrorCode;
    
    describe(@"When creating generic errors", ^{
        
        beforeAll(^{
            expectedErrorCode = TUIErrorCodeGeneric;
            errorCodes = @[@(65673257), @(67573625)];
            localizedMessage = @"ERROR_GENERIC";
            localizedTitle = [localizedMessage stringByAppendingString:@"_TITLE"];
        });
        
        it(@"Should create the right error", ^{
            for (NSNumber *code in errorCodes)
            {
                NSError *error = [NSError errorWithCode:[code integerValue]];
                [[theValue(error.code) should] equal:theValue(expectedErrorCode)];
                [[error.userInfo[NSLocalizedDescriptionKey] should] equal:NSLocalizedString(localizedTitle, nil)];
                [[error.userInfo[NSLocalizedFailureReasonErrorKey] should] equal:NSLocalizedString(localizedMessage, nil)];
            }
        });
    });
    
    describe(@"When creating no connection errors", ^{
        
        beforeAll(^{
            expectedErrorCode = TUIErrorCodeNoConnection;
            errorCodes =@[@(NETWORK_NO_CONNECTION_ERROR_CODE)];
            localizedMessage = @"ERROR_NO_CONNECTION";
            localizedTitle = [localizedMessage stringByAppendingString:@"_TITLE"];
        });
        
        it(@"Should create the right error", ^{
            for (NSNumber *code in errorCodes)
            {
                NSError *error = [NSError errorWithCode:[code integerValue]];
                [[theValue(error.code) should] equal:theValue(expectedErrorCode)];
                [[error.userInfo[NSLocalizedDescriptionKey] should] equal:NSLocalizedString(localizedTitle, nil)];
                [[error.userInfo[NSLocalizedFailureReasonErrorKey] should] equal:NSLocalizedString(localizedMessage, nil)];
            }
        });
    });
    
    describe(@"When creating timeout errors", ^{
        
        beforeAll(^{
            expectedErrorCode = TUIErrorCodeTimeout;
            errorCodes =@[@(NETWORK_TIMEOUT_ERROR_CODE)];
            localizedMessage = @"ERROR_TIMEOUT";
            localizedTitle = [localizedMessage stringByAppendingString:@"_TITLE"];
        });
        
        it(@"Should create the right error", ^{
            for (NSNumber *code in errorCodes)
            {
                NSError *error = [NSError errorWithCode:[code integerValue]];
                [[theValue(error.code) should] equal:theValue(expectedErrorCode)];
                [[error.userInfo[NSLocalizedDescriptionKey] should] equal:NSLocalizedString(localizedTitle, nil)];
                [[error.userInfo[NSLocalizedFailureReasonErrorKey] should] equal:NSLocalizedString(localizedMessage, nil)];
            }
        });
    });
});

SPEC_END