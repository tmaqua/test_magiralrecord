//
//  UIViewController+EditDataViewController.m
//  TestMagicalRecord
//
//  Created by 村上智紀 on 2014/10/28.
//  Copyright (c) 2014年 pad. All rights reserved.
//

#import "EditDataViewController.h"

@implementation EditDataViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    _nameTextField.text = _detailPerson.name;
    _ageTextField.text = [[NSString alloc] initWithFormat:@"%@",_detailPerson.age];
}


- (IBAction)editDataButton:(id)sender {
    if (_nameTextField.text.length > 0 && _ageTextField.text.length > 0) {
        _detailPerson.name = _nameTextField.text;
        _detailPerson.age = [NSNumber numberWithInteger:[_ageTextField.text integerValue]];
        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
    }else{
        NSLog(@"error");
    }
}
@end
