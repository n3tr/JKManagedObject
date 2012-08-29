//
//  JKMOC.h
//  JKManagedObject
//
//  Created by Jirat K on 8/29/55 BE.
//  Copyright (c) 2555 Allianz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JKMOC : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

+ (JKMOC *)shared;
+ (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end
