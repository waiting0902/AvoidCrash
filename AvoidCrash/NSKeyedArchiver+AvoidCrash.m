//
//  NSKeyedArchiver+AvoidCrash.m
//  Vvic
//
//  Created by YUYE on 2022/4/20.
//  Copyright © 2022 vvic. All rights reserved.
//

#import "NSKeyedArchiver+AvoidCrash.h"

#import "AvoidCrash.h"

@implementation NSKeyedArchiver (AvoidCrash)

+ (void)avoidCrashExchangeMethod {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [AvoidCrash exchangeClassMethod:self method1Sel:@selector(archivedDataWithRootObject:) method2Sel:@selector(avoidCrashArchivedDataWithRootObject:)];
    });
}

//=================================================================
//                           archivedDataWithRootObject:
//=================================================================
#pragma mark - archivedDataWithRootObject:

+ (nullable id)avoidCrashArchivedDataWithRootObject:(NSData *)rootObject {
    id object = nil;
    @try {
        object = [self avoidCrashArchivedDataWithRootObject:rootObject];
    }
    @catch (NSException *exception) {
        [AvoidCrash noteErrorWithException:exception defaultToDo:AvoidCrashDefaultReturnNil];
    }
    @finally {
        return object;
    }
}

@end
