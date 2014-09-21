#import <Foundation/Foundation.h>
#import <Mantle.h>

@interface Element : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSString *intent;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *html;
@property (nonatomic, assign) NSInteger parent;
@property (nonatomic, assign) NSInteger elementID;
@property (nonatomic, strong) NSArray *styles;

+ (id)elementCommandWithIntent:(NSString *)intent
                      withType:(NSString *)type
                      withHTML:(NSString *)html
                    withParent:(NSInteger)parent
                 withElementID:(NSInteger)elementID
                    withStyles:(NSArray *)styles;

@end