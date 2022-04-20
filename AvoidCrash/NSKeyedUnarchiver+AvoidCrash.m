//
//  NSKeyedUnarchiver+AvoidCrash.m
//  AvoidCrashDemo
//
//  Created by YUYE on 2022/4/20.
//  Copyright © 2022 chenfanfang. All rights reserved.
//

#import "NSKeyedUnarchiver+AvoidCrash.h"
#import "AvoidCrash.h"

@implementation NSKeyedUnarchiver (AvoidCrash)
+ (void)avoidCrashExchangeMethod {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [AvoidCrash exchangeClassMethod:[self class] method1Sel:@selector(unarchiveObjectWithFile:) method2Sel:@selector(avoidCrashUnarchiveObjectWithFile:)];
        [AvoidCrash exchangeClassMethod:[self class] method1Sel:@selector(unarchiveObjectWithData:) method2Sel:@selector(avoidCrashUnarchiveObjectWithData:)];
    });
}

//=================================================================
//                           unarchiveObjectWithFile:
//=================================================================
#pragma mark - unarchiveObjectWithFile:

+ (nullable id)avoidCrashUnarchiveObjectWithFile:(NSString *)path {
    id object = nil;
    @try {
        object = [self avoidCrashUnarchiveObjectWithFile:path];
    }
    @catch (NSException *exception) {
        [AvoidCrash noteErrorWithException:exception defaultToDo:AvoidCrashDefaultReturnNil];
    }
    @finally {
        return object;
    }
}

//=================================================================
//                           unarchiveObjectWithData:
//=================================================================
#pragma mark - unarchiveObjectWithData:

+ (nullable id)avoidCrashUnarchiveObjectWithData:(NSData *)data {
    id object = nil;
    @try {
        object = [self avoidCrashUnarchiveObjectWithData:data];
    }
    @catch (NSException *exception) {
        [AvoidCrash noteErrorWithException:exception defaultToDo:AvoidCrashDefaultReturnNil];
    }
    @finally {
        return object;
    }
}
@end
