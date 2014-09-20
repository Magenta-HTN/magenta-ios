//
//  NetworkUtil.h
//  WitHelloWorld
//
//  Created by Saif Jamil Khan on 2014-09-20.
//  Copyright (c) 2014 Wit.AI. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NetworkUtilListener
@optional
-(void)requestSucceeded;
-(void)requestFailed;
@end

@interface NetworkUtil : NSObject 

+ (NSURLRequest *)GETRequestWithPath:(NSString *)path withListener:(id)listener;

@end
