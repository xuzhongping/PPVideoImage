# PPVideoImage
* 快速设置视频第一帧图片为ImageView的图片，支持传入一个视频URL，使用方式和SDWebImage类似
* 支持磁盘缓存与内存缓存
* 支持设置图片圆角

#### 使用如下: 

```
    [cell.imageViewOne pp_setImageWithVideoURL:[NSURL URLWithString:@"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"] placeholderImage:[UIImage imageNamed:@"no_picture"] cornerRadius:80.0];

 ```
 
 
 ![Aaron Swartz](https://github.com/JungHsu/PPVideoImage/blob/master/videodemo.gif)


> 第一次进入时加载出的图片会有混合图层，以后打开就没有这种情况，如果你有好的解决方案请使劲提lssues或者Pull request 
> 希望能得到大家的反馈和建议 
> QQ:1021057927