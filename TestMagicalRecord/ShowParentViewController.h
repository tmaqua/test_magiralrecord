//
//  UIViewController+ShowRelationViewController.h
//  TestMagicalRecord
//
//  Created by 村上智紀 on 2014/10/29.
//  Copyright (c) 2014年 pad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EatList.h"
#import "Food.h"
#import "ShowChildViewController.h"

@interface ShowParentViewContoller:UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *parentTableView;
@property (nonatomic) NSMutableArray *dataArray;
@property (nonatomic) NSIndexPath *selectedIndexPath;

- (IBAction)testButton:(id)sender;
@property (nonatomic) BOOL testSelect;

@end
