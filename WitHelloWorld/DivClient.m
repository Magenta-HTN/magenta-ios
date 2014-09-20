//
//  DivClient.m
//  WitHelloWorld
//
//  Created by Saif Jamil Khan on 2014-09-20.
//  Copyright (c) 2014 Wit.AI. All rights reserved.
//

#import "DivClient.h"
#import "NetworkUtil.h"

@implementation DivClient

static NSString *path = @"/div";

-(void)syncAllData {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
        [NetworkUtil GETRequestWithPath:path] ;
        
    });
}

@end
