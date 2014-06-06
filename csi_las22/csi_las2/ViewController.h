//
//  //  //
//  //  //

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    NSArray *JsonObj;
    NSMutableData *data;
    
    NSArray *dataArray;
}
@property (weak, nonatomic) IBOutlet UIImageView *YourImageview;

@property (strong,nonatomic) NSArray *dataArray;
@property (weak, nonatomic) IBOutlet UILabel *lab_userName;
@property (weak, nonatomic) IBOutlet UILabel *lab_lastName;
@property (weak, nonatomic) IBOutlet UILabel *lab_phone;
@property (weak, nonatomic) IBOutlet UILabel *lab_email;

@property (weak, nonatomic) IBOutlet UILabel *pass1;
@property (weak, nonatomic) IBOutlet UILabel *pass2;
@property (weak, nonatomic) IBOutlet UILabel *pass3;
@property (weak, nonatomic) IBOutlet UILabel *pass4;

- (IBAction)btn_1:(id)sender;
- (IBAction)btn_2:(id)sender;
- (IBAction)btn_3:(id)sender;
- (IBAction)btn_4:(id)sender;
- (IBAction)btn_5:(id)sender;
- (IBAction)btn_6:(id)sender;
- (IBAction)btn_7:(id)sender;
- (IBAction)btn_8:(id)sender;
- (IBAction)btn_9:(id)sender;
- (IBAction)btn_0:(id)sender;
- (IBAction)btn_clear:(id)sender;
- (IBAction)btn_backSpace:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *out_1;
@property (weak, nonatomic) IBOutlet UIButton *out_2;
@property (weak, nonatomic) IBOutlet UIButton *out_3;
@property (weak, nonatomic) IBOutlet UIButton *out_4;
@property (weak, nonatomic) IBOutlet UIButton *out_5;
@property (weak, nonatomic) IBOutlet UIButton *out_6;
@property (weak, nonatomic) IBOutlet UIButton *out_7;
@property (weak, nonatomic) IBOutlet UIButton *out_8;
@property (weak, nonatomic) IBOutlet UIButton *out_9;
@property (weak, nonatomic) IBOutlet UIButton *out_0;
@property (weak, nonatomic) IBOutlet UIButton *out_clear;
@property (weak, nonatomic) IBOutlet UIButton *out_backSpace;

@property (nonatomic, strong) UIImageView *splashView;
@end
