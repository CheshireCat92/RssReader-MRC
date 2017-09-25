//
//  RssTableViewController.h
//  RssReaderExample
//
//  Created by Артем Ковалев on 18.09.17.
//  Copyright © 2017 Artem Kovalev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RssTableViewModel.h"
@interface RssTableViewController : UITableViewController

+ (id)initWithModel:(RssTableViewModel *)tableViewModel;
- (id)initWithModel:(RssTableViewModel *)tableViewModel;

- (void)parseDidEnd;

@end

