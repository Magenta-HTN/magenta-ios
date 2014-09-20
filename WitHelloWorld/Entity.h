//
//  Entity.h
//  WitHelloWorld
//
//  Created by Ali on 2014-09-20.
//  Copyright (c) 2014 Wit.AI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle.h>

@interface Entity : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSString *role;
@property (nonatomic, strong) NSString *value;

@end
