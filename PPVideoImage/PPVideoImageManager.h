//
//  PPVideoImageManager.h
//  
//
//  Created by xuzhongping on 2016/12/13.
//  Copyright © 2016年 JungHsu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^completedBlock)(UIImage *image,NSURL *url,NSError *error);

@interface PPVideoImageManager : NSObject

+ (instancetype)sharedManager;

/** 通过一个VideoURL获取第一帧图片 */
- (void)pp_parseImagForVideoUrl:(NSURL *)url size:(CGSize)size completed:(completedBlock)complete;

@end
