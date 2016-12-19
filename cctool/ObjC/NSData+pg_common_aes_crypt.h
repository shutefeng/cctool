//
//  NSData+AESCrypt.h
//  pg_sdk_common
//
//  Created by Cc on 14-10-15.
//  Copyright (c) 2014年 PinguoSDK. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (pg_common_aes_crypt)

/* 256加密 */
- (nullable NSData *)c_common_Encrypt256WithPassword:(NSString *)password;
- (nullable NSData *)c_common_Decrypt256WithPassword:(NSString *)password;

/* 128加密 */
- (nullable NSData *)c_common_Encrypt128WithPassword:(NSString*)password;
- (nullable NSData *)c_common_Decrypt128WithPassword:(NSString*)password;

@end

NS_ASSUME_NONNULL_END
