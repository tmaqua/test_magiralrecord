//
//  UIViewController+EditDataViewController.h
//  TestMagicalRecord
//
//  Created by 村上智紀 on 2014/10/28.
//  Copyright (c) 2014年 pad. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@interface EditDataViewController:UIViewController

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *ageTextField;
- (IBAction)editDataButton:(id)sender;

@property (nonatomic) Person *detailPerson;

@end
