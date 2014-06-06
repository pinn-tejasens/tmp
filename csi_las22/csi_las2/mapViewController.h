//
//  mapViewController.h
//  csi_las2
//
//  Created by Supasit on 5/26/57 BE.
//  Copyright (c) 2557 Admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface mapViewController : UIViewController<MKMapViewDelegate>{
    NSMutableData *data;
    NSArray *JsonObj;
    NSArray *arrData;
    NSString *userId;
}
@property (weak, nonatomic) IBOutlet MKMapView *mapViewCon;
@property (weak, nonatomic) IBOutlet UILabel *lab_message;

@end
