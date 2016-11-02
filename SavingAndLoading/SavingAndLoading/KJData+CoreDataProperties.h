//
//  KJData+CoreDataProperties.h
//  SavingAndLoading
//
//  Created by 来自遥远星系的核心巡洋舰 on 16/11/2.
//  Copyright © 2016年 KnightJoker. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "KJData.h"

NS_ASSUME_NONNULL_BEGIN

@interface KJData (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *dataName;

@end

NS_ASSUME_NONNULL_END
