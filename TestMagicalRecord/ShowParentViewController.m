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
    
    NSLog(@"%@",[NSNumber numberWithInteger:20141030]);
    NSLog(@"%@", [[NSNumber numberWithInteger:20141030]stringValue]);
    
    _testSelect = true;
    
    [EatList MR_truncateAll];
    [Food MR_truncateAll];
    
    for (int i=0; i<3; i++) {
        EatList *testEatList = [EatList MR_createEntity];
        testEatList.ate_at = [NSNumber numberWithInteger:1030];
        testEatList.foods = [NSNumber numberWithInteger:i];
        for (int j = 0; j < 3; j++) {
            Food *testFood = [Food MR_createEntity];
            testFood.food_id = [NSNumber numberWithInteger:j];
            testFood.price = [NSNumber numberWithInteger:j];
            testFood.food_type = [NSNumber numberWithInteger:j];
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
    
    for (int i=4; i<6; i++) {
        EatList *testEatList = [EatList MR_createEntity];
        testEatList.ate_at = [NSNumber numberWithInteger:1101];
        testEatList.foods = [NSNumber numberWithInteger:i];
        for (int j = 4; j < 6; j++) {
            Food *testFood = [Food MR_createEntity];
            testFood.food_id = [NSNumber numberWithInteger:j];
            testFood.price = [NSNumber numberWithInteger:j];
            testFood.food_type = [NSNumber numberWithInteger:j];
            [testEatList addFoodObject:testFood];
        }
    }
    
    for (int i=6; i<9; i++) {
        EatList *testEatList = [EatList MR_createEntity];
        testEatList.ate_at = [NSNumber numberWithInteger:1102];
        testEatList.foods = [NSNumber numberWithInteger:i];
        for (int j = 6; j < 9; j++) {
            Food *testFood = [Food MR_createEntity];
            testFood.food_id = [NSNumber numberWithInteger:j];
            testFood.price = [NSNumber numberWithInteger:j];
            testFood.food_type = [NSNumber numberWithInteger:j];
            [testEatList addFoodObject:testFood];
        }
    }
    
    for (int i=9; i<12; i++) {
        EatList *testEatList = [EatList MR_createEntity];
        testEatList.ate_at = [NSNumber numberWithInteger:1103];
        testEatList.foods = [NSNumber numberWithInteger:i];
        for (int j = 9; j < 12; j++) {
            Food *testFood = [Food MR_createEntity];
            testFood.food_id = [NSNumber numberWithInteger:j];
            testFood.price = [NSNumber numberWithInteger:j];
            testFood.food_type = [NSNumber numberWithInteger:j];
            [testEatList addFoodObject:testFood];
        }
    }
    
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
    
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

- (IBAction)testButton:(id)sender {
    NSNumber *num;
    if (_testSelect) {
        num = @1030;
    }else{
        num = @1101;
    }
    
    _testSelect = !_testSelect;
    [_dataArray removeAllObjects];
    _dataArray = [[self findDataInWeek:[[NSNumber alloc] initWithInt:1101] weekEnd:[[NSNumber alloc] initWithInt:1102]] mutableCopy];

    [_parentTableView reloadData];
}

- (NSArray*)findDataInDay:(NSNumber*)day{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"ate_at == %@", day];
    return [EatList MR_findAllWithPredicate:predicate];
}

- (NSArray*)findDataInWeek:(NSNumber*)weekStart weekEnd:(NSNumber*)weekEnd{
    
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"ate_at BETWEEN %@", @[weekStart, weekEnd]];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(ate_at >= %@) AND (ate_at <= %@)",weekStart, weekEnd];
    NSArray *temp = [EatList MR_findAllSortedBy:@"foods" ascending:YES withPredicate:predicate];
    return temp;
}

- (NSDate*)getDateSZero:(NSDate*)date{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger flags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay;
    NSDateComponents *components = [calendar components:flags fromDate:date];
    
    return [calendar dateFromComponents:components];
}

- (double)convertUnixTimeFromDate:(NSDate *)date{
    double unixtime = [date timeIntervalSince1970];

    return unixtime;
}

- (NSDate *)convertDateFromUnixTime:(double)unixtime{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:unixtime];
    
    return date;
}

@end
