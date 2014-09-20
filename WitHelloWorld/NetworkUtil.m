//
//  NetworkUtil.m
//  WitHelloWorld
//
//  Created by Saif Jamil Khan on 2014-09-20.
//  Copyright (c) 2014 Wit.AI. All rights reserved.
//

#import "NetworkUtil.h"

@implementation NetworkUtil 

static NSURL* baseURL;

- (instancetype)init{
    if (self = [super init]) {
        baseURL = [NSURL URLWithString:@""];
    }
    return self;
}

+ (NSURLRequest *)GETRequestWithPath:(NSString *)path withListener:(NetworkUtilListener *)listener {
    NSURLComponents *URLComponents = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:NO];
    URLComponents.path = path;
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[URLComponents URL] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30.0];
    [request setHTTPMethod:@"GET"];

    (void)[NSURLConnection sendAsynchronousRequest:request queue:NULL completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSHTTPURLResponse* httpResponse = (NSHTTPURLResponse*)response;
        int code = [httpResponse statusCode];
        if(200 <= code && code <= 299) {
            [listener requestSucceeded];
        } else {
            [listener requestFailed];
        }
}];
    return request;
}

+ (NSURLRequest *)GETRequestWithPath:(NSString *)path parameters:(NSDictionary *)parameters {
    NSURLComponents *URLComponents = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:NO];
    URLComponents.path = path;
    URLComponents.query = [self queryStringWithParameters:parameters];
    
    return [NSURLRequest requestWithURL:[URLComponents URL]];
}

+ (NSString *)queryStringWithParameters:(NSDictionary *)parameters {
    NSMutableArray *pairs = [NSMutableArray array];
    
    for (NSString *name in parameters.allKeys) {
        [pairs addObject:[NSString stringWithFormat:@"%@=%@", name, parameters[name]]];
    }
    
    return [pairs componentsJoinedByString:@"&"];
}

#pragma mark <NSURLConnectionDelegate>


- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    
}
- (BOOL)connectionShouldUseCredentialStorage:(NSURLConnection *)connection {
    
}
- (void)connection:(NSURLConnection *)connection willSendRequestForAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge {
    
}


@end
