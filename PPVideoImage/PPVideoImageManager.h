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

- (void)pp_parseImagForVideoUrl:(NSURL *)url size:(CGSize)size completed:(completedBlock)complete;
- (void)pp_parseImagForVideoUrl:(NSURL *)url size:(CGSize)size cornerRadius:(CGFloat)cornerRadius completed:(completedBlock)complete;

- (UIImage *)disposeCircularImage:(UIImage *)image size:(CGSize)size cornerRadius:(CGFloat)cornerRadius;
@end
