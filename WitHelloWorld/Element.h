//
//  Element.h
//  WitHelloWorld
//
//  Created by Saif Jamil Khan on 2014-09-20.
//  Copyright (c) 2014 Wit.AI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle.h>

@interface Element : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy, readonly) NSURL *HTMLURL;
@property (nonatomic, copy, readonly) NSNumber *number;

@end
    