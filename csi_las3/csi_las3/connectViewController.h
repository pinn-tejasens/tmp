//
//  connectViewController.h
//  csi_las3
//
//  Created by Supasit on 5/22/57 BE.
//  Copyright (c) 2557 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface connectViewController : UIViewController{
    NSArray *arrObj;
    NSArray *JsonObj;
    NSMutableData *data;
    NSString *ipHost;
    NSString *ipData;
}
@property (weak, nonatomic) IBOutlet UILabel *lab_message;
@property (weak, nonatomic) IBOutlet UILabel *lab_messageDetail;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *atv_loading;

@end
