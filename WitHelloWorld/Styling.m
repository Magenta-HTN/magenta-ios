#import "Styling.h"

@implementation Styling

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{@"property": @"property",
             @"value": @"value"};
}

+ (id)stylingWithProperty:(NSString *)property
                withValue:(NSString *)value {
    
    Styling *style = [[Styling alloc] init];
    style.property = property;
    style.value = value;
    
    return style;
}

@end
