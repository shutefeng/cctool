//
//  NSData+AESCrypt.m
//  pg_sdk_common
//
//  Created by Cc on 14-10-15.
//  Copyright (c) 2014年 PinguoSDK. All rights reserved.
//

#import "NSData+pg_common_aes_crypt.h"
#import <CommonCrypto/CommonCryptor.h>

@implementation NSData (pg_common_aes_crypt)

- (NSData *)c_common_Encrypt256WithPassword:(NSString *)password
{
    NSData *encryptedData = nil;
    
    if ([password isKindOfClass:[NSString class]]) {
        
        NSData *sourceData = self;
        char keyPtr[kCCKeySizeAES256+1];
        bzero(keyPtr, sizeof(keyPtr));
        [password getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
        NSUInteger dataLength = [sourceData length];
        size_t bufferSize = dataLength + kCCKeySizeAES256;
        void *buffer = malloc(bufferSize);
        size_t numBytesEncrypted = 0;
        CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt,
                                              kCCAlgorithmAES128,
                                              kCCOptionPKCS7Padding,
                                              keyPtr,
                                              kCCKeySizeAES256,
                                              NULL,
                                              [sourceData bytes],
                                              dataLength,
                                              buffer,
                                              bufferSize,
                                              &numBytesEncrypted);
        if (cryptStatus == kCCSuccess) {
            
            encryptedData = [[NSData alloc] initWithBytes:buffer length:numBytesEncrypted];
        }
        else {
            
            NSLog(@"CCCrypt return NO");
        }
        
        free(buffer);
    }
    else {
        
        NSLog(@"[password isKindOfClass:[NSString class]]    return NO");
    }
    
    return encryptedData;
}

- (NSData *)c_common_Decrypt256WithPassword:(NSString *)password
{
    NSData *decryptedData = nil;
    if ([password isKindOfClass:[NSString class]]) {
     
        NSData *sourceData = self;
        char keyPtr[kCCKeySizeAES256+1];
        bzero(keyPtr, sizeof(keyPtr));
        [password getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
        NSUInteger dataLength = [sourceData length];
        size_t bufferSize = dataLength + kCCKeySizeAES256;
        void *buffer = malloc(bufferSize);
        size_t numBytesDecrypted = 0;
        CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
                                              kCCAlgorithmAES128,
                                              kCCOptionPKCS7Padding,
                                              keyPtr,
                                              kCCKeySizeAES256,
                                              NULL,
                                              [sourceData bytes],
                                              dataLength,
                                              buffer,
                                              bufferSize,
                                              &numBytesDecrypted);
        if (cryptStatus == kCCSuccess) {
            
            decryptedData = [[NSData alloc] initWithBytes:buffer length:numBytesDecrypted];
        }
        else {
            
            NSLog(@"CCCrypt return NO");
        }
        
        free(buffer);
    }
    else {
        
        NSLog(@"[password isKindOfClass:[NSString class]]    return NO");
    }
    
    return decryptedData;
}

- (NSData *)c_common_Encrypt128WithPassword:(NSString *)password
{
    NSData *encryptedData = nil;
    
    if ([password isKindOfClass:[NSString class]]) {
        
        NSData *sourceData = self;
        char keyPtr[kCCKeySizeAES256+1];
        bzero(keyPtr, sizeof(keyPtr));
        [password getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
        NSUInteger dataLength = [sourceData length];
        size_t bufferSize = dataLength + kCCKeySizeAES128;
        void *buffer = malloc(bufferSize);
        size_t numBytesEncrypted = 0;
        CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt,
                                              kCCAlgorithmAES128,
                                              kCCOptionPKCS7Padding,
                                              keyPtr,
                                              kCCKeySizeAES128,
                                              NULL,
                                              [sourceData bytes],
                                              dataLength,
                                              buffer,
                                              bufferSize,
                                              &numBytesEncrypted);
        if (cryptStatus == kCCSuccess) {
            
            encryptedData = [[NSData alloc] initWithBytes:buffer length:numBytesEncrypted];
        }
        else {
            
            NSLog(@"CCCrypt return NO");
        }
        
        free(buffer);
    }
    else {
        
        NSLog(@"[password isKindOfClass:[NSString class]]    return NO");
    }
    
    return encryptedData;
}

- (NSData *)c_common_Decrypt128WithPassword:(NSString *)password
{
    NSData *decryptedData = nil;
    
    if ([password isKindOfClass:[NSString class]]) {
        
        NSData *sourceData = self;
        char keyPtr[kCCKeySizeAES256+1];
        bzero(keyPtr, sizeof(keyPtr));
        [password getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
        NSUInteger dataLength = [sourceData length];
        size_t bufferSize = dataLength + kCCKeySizeAES128;
        void *buffer = malloc(bufferSize);
        size_t numBytesDecrypted = 0;
        CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
                                              kCCAlgorithmAES128,
                                              kCCOptionPKCS7Padding,
                                              keyPtr,
                                              kCCKeySizeAES128,
                                              NULL,
                                              [sourceData bytes],
                                              dataLength,
                                              buffer,
                                              bufferSize,
                                              &numBytesDecrypted);
        if (cryptStatus == kCCSuccess) {
            
            decryptedData = [[NSData alloc] initWithBytes:buffer length:numBytesDecrypted];
        }
        else {
            
            NSLog(@"CCCrypt return NO");
        }
        
        free(buffer);
    }
    else {
        
        NSLog(@"[password isKindOfClass:[NSString class]]    return NO");
    }
    
    return decryptedData;
}

@end
