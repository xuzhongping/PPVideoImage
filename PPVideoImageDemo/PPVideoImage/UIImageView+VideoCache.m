//
//  UIImageView+VideoCache.m
//  
//
//  Created by xuzhongping on 2016/12/13.
//  Copyright © 2016年 JungHsu. All rights reserved.
//

#import "UIImageView+VideoCache.h"
#import "PPVideoImageManager.h"

@implementation UIImageView (VideoCache)


- (void)pp_setImageWithVideoURL:(NSURL *)url{
    [self pp_setImageWithVideoURL:url placeholderImage:nil];
}
- (void)pp_setImageWithVideoURL:(NSURL *)url placeholderImage:(UIImage *)placeholder{
    if (placeholder && [placeholder isKindOfClass:[UIImage class]]) {
        self.image = placeholder;
    }
    
    [[PPVideoImageManager sharedManager] pp_parseImagForVideoUrl:url size:self.bounds.size completed:^(UIImage *image, NSURL *url, NSError *error) {
        if (error || ![image isKindOfClass:[UIImage class]]) return ;
        self.image = image;
    }];

    
}

@end

@implementation UIButton (VideoCache)

- (void)pp_setImageWithVideoURL:(NSURL *)url forState:(UIControlState)state{
    [self pp_setImageWithVideoURL:url forState:state placeholderImage:nil];
}

- (void)pp_setImageWithVideoURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder{
    if (placeholder && [placeholder isKindOfClass:[UIImage class]]) {
        [self setImage:placeholder forState:state];
    }
    
    [[PPVideoImageManager sharedManager] pp_parseImagForVideoUrl:url size:self.imageView.bounds.size completed:^(UIImage *image, NSURL *url, NSError *error) {
        if (error || ![image isKindOfClass:[UIImage class]]) return ;
        [self setImage:image forState:state];
    }];
}

- (void)pp_setBackgroundImageWithVideoURL:(NSURL *)url forState:(UIControlState)state{
    [self pp_setBackgroundImageWithVideoURL:url forState:state placeholderImage:nil];
}

- (void)pp_setBackgroundImageWithVideoURL:(NSURL *)url forState:(UIControlState)state placeholderImage:(UIImage *)placeholder{
    if (placeholder && [placeholder isKindOfClass:[UIImage class]]) {
        [self setBackgroundImage:placeholder forState:state];
    }
    [[PPVideoImageManager sharedManager] pp_parseImagForVideoUrl:url size:self.imageView.bounds.size completed:^(UIImage *image, NSURL *url, NSError *error) {
        if (error || ![image isKindOfClass:[UIImage class]]) return ;
        [self setBackgroundImage:image forState:state];
    }];
}



@end
