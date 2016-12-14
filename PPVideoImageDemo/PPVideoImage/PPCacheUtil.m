//
//  PPCacheUtil.m
//  
//
//  Created by xuzhongping on 2016/12/13.
//  Copyright © 2016年 JungHsu. All rights reserved.
//

#import "PPCacheUtil.h"
#import<CommonCrypto/CommonDigest.h>

@implementation PPCacheUtil

#pragma mark - 单例
static id _instance;
+ (id)allocWithZone:(struct _NSZone *)zone 
{ 
    static dispatch_once_t onceToken; 
    dispatch_once(&onceToken, ^{ 
        _instance = [super allocWithZone:zone];
    }); 
    return _instance; 
} 

+ (instancetype)sharedCacheUtil
{ 
    static dispatch_once_t onceToken; 
    dispatch_once(&onceToken, ^{ 
        _instance = [[self alloc] init]; 
    }); 
    return _instance; 
} 

- (id)copyWithZone:(NSZone *)zone 
{ 
    return _instance; 
}

- (instancetype)init{
    if (self = [super init]) {
        __weak typeof(self) weakSelf = self;
        [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationDidReceiveMemoryWarningNotification object:nil queue:[[NSOperationQueue alloc]init] usingBlock:^(NSNotification * _Nonnull note) {
            [weakSelf cleanDiskCacheCompleted:nil];
        }];
    }
    return self;
}


#pragma mark - lazy

- (NSMutableDictionary *)memoryCache{
    if (!_memoryCache) {
        _memoryCache = @{}.mutableCopy;
    }
    return _memoryCache;
}


- (NSMutableDictionary *)operations{
    if (!_operations) {
        _operations = @{}.mutableCopy;
    }
    return _operations;
}

- (void)writeDiskCache:(UIImage *)diskImage url:(NSURL *)url{
    
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        if (![[NSFileManager defaultManager] fileExistsAtPath:PPIMAGECACHE]) {
            [[NSFileManager defaultManager] createDirectoryAtPath:PPIMAGECACHE withIntermediateDirectories:YES attributes:nil error:nil];
        }
        NSString *path;
        NSRange range = [url.path rangeOfString:@"."];
        path = [[self md5:[url.path substringToIndex:range.location]] stringByAppendingString:@".png"];
        path = [PPIMAGECACHE stringByAppendingPathComponent:path];
        NSData *resultData = [self zipImage:diskImage];
        [resultData writeToFile:path atomically:YES];
    });
}
- (UIImage *)readDiskImage:(NSURL *)url{
    NSString *path;
    NSRange range = [url.path rangeOfString:@"."];
    path = [[self md5:[url.path substringToIndex:range.location]] stringByAppendingString:@".png"];
    path = [PPIMAGECACHE stringByAppendingPathComponent:path];
   return [UIImage imageWithContentsOfFile:path];
}


- (NSString *) md5:(NSString *) input {
    const char *cStr = [input UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, strlen(cStr), digest );
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return output;
}

- (void)cleanDiskCacheCompleted:(void (^)(NSError *error))complete{
   __block NSError *error;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [[NSFileManager defaultManager] removeItemAtPath:PPIMAGECACHE error:&error];
        complete(error);
    });
}

#pragma mark - private

- (NSData *)zipImage:(UIImage *)image{
    CGSize originalSize = image.size;
    NSData *data = nil;
    if (originalSize.width >= 500.0) {
        data = UIImageJPEGRepresentation(image, 0.2);
    }else
    if ( 500.0 > originalSize.width >= 300.0){
        data = UIImageJPEGRepresentation(image, 0.3);
    }else
    if (300.0 > originalSize.width >= 100.0) {
        data = UIImageJPEGRepresentation(image, 0.4);
    }else
    if (100.0 > originalSize.width) {
        data = UIImageJPEGRepresentation(image, 0.5);
    }
    
    return data;
}



@end
