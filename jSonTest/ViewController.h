//
//  ViewController.h
//  jSonTest
//
//  Created by Supasit on 5/9/57 BE.
//  Copyright (c) 2557 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource > {
    NSArray *JsonObj;
    NSMutableData *data;
    IBOutlet UIPickerView *myPicker;
    NSArray *dataArray;
    }

@property (weak, nonatomic) IBOutlet UILabel *labName;
- (IBAction)sliName:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *lab_id;
@property (weak, nonatomic) IBOutlet UITextField *lab_name;
@property (weak, nonatomic) IBOutlet UITextField *lab_lastname;
@property (weak, nonatomic) IBOutlet UITextField *lab_pos;

- (IBAction)act_insert:(id)sender;

@end
