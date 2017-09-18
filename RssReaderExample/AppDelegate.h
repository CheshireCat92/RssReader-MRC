//
//  AppDelegate.h
//  RssReaderExample
//
//  Created by Артем Ковалев on 18.09.17.
//  Copyright © 2017 Artem Kovalev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

