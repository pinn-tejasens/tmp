//
//  DetailViewController.h
//  testing
//
//  Created by Pinn Tejasen on 6/6/2557 BE.
//  Copyright (c) 2557 Pinn Tejasen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
