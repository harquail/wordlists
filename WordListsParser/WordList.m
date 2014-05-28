//
//  WordList.m
//  WordListsParser
//
//  Created by origami on 5/25/14.
//  Copyright (c) 2014 Nebulous Games. All rights reserved.
//

#import "WordList.h"

@implementation WordList
@synthesize list, name, percentBrand,uniqueWords,percentBrit,percentScrabble, percentModern ,percentOffensive, metaDict;//metaDict is a combination of all dictionaries — with hit counts for each word;

#define const_maxwords 535501.000000
#define const_maxbranding 0.826087
#define const_maxscrabble 0.923077
#define const_maxmodern 0.479675
#define const_maxoffensive 0.391304
#define const_maxbritishness 0.990815

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
    NSArray * uniques = [self uniqueWordsWithMasterDictionary:metaDict];
    NSString *arrayStr = [uniques componentsJoinedByString:@"</li><li>"];
    NSString *jsFunc = [NSString stringWithFormat:@"%@Uniques(<ul><li>%@</li></ul>)", self.name, arrayStr];

    
    return [[NSString alloc] initWithFormat:@"{\n name: %@\n numberOfWords: %f\n britishness: %f\n modernity: %f\n scabbleness: %f\n branding: %f\n offensive: %f\n avg length: %f\n unique words: %@}",name,[list count]*(1/const_maxwords),percentBrit*(1/const_maxbritishness),percentModern*(1/const_maxmodern),percentScrabble*(1/const_maxscrabble),percentBrand*(1/const_maxbranding),percentOffensive*(1/const_maxoffensive), avglength, jsFunc];

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

- (float) avgLength{

    NSUInteger i = 0;
    for(NSString * word in list){
        i+= [word length];
    }
    return (float)i/(float)[list count];
}

- (NSArray *) uniqueWordsWithMasterDictionary: (NSDictionary *) master{
    
    NSMutableArray * uniques= [[NSMutableArray alloc] init];
    
    for (NSString * word in list){
    
        if([master objectForKey:word] == [NSNumber numberWithInt:1]){
            [uniques addObject:word];
        }
    }
    
    return uniques;

}


@end
