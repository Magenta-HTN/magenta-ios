#import <Foundation/Foundation.h>
#import <Mantle.h>

@interface Styling : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSString *property;
@property (nonatomic, strong) NSString *value;

@end
