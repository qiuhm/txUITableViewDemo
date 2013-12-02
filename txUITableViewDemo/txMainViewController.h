//
//  txMainViewController.h
//  txUITableViewDemo
//
//  Created by tingxuan.qhm on 13-12-2.
//  Copyright (c) 2013年 tingxuan.qhm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface txMainViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) NSArray * dataArray;
@property(nonatomic,strong) UITableView * tableView;

@end
