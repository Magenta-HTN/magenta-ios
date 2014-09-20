//
//  NetworkUtil.m
//  WitHelloWorld
//
//  Created by Saif Jamil Khan on 2014-09-20.
//  Copyright (c) 2014 Wit.AI. All rights reserved.
//

#import "NetworkUtil.h"

@implementation NetworkUtil

- (instancetype)init{
    if (self = [super init]) {
        self.baseURL = [NSURL URLWithString:@""];
    }
    return self;
}

- (NSURLRequest *)GETRequestWithPath:(NSString *)path parameters:(NSDictionary *)parameters {
    NSURLComponents *URLComponents = [NSURLComponents componentsWithURL:self.baseURL resolvingAgainstBaseURL:NO];
    URLComponents.path = path;
    URLComponents.query = [self queryStringWithParameters:parameters];
    
    return [NSURLRequest requestWithURL:[URLComponents URL]];
}

- (NSString *)queryStringWithParameters:(NSDictionary *)parameters {
    NSMutableArray *pairs = [NSMutableArray array];
    
    for (NSString *name in parameters.allKeys) {
        [pairs addObject:[NSString stringWithFormat:@"%@=%@", name, parameters[name]]];
    }
    
    return [pairs componentsJoinedByString:@"&"];
}

@end
