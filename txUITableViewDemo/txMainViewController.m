//
//  txMainViewController.m
//  txUITableViewDemo
//
//  Created by tingxuan.qhm on 13-12-2.
//  Copyright (c) 2013年 tingxuan.qhm. All rights reserved.
//

#import "txMainViewController.h"

@interface txMainViewController ()


@end

@implementation txMainViewController
@synthesize dataArray;
@synthesize tableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.dataArray = [NSArray arrayWithObjects:@"one",@"two",@"three",@"four", nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 40, 320, 460) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    self.tableView.separatorColor = [UIColor redColor];
    self.tableView.backgroundColor = [UIColor orangeColor];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"txTableCell"];
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableViewDelegate

//设置tableView的tableViewCell的高度
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 40.0f;
}

//设置每个section的header的高度
- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50.0f;
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 50.0f;
}

- (void) tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIAlertView *alertViewSelect = [[UIAlertView alloc]initWithTitle:[NSString stringWithFormat:@"您已选中了%d行",indexPath.row] message:@"您已选中了" delegate:nil cancelButtonTitle:@"取消选中" otherButtonTitles:@"确认选中", nil];
    [alertViewSelect show];
}

#pragma mark UITableViewDataSource

//必须实现的3个dataSource方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

//- (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return self.dataArray.count;
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"txTableCell";
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    
    // Configure the cell...
    
    cell.textLabel.text = [self.dataArray objectAtIndex:indexPath.row];
    
    
    return cell;
}

//optional
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"婷萱的tableView demo 的section头部标题";
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return @"婷萱的tableView demo 的section底部标题";
}


- (void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        UIAlertView * cellAlertViewDel = [[UIAlertView alloc]initWithTitle:[NSString stringWithFormat:@"删除tableViewCell"] message:@"确定要删除该行数据吗？" delegate:nil cancelButtonTitle:@"放弃更改" otherButtonTitles:@"确认", nil];
        [cellAlertViewDel show];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert)
    {
        UIAlertView * cellAlertViewInsert = [[UIAlertView alloc]initWithTitle:[NSString stringWithFormat:@"插入tableViewCell"] message:@"确定要插入数据吗？" delegate:nil cancelButtonTitle:@"放弃插入" otherButtonTitles:@"确认", nil];
        [cellAlertViewInsert show];

    }
}

@end
