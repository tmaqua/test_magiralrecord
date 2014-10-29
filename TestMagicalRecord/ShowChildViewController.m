//
//  UIViewController+ShowChildViewController.m
//  TestMagicalRecord
//
//  Created by 村上智紀 on 2014/10/29.
//  Copyright (c) 2014年 pad. All rights reserved.
//

#import "ShowChildViewController.h"

@implementation ShowChildViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    _childTableView.delegate = self;
    _childTableView.dataSource = self;
    
    NSSet *foods = _detailList.food;
    NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"food_id" ascending:YES];
    NSArray *sortDescriptor = [NSArray arrayWithObject:sort];
    _dataArray = [[foods sortedArrayUsingDescriptors:sortDescriptor]mutableCopy];
    
//    _dataArray = [[_detailList.food allObjects]mutableCopy];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    Food *food = _dataArray[indexPath.row];
    
    NSString *id_str = [@"id:" stringByAppendingString:[food.food_id stringValue]];
    NSString *price_str = [@"   price:" stringByAppendingString:[food.price stringValue]];
    NSString *type_str = [@"   type:" stringByAppendingString:[food.food_type stringValue]];
    
    cell.textLabel.text = [[id_str stringByAppendingString:price_str] stringByAppendingString:type_str];
    
    return cell;
}

@end
