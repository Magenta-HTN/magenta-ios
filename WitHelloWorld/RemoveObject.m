//
//  RemoveObject.m
//  WitHelloWorld
//
//  Created by Saif Jamil Khan on 2014-09-21.
//  Copyright (c) 2014 Wit.AI. All rights reserved.
//

#import "RemoveObject.h"

@implementation RemoveObject


+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"intent": @"intent",
             @"elementID": @"elementID"};
}

+ (id)elementCommandWithIntent:(NSString *)intent
                      withID:(NSNumber *)elementID{
    RemoveObject *command = [[RemoveObject alloc] init];
    command.intent = intent;
    command.elementID = elementID;
    
    return command;
}


@end
