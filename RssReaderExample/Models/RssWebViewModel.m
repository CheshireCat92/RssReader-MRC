//
//  RssWebViewModel.m
//  RssReaderExample
//
//  Created by Артем Ковалев on 25.09.17.
//  Copyright © 2017 Artem Kovalev. All rights reserved.
//

#import "RssWebViewModel.h"
#import "Post.h"
@implementation RssWebViewModel
@synthesize postDescriptionURL,postTitle;

+(id)initWithPost:(Post *)post{
    return [[RssWebViewModel alloc]initWithPost:post].autorelease;
}

-(id)initWithPost:(Post *)post{
    self = [super init];
    if (self) {
        postDescriptionURL = [[NSURL alloc]initWithString:[post.link stringByAddingPercentEscapesUsingEncoding:
                                                           NSUTF8StringEncoding]];
        postTitle = post.title;
    }
    return self;
}

- (void)dealloc{
    [super dealloc];
}

@end
