//
//  tableUserViewController.h
//  csi_las2
//
//  Created by Supasit on 5/16/57 BE.
//  Copyright (c) 2557 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface tableUserViewController : UITableViewController<UITableViewDelegate,UITableViewDataSource>{
    NSArray *arrName;
    NSArray *JsonObj;
    NSMutableData *data;
    NSInteger reload;
}
@property (strong, nonatomic) IBOutletCollection (UITableViewCell) NSArray *tableCell;
@property (weak, nonatomic) IBOutlet UINavigationItem *title;



@end
