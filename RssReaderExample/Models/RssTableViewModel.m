//
// Created by Артем Ковалев on 18.09.17.
// Copyright (c) 2017 Artem Kovalev. All rights reserved.
//

#import "RssTableViewModel.h"
#import "RssTableViewController.h"
#import "Channel.h"
#import "Post.h"

static NSString * const rssLink = @"http://images.apple.com/main/rss/hotnews/hotnews.rss";
static NSString * const kChannelElementName = @"channel";
static NSString * const kItemElementName = @"item";

@interface RssTableViewModel () <NSXMLParserDelegate>

@end
@implementation RssTableViewModel
@synthesize feedPosts,feedChannel,currentElementData,currentElement;

-(id)init{
    if (self = [super init]){
        feedPosts = [NSMutableArray new];
        NSURL *rssURL = [[NSURL alloc]initWithString:rssLink];
        _parser = [[NSXMLParser alloc]initWithContentsOfURL:rssURL];
        [rssURL release];
        [_parser setDelegate:self];
        [_parser setShouldResolveExternalEntities:NO];
    }
    return self;
}

-(void)dealloc{
    [feedChannel release];
    [currentElementData release];
    [super dealloc];
}

#pragma mark - NSXMLParser methods

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict{
    
    if ([elementName isEqualToString:kChannelElementName]){
        Channel *channel = [[Channel alloc]init];
        self.feedChannel = channel;
        self.currentElement = channel;
        [channel release];
        return;
    }
    
    if ([elementName isEqualToString:kItemElementName]){
        Post *post = [[Post alloc]init];
        [self.feedPosts addObject:post];
        self.currentElement = post;
        [post release];
        return;
    }
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    if (![string isEqualToString:@"\n"]){
        if(currentElementData == nil){
            self.currentElementData = [[NSMutableString alloc] init];
        }
            [currentElementData appendString:string];
        
    }
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    
    SEL selectorName = NSSelectorFromString(elementName);
    if ([currentElement respondsToSelector:selectorName]) {
        [currentElement setValue:currentElementData forKey:elementName];
    }
    
    [currentElementData release];
    self.currentElementData = nil;
}

- (void)parserDidEndDocument:(NSXMLParser *)parser{
    [self.parentController parseDidEnd];
}

#pragma mark -

-(void)startParseRSS{
    [self.parser parse];
}
@end
