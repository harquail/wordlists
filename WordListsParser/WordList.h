//
//  WordList.h
//  WordListsParser
//
//  Created by origami on 5/25/14.
//  Copyright (c) 2014 Nebulous Games. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WordList : NSObject
@property NSArray * list;
@property NSString * name;

- (instancetype)initFromFile: (NSString *) filename;
- (NSString *) description;

@end
