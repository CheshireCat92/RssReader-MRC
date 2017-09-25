//
// Created by Артем Ковалев on 18.09.17.
// Copyright (c) 2017 Artem Kovalev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Channel.h"

@class RssTableViewController;
@interface RssTableViewModel : NSObject{
    Channel *feedChannel;
    id currentElement;
    NSMutableString *currentElementData;
}

@property (nonatomic, assign) NSXMLParser *parser;
@property (nonatomic, assign) RssTableViewController *parentController;
@property (nonatomic, retain) Channel *feedChannel;
@property (nonatomic, assign) NSMutableArray *feedPosts;
@property (nonatomic, assign) id currentElement;
@property (nonatomic, retain) NSMutableString *currentElementData;



- (void)startParseRSS;

@end
