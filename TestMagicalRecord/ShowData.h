//
//  UIViewController+ShowData.h
//  TestMagicalRecord
//
//  Created by 村上智紀 on 2014/10/28.
//  Copyright (c) 2014年 pad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"
#import "EditDataViewController.h"

@interface ShowData:UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *showDataTableView;
@property (nonatomic) NSMutableArray *dataArray;
@property (nonatomic) NSIndexPath *selectedIndexPath;
- (IBAction)reloadDataButton:(id)sender;

@end
