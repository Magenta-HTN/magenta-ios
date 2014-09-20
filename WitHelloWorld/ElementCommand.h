//
//  ElementCommand.h
//  WitHelloWorld
//
//  Created by Ali on 2014-09-20.
//  Copyright (c) 2014 Wit.AI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle.h>

@interface ElementCommand : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSString *intent;
@property (nonatomic, strong) NSArray *entities;

+(id)elementCommandWithIntent:(NSString *)intent withTities:(NSArray *)entities;

@end
