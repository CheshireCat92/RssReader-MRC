//
//  RssTableViewCell.h
//  RssReaderExample
//
//  Created by Артем Ковалев on 24.09.17.
//  Copyright © 2017 Artem Kovalev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RssTableViewCellModel.h"

@interface RssTableViewCell : UITableViewCell
//- (id)initWithModel:(RssTableViewCellModel *)cellModel identifier:(NSString *)identifier;
- (void)setTitle:(NSString *)title desc:(NSString *)desc;
+ (CGFloat)expectedCellSizeForTitle:(NSString *)title desc:(NSString *)desc;
+ (NSString *)cellReuseIdentifier;
@end
