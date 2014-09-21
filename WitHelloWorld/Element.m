#import "Element.h"

@implementation Element

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"intent": @"intent",
             @"type": @"type",
             @"html": @"html",
             @"parent": @"parent",
             @"elementID": @"elementID",
             @"styles": @"styles"};
}

+ (id)elementCommandWithIntent:(NSString *)intent
                     withType:(NSString *)type
                     withHTML:(NSString *)html
                   withParent:(NSInteger)parent
                withElementID:(NSInteger)elementID
                    withStyles:(NSMutableArray *)styles {
    Element *command = [[Element alloc] init];
    command.intent = intent;
    command.type = type;
    command.html = html;
    command.parent = parent;
    command.elementID = elementID;
    command.styles = styles;
    
    return command;
}

@end