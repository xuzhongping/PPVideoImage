//
//  ViewController.m
//  PPVideoImageDemo
//
//  Created by 徐仲平 on 2016/12/13.
//  Copyright © 2016年 徐仲平. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+VideoCache.h"

@interface ViewController ()<UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *array;
@end

@implementation ViewController

static NSString *ID = @"ID";
- (NSMutableArray *)array{
    if (!_array) {
        _array = @[].mutableCopy;
    }
    return _array;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    
    for (NSInteger i = 0; i < 100; i++ ) {
        [self.array addObject:@(i)];
        
    }
    
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        
    }
    [cell.imageView pp_setImageWithVideoURL:[NSURL URLWithString:@"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"] placeholderImage:[UIImage imageNamed:@"no_picture"]];
    
    cell.textLabel.text = [NSString stringWithFormat:@"第 %@ 行",self.array[indexPath.row]];
    return cell;
}
@end
