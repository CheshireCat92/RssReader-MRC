//
//  Post.h
//  RssReaderExample
//
//  Created by Артем Ковалев on 24.09.17.
//  Copyright © 2017 Artem Kovalev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Post : NSObject{
    NSString* title;
    NSString* link;
    NSString* description;
}
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *link;
@property (nonatomic, retain) NSString *description;

@end
