//
//  UIViewController+AddDataViewController.m
//  TestMagicalRecord
//
//  Created by 村上智紀 on 2014/10/28.
//  Copyright (c) 2014年 pad. All rights reserved.
//

#import "AddDataViewController.h"

@implementation AddDataViewController

- (IBAction)addDataButton:(id)sender {
    if (_nameTextField.text.length > 0 && _ageTextField.text.length > 0) {
//        Person *newPerson = [Person MR_createEntity];
//        newPerson.name = _nameTextField.text;
//        newPerson.age = [NSNumber numberWithInteger:[_ageTextField.text integerValue]];
        [Person createPerson:_nameTextField.text age:[NSNumber numberWithInteger:[_ageTextField.text integerValue]]];
        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
    }else{
        NSLog(@"error");
    }
}
@end
