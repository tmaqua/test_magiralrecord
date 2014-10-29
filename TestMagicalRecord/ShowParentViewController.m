//
//  UIViewController+ShowRelationViewController.m
//  TestMagicalRecord
//
//  Created by 村上智紀 on 2014/10/29.
//  Copyright (c) 2014年 pad. All rights reserved.
//

#import "ShowParentViewController.h"

@implementation ShowParentViewContoller

- (void)viewDidLoad{
    [super viewDidLoad];
    
    _parentTableView.delegate = self;
    _parentTableView.dataSource = self;
    
    [EatList MR_truncateAll];
    [Food MR_truncateAll];
    
    for (int i=0; i<3; i++) {
        EatList *testEatList = [EatList MR_createEntity];
        testEatList.ate_at = [NSNumber numberWithInteger:100+i];
        testEatList.foods = [NSNumber numberWithInteger:i];
        for (int j = 0; j < 3; j++) {
            Food *testFood = [Food MR_createEntity];
            testFood.food_id = [NSNumber numberWithInteger:j+i];
            testFood.price = [NSNumber numberWithInteger:(j+i)*10];
            testFood.food_type = [NSNumber numberWithInteger:j+i+15];
            [testEatList addFoodObject:testFood];
        }
    }
    
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
//    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:^(BOOL success, NSError *error) {
//        if (success) {
//            NSLog(@"You successfully saved your context.");
//        } else if (error) {
//            NSLog(@"Error saving context: %@", error.description);
//        }
//    }];
    
    [self refreshData];
    
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

- (void)refreshData{
    [_dataArray removeAllObjects];
    NSArray *allRecords = [EatList MR_findAllSortedBy:@"foods" ascending:YES];
    _dataArray = [allRecords mutableCopy];
    [_parentTableView reloadData];
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
    
    EatList *list = [_dataArray objectAtIndex:indexPath.row];
    NSString *foods_str = [@"foods:" stringByAppendingString:[list.foods stringValue]];
    NSString *ate_str = [@"   ate_at: " stringByAppendingString:[list.ate_at stringValue]];
    cell.textLabel.text = [foods_str stringByAppendingString:ate_str];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath: (NSIndexPath*) indexPath{
    _selectedIndexPath = indexPath;
    [self performSegueWithIdentifier:@"toChildSegue" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"toChildSegue"]) {
        ShowChildViewController *vc = (ShowChildViewController*)[segue destinationViewController];
        vc.detailList = _dataArray[_selectedIndexPath.row];
    }
}

@end
