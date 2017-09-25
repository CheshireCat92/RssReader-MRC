//
//  Channel.m
//  RssReaderExample
//
//  Created by Артем Ковалев on 24.09.17.
//  Copyright © 2017 Artem Kovalev. All rights reserved.
//

#import "Channel.h"

@implementation Channel

@synthesize title,link,description;

-(id)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(void)dealloc{
    [title release];
    [link release];
    [description release];
    [super dealloc];
}

@end
