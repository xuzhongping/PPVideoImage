//
//  ViewController.m
//  PPVideoImageDemo
//
//  Created by 徐仲平 on 2016/12/13.
//  Copyright © 2016年 徐仲平. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+VideoCache.h"
#import "PPTableViewCell.h"


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

    
    [self.tableView registerNib:[UINib nibWithNibName:@"PPTableViewCell" bundle:nil] forCellReuseIdentifier:ID];
    self.tableView.rowHeight = 60;
    for (NSInteger i = 0; i < 100; i++ ) {
        [self.array addObject:@(i)];
        
    }
    
//   self.navigationController.navigationBar.subviews.firstObject.subviews.firstObject.hidden = YES;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PPTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    

    [cell.imageView pp_setImageWithVideoURL:[NSURL URLWithString:@"http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"] placeholderImage:[UIImage imageNamed:@"no_picture"]];


    return cell;
}
@end
