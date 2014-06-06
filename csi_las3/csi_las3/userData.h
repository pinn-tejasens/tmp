//
//  userData.h
//  csi_las3
//
//  Created by Supasit on 5/23/57 BE.
//  Copyright (c) 2557 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface userData : NSObject{
    NSString *ipHost;
    NSString * ipData;
    NSMutableData *data;
    NSArray *arrObj;
    NSArray *JsonObj;
}

@property (strong,nonatomic) NSArray *userDataObject;
@property (readonly,assign) BOOL *conn;


-(void) setUserDataObject:(NSArray *)data;
-(void) getUserDataObject:(NSArray **)buffer range:(NSRange)inRange;

-(BOOL) checkConnectionWithuser:(NSString*)user password:(NSString*)pass;


@end
