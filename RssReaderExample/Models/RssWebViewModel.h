//
//  RssWebViewModel.h
//  RssReaderExample
//
//  Created by Артем Ковалев on 25.09.17.
//  Copyright © 2017 Artem Kovalev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Post.h"

@interface RssWebViewModel : NSObject {
    
}
+(id)initWithPost:(Post *)post;
-(id)initWithPost:(Post *)post;

@property (nonatomic, assign) NSURL *postDescriptionURL;
@property (nonatomic, assign) NSString *postTitle;
@end
