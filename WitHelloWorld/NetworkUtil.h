//
//  NetworkUtil.h
//  WitHelloWorld
//
//  Created by Saif Jamil Khan on 2014-09-20.
//  Copyright (c) 2014 Wit.AI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface  NetworkUtilListener : NSObject

-(void)requestSucceeded;
-(void)requestFailed;

@end

@interface NetworkUtil : NSObject <NSURLConnectionDelegate>

+ (NSURLRequest *)GETRequestWithPath:(NSString *)path withListener:(NetworkUtilListener *)listener;

@end
