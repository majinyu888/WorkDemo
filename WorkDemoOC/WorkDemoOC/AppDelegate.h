//
//  AppDelegate.h
//  WorkDemoOC
//
//  Created by hb on 2017/1/9.
//  Copyright © 2017年 com.bm.hb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

