//
//  WordList.m
//  WordListsParser
//
//  Created by origami on 5/25/14.
//  Copyright (c) 2014 Nebulous Games. All rights reserved.
//

#import "WordList.h"

@implementation WordList
@synthesize list, name, percentBrand,tenUnique,percentBrit,percentScrabble, percentModern, metaDict;//metaDict is a combination of all dictionaries — with hit counts for each word;

- (instancetype)initFromFile: (NSString *) filename
{
    self = [super init];
    if (self) {
        
    NSString* content = [NSString stringWithContentsOfFile:filename
                                                  encoding:NSUTF8StringEncoding
                                                     error:NULL];
    NSArray * tempList = [content componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    
        list = [[NSMutableArray alloc] initWithCapacity:[tempList count]];
        
        for(NSString * string in tempList){
            NSString * wordTemp =[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
            wordTemp = [wordTemp lowercaseString];
            [list addObject:wordTemp];
        }
        
        
        
//        list = [[NSDictionary alloc] initWithObjects:@[nil] forKeys:words];
    }
    return self;
}

// most unique words
// percent brands
// percent british
// percent modern
// contains "Scrabble" words
// average word length
- (NSString *) description{
    
    float avglength = [self avgLength];
    NSDictionary * uniques = [self uniqueWordsWithMasterDictionary:metaDict];
    
    return [[NSString alloc] initWithFormat:@"{\n name: %@\n numberOfWords: %lu\n britishness: %f\n modernity: %f\n scabbleness: %f\n branding: %f\n avg length: %f\n unique words: %@}",name,(unsigned long)[list count],percentBrit,percentModern,percentScrabble,percentBrand, avglength, uniques];

}

- (float) percentMatchWithComparisonList: (NSArray *) comparator{
    
    NSUInteger count = 0;
    NSUInteger matched = 0;
    
    for(NSString * word in comparator){
        count++;
        if([self.list containsObject:word]){
            matched++;
        }
    }
    
    return (float)matched/count;

}

- (NSDictionary *) uniqueWordsWithMasterDictionary: (NSDictionary *) master{
    
    return nil;

}


@end
