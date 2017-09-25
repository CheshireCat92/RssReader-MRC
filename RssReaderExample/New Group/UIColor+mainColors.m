//
//  UIColor+mainColors.m
//  RssReaderExample
//
//  Created by Артем Ковалев on 24.09.17.
//  Copyright © 2017 Artem Kovalev. All rights reserved.
//

#import "UIColor+mainColors.h"

@implementation UIColor (mainColors)
+ (UIColor *)postCellTitleColor{
    return [UIColor colorWithRed:0.53 green:0.70 blue:0.82 alpha:1.00];
}

+ (UIColor *)postCellDescriptionColor{
    return [UIColor clearColor];
}

+ (UIColor *)postCellBackgroundColor{
    return [UIColor clearColor];
}

+ (UIColor *)postCellLabelsContainerColor{
    return [UIColor colorWithRed:1.00 green:1.00 blue:1.00 alpha:1.00];
}

+ (UIColor *)rssTableViewBackgroundColor{
    return [UIColor colorWithRed:0.78 green:0.86 blue:0.92 alpha:1.00];
}
@end
