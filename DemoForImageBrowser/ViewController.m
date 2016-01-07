//
//  ViewController.m
//  DemoForImageBrowser
//
//  Created by Silence on 16/1/6.
//  Copyright © 2016年 silence. All rights reserved.
//

#import "ViewController.h"
#import "XJImageBrowserController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray *dataList;
@end
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"ImageBrowser";
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    self.tableView.tableFooterView = [[UIView alloc] init];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
    cell.textLabel.textColor = [UIColor redColor];
    cell.textLabel.text = self.dataList[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    XJImageBrowserController *browser = [[XJImageBrowserController alloc] init];
    [self.navigationController pushViewController:browser animated:YES];
}

- (NSArray *)dataList {
    if (!_dataList) {
        _dataList = @[@"图片浏览器"];
    }
    return _dataList;
}
@end
