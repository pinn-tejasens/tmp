//
//  ViewController.h
//  csi_las1
//
//  Created by Supasit on 5/15/57 BE.
//  Copyright (c) 2557 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    
        NSMutableData *data;
    
}
@property (weak, nonatomic) IBOutlet UILabel *lab_loading;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *atv_loading;
- (IBAction)btn_reload:(id)sender;

@end
