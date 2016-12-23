//
//  UIImageView+VideoCache.h
//  
//
//  Created by xuzhongping on 2016/12/13.
//  Copyright © 2016年 JungHsu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (VideoCache)

- (void)pp_setImageWithVideoURL:(NSURL *)url;
- (void)pp_setImageWithVideoURL:(NSURL *)url placeholderImage:(UIImage *)placeholder;
- (void)pp_setImageWithVideoURL:(NSURL *)url placeholderImage:(UIImage *)placeholder cornerRadius:(CGFloat)cornerRadius;
@end

@interface UIButton (VideoCache)
- (void)pp_setImageWithVideoURL:(NSURL *)url forState:(UIControlState)state;
- (void)pp_setImageWithVideoURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder;
- (void)pp_setImageWithVideoURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder cornerRadius:(CGFloat)cornerRadius;

- (void)pp_setBackgroundImageWithVideoURL:(NSURL *)url forState:(UIControlState)state;
- (void)pp_setBackgroundImageWithVideoURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder;
- (void)pp_setBackgroundImageWithVideoURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder cornerRadius:(CGFloat)cornerRadius;
@end
