//
//  JKManagedObject.m
//  JKManagedObject
//
//  Created by Jirat K on 8/29/55 BE.
//  Copyright (c) 2555 Allianz. All rights reserved.
//


#define dLIMIT 50


#import "JKManagedObject.h"

#import <objc/message.h>



@implementation JKManagedObject


+ (NSManagedObjectContext *)managedObjectContext
{
    
    id delegate = [[UIApplication sharedApplication] delegate];
    SEL s = NSSelectorFromString(@"managedObjectContext");
    NSManagedObjectContext *moc= objc_msgSend(delegate, s);
    
    return moc;

}


+ (id)createObject
{
    NSString *className = NSStringFromClass([self class]);;

       
    id object = [NSEntityDescription insertNewObjectForEntityForName:className inManagedObjectContext:[self managedObjectContext]];
    
    
    return object;
}

// Fetch All

+ (NSArray *)fetchAll
{
    return [self fetchAllWithLimit:0];
    
}


+ (NSArray *)fetchAllWithLimit:(NSInteger)limit
{
    NSString *entityName = NSStringFromClass([self class]);
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:entityName inManagedObjectContext:[self managedObjectContext]];
    [fetchRequest setEntity:entity];
    
    if (limit != 0) {
        [fetchRequest setFetchBatchSize:limit];
    }
    
    NSError *error = nil;
    NSArray *fetchedObjects = [[self managedObjectContext] executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        NSLog(@"Error");
    }
    
    fetchRequest = nil;
    
    return fetchedObjects;
}




// Where Cause

+ (NSArray *)where:(NSString *)attr value:(NSString *)value
{
    return [self where:attr value:value limit:0];
   
}


+ (NSArray *)where:(NSString *)attr value:(NSString *)value limit:(NSInteger)limit
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%@ = %@",attr,value];
    return [self fetchWithPredicate:predicate limit:limit];
}


+ (NSArray *)fetchWithPredicate:(NSPredicate *)predicate
{
    return [self fetchWithPredicate:predicate limit:0];
}


+ (NSArray *)fetchWithPredicate:(NSPredicate *)predicate limit:(NSInteger)limit
{
    NSString *entityName = NSStringFromClass([self class]);
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:entityName  inManagedObjectContext:[self managedObjectContext]];
    [fetchRequest setEntity:entity];
    
    if (limit != 0) {
        [fetchRequest setFetchBatchSize:limit];
    }
    
    [fetchRequest setPredicate:predicate];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [[self managedObjectContext] executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        NSLog(@"Error");
    }
    
    fetchRequest =nil;
    
    return fetchedObjects;
}



@end
