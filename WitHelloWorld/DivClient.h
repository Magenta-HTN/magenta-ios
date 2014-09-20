//
//  DivClient.h
//  WitHelloWorld
//
//  Created by Saif Jamil Khan on 2014-09-20.
//  Copyright (c) 2014 Wit.AI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkUtil.h"

@protocol DivClientListener
@optional
-(void)requestSucceeded;
-(void)requestFailed;
@end


@interface DivClient : NSObject <NetworkUtilListener>

-(void)syncAllDataWithListener:(id)listener;
+ (id)singletonInstance;

@end
