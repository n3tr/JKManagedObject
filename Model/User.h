//
//  User.h
//  JKManagedObject
//
//  Created by Jirat K on 8/29/55 BE.
//  Copyright (c) 2555 Allianz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "JKManagedObject.h"

@interface User : JKManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * age;
@property (nonatomic, retain) NSDate * birthday;

@end
