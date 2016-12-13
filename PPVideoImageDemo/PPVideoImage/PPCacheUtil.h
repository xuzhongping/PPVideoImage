//
//  PPCacheUtil.h
//  
//
//  Created by xuzhongping on 2016/12/13.
//  Copyright © 2016年 JungHsu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PPCacheUtil : NSObject
#define PPIMAGECACHE [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:@"PPImageCache"]

+ (instancetype)sharedCacheUtil;


@property (nonatomic,strong)NSMutableDictionary *memoryCache;

@property (nonatomic,strong)NSMutableDictionary *operations;


- (UIImage *)readDiskImage:(NSURL *)url;
/** write to disk */
- (void)writeDiskCache:(UIImage *)diskImage url:(NSURL *)url;

@end
