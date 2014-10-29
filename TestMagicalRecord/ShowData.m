//
//  UIViewController+ShowData.m
//  TestMagicalRecord
//
//  Created by 村上智紀 on 2014/10/28.
//  Copyright (c) 2014年 pad. All rights reserved.
//

#import "ShowData.h"

@implementation ShowData

- (void)viewDidLoad{
    [super viewDidLoad];
    
    _showDataTableView.delegate = self;
    _showDataTableView.dataSource = self;
    
    [self refreshData];
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
    Person *person = [_dataArray objectAtIndex:indexPath.row];
    cell.textLabel.text = person.name;
    
    
    return cell;
}

- (void)refreshData{
    [_dataArray removeAllObjects];
    NSArray *allRecords = [Person findAll];
    _dataArray = [allRecords mutableCopy];
    [_showDataTableView reloadData];
}

- (IBAction)reloadDataButton:(id)sender {
   
    
    [self refreshData];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        Person *deletePerson = _dataArray[indexPath.row];
        [deletePerson MR_deleteEntity];
        [self refreshData];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath: (NSIndexPath*) indexPath{
    _selectedIndexPath = indexPath;
    [self performSegueWithIdentifier:@"toDetailDataSegue" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"toDetailDataSegue"]) {
        EditDataViewController *vc = (EditDataViewController*)[segue destinationViewController];
        vc.detailPerson = _dataArray[_selectedIndexPath.row];
    }
}


@end
