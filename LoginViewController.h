//
//  LoginViewController.h
//  csi_las1
//
//  Created by Supasit on 5/15/57 BE.
//  Copyright (c) 2557 Admin. All rights reserved.
//

#import "ViewController.h"

@interface LoginViewController : ViewController<UIPickerViewDelegate,UIPickerViewDataSource > {
    @public
    NSArray *JsonObj;
    IBOutlet UIPickerView *myPicker;
    NSArray *dataArray;
}

//@property (nonatomic,copy)

@end
