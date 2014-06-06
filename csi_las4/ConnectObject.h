//
//  ConnectObject.h
//  csi_las4
//
//  Created by Supasit on 6/3/57 BE.
//  Copyright (c) 2557 Admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ConnectObject : NSObject{
    NSString *ipHost;
    NSString *ipData;
    
    
}
@property (readwrite,atomic) BOOL conn;

-(BOOL) connection;

@end
