#import <Foundation/Foundation.h>
#import <Mantle.h>

@interface RemoveObject : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSString *intent;
@property (nonatomic, strong) NSNumber *elementID;

+ (id)elementCommandWithIntent:(NSString *)intent
                        withID:(NSNumber *)elementID;
@end
