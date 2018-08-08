//
//  JWTCryptoSecurity+ErrorHandling.m
//  JWT
//
//  Created by Dmitry Lobanov on 08.08.2018.
//  Copyright © 2018 JWTIO. All rights reserved.
//

#import "JWTCryptoSecurity+ErrorHandling.h"

@implementation JWTCryptoSecurity (ErrorHandling)
+ (NSError *)securityErrorWithOSStatus:(OSStatus)status {
    // appropriate for Xcode 9 and higher.
    // rewrite it later?
    if (@available(iOS 11.3, *)) {
        NSString *message = (__bridge NSString *)SecCopyErrorMessageString(status, NULL) ?: @"Unknown error message";
        return [NSError errorWithDomain:NSOSStatusErrorDomain code:status userInfo:@{NSLocalizedDescriptionKey : message}];
    }
    else {
        // Fallback on earlier versions
        // unable to get message?
        return [NSError errorWithDomain:NSOSStatusErrorDomain code:status userInfo:nil];
    }
}
@end
