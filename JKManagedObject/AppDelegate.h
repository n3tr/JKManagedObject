//
//  AppDelegate.h
//  JKManagedObject
//
//  Created by Jirat K on 8/29/55 BE.
//  Copyright (c) 2555 Allianz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;


- (NSManagedObjectContext *)managedObjectContext;
- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
