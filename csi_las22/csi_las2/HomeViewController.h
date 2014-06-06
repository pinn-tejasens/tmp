//
//  HomeViewController.h
//  csi_las2
//
//  Created by Supasit on 5/22/57 BE.
//  Copyright (c) 2557 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController
@property (strong,nonatomic) NSArray *arrData;
@property (weak, nonatomic) IBOutlet UILabel *lab_time;
@property (weak, nonatomic) IBOutlet UILabel *lab_name;


@property (weak, nonatomic) IBOutlet UIProgressView *m;

@property (weak, nonatomic) IBOutlet UIProgressView *h;

@property (weak, nonatomic) IBOutlet UIProgressView *s;




@end
