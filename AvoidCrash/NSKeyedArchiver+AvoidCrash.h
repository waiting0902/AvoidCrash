//
//  NSKeyedArchiver+AvoidCrash.h
//  Vvic
//
//  Created by YUYE on 2022/4/20.
//  Copyright © 2022 vvic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AvoidCrashProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSKeyedArchiver (AvoidCrash)<AvoidCrashProtocol>

@end

NS_ASSUME_NONNULL_END
