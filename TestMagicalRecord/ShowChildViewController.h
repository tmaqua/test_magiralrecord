//
//  UIViewController+ShowChildViewController.h
//  TestMagicalRecord
//
//  Created by 村上智紀 on 2014/10/29.
//  Copyright (c) 2014年 pad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EatList.h"
#import "Food.h"

@interface ShowChildViewController:UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *childTableView;
@property (nonatomic) NSMutableArray *dataArray;
@property (nonatomic) EatList *detailList;

@end
