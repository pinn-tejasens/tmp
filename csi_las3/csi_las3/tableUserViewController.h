//
//  tableUserViewController.h
//  csi_las3
//
//  Created by Supasit on 5/16/57 BE.
//  Copyright (c) 2557 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface tableUserViewController : UITableViewController{
    NSMutableArray * arr;
    UIColor *c1;
    UIColor *c2;

}
@property (strong,nonatomic) NSArray *arrUserDataTable;
@property (strong,nonatomic) NSString *strData;


@end
