//
//  AppDelegate.h
//  CoreData
//
//  Created by Rahul Chopra on 29/11/17.
//  Copyright © 2017 Bar Uncle. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

-(void) saveContext;

@end

