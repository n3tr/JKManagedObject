//
//  JKManagedObject.h
//  JKManagedObject
//
//  Created by Jirat K on 8/29/55 BE.
//  Copyright (c) 2555 Allianz. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface JKManagedObject : NSManagedObject




+ (id)createObject;
+ (NSArray *)fetchAll;
+ (NSArray *)fetchAllWithLimit:(NSInteger)limit;


+ (NSArray *)where:(NSString *)attr value:(NSString *)value;
+ (NSArray *)where:(NSString *)attr value:(NSString *)value limit:(NSInteger)limit;
+ (NSArray *)fetchWithPredicate:(NSPredicate *)predicate;
+ (NSArray *)fetchWithPredicate:(NSPredicate *)predicate limit:(NSInteger)limit;



@end
