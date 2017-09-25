//
//  RssWebViewController.h
//  RssReaderExample
//
//  Created by Артем Ковалев on 24.09.17.
//  Copyright © 2017 Artem Kovalev. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RssWebViewModel;
@interface RssWebViewController : UIViewController
+ (id)initWithModel:(RssWebViewModel *)webViewModel;
- (id)initWithModel:(RssWebViewModel *)webViewModel;
@end
