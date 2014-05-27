//
//  WordList.h
//  WordListsParser
//
//  Created by origami on 5/25/14.
//  Copyright (c) 2014 Nebulous Games. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WordList : NSObject
@property NSMutableArray * list;
@property NSString * name;
@property float percentBrand, percentBrit, percentScrabble, percentModern, percentOffensive;
@property NSArray * uniqueWords;
@property NSDictionary * metaDict;

- (instancetype)initFromFile: (NSString *) filename;
- (NSString *) description;
- (float) percentMatchWithComparisonList: (NSArray *) comparator;
- (NSArray *) uniqueWordsWithMasterDictionary: (NSDictionary *) master;
@end
