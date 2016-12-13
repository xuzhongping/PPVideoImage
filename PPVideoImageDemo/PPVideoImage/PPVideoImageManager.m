//
//  PPVideoImageManager.m
//  
//
//  Created by xuzhongping on 2016/12/13.
//  Copyright © 2016年 JungHsu. All rights reserved.
//

#import "PPVideoImageManager.h"
#import "PPCacheUtil.h"
#import <AVFoundation/AVFoundation.h>

#define PPBLOCK @"ppBlock"
#define PPIMAGE @"ppImage"
#define PPURL   @"ppURL"
#define PPERROR @"ppERROR"

@implementation PPVideoImageManager

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

+ (instancetype)sharedManager
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


#pragma mark - public

- (void)pp_parseImagForVideoUrl:(NSURL *)url size:(CGSize)size completed:(completedBlock)complete{
    
    __weak typeof(self) weakSelf = self;
    if (!url){
        NSError *error = [NSError errorWithDomain:@"url is nil" code:0 userInfo:nil];
        complete(nil,nil,error);
        return;
    };
    
    if (![url isKindOfClass:[NSURL class]]) {
        NSError *error = [NSError errorWithDomain:@"url type error" code:0 userInfo:nil];
        complete(nil,nil,error);
        return;
    }
    
    
    NSString *urlStr = url.path;
    __block UIImage *targetImage;
    targetImage = [PPCacheUtil sharedCacheUtil].memoryCache[urlStr];
    
    if (targetImage) {
        complete(targetImage,url,nil);
        return;
    }
    
    targetImage = [[PPCacheUtil sharedCacheUtil] readDiskImage:url];
    if (targetImage) {
        
        complete(targetImage,url,nil);
        [[PPCacheUtil sharedCacheUtil].memoryCache setValue:targetImage forKey:urlStr];
        return;
    }
    
    NSBlockOperation *operation = [PPCacheUtil sharedCacheUtil].operations[urlStr];
    
    operation = [NSBlockOperation blockOperationWithBlock:^{

          targetImage = [[PPCacheUtil sharedCacheUtil] readDiskImage:url];
            if (targetImage) {
                complete(targetImage,url,nil);  // 如果图片已存在，请不要再次解析
            return ;
            }
            NSDictionary *opts = [NSDictionary dictionaryWithObject:[NSNumber numberWithBool:NO] forKey:AVURLAssetPreferPreciseDurationAndTimingKey];
            AVURLAsset *urlAsset = [AVURLAsset URLAssetWithURL:url options:opts];
            AVAssetImageGenerator *generator = [AVAssetImageGenerator assetImageGeneratorWithAsset:urlAsset];
            generator.appliesPreferredTrackTransform = YES;
            generator.maximumSize = CGSizeMake(size.width, size.height);
            NSError *error = nil;
             targetImage = [UIImage imageWithCGImage:[generator copyCGImageAtTime:CMTimeMake(0, 10) actualTime:NULL error:&error]];
        

        if (!error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf performSelector:@selector(dealImage:) withObject:@{PPBLOCK: complete,PPIMAGE:targetImage, PPURL:url} afterDelay:0.0 inModes:@[NSDefaultRunLoopMode]];
            });
            [[PPCacheUtil sharedCacheUtil].memoryCache setValue:targetImage forKey:urlStr];
            
            [[PPCacheUtil sharedCacheUtil] writeDiskCache:targetImage url:url];
        }else {
            complete(nil,url,error);
        }
        [[PPCacheUtil sharedCacheUtil].operations removeObjectForKey:urlStr];
    }];
    
    NSOperationQueue *asyncQueue = [[NSOperationQueue alloc]init];
    [asyncQueue addOperation:operation];
    [[PPCacheUtil sharedCacheUtil].operations setValue:operation forKey:urlStr];
    

}

- (void)dealImage:(id)info{
    completedBlock block = info[PPBLOCK];
          UIImage *image = info[PPIMAGE];
             NSURL * url = info[PPURL];
    block(image,url,nil);
}


@end
