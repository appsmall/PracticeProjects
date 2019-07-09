//
//  AppDelegate.h
//  JSONParsing
//
//  Created by Rahul Chopra on 29/11/17.
//  Copyright © 2017 Bar Uncle. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

+ (void) downloadDataFromURL: (NSURL *)url withCompletionHandler: (void (^)(NSData *data))completionHandler;

@end

