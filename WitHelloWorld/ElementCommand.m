//
//  ElementCommand.m
//  WitHelloWorld
//
//  Created by Ali on 2014-09-20.
//  Copyright (c) 2014 Wit.AI. All rights reserved.
//

#import "ElementCommand.h"

@implementation ElementCommand

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"intent": @"url",
             @"entities": @"html_url"             };
}

+(id)elementCommandWithIntent:(NSString *)intent withTities:(NSArray *)entities {
    ElementCommand *command = [[ElementCommand alloc] init];
    command.intent = intent;
    command.entities = entities;
    return command;
}

@end
