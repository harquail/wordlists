//
//  WordList.m
//  WordListsParser
//
//  Created by origami on 5/25/14.
//  Copyright (c) 2014 Nebulous Games. All rights reserved.
//

#import "WordList.h"

@implementation WordList
@synthesize list, name;

- (instancetype)initFromFile: (NSString *) filename
{
    self = [super init];
    if (self) {
        
    NSString* content = [NSString stringWithContentsOfFile:filename
                                                  encoding:NSUTF8StringEncoding
                                                     error:NULL];
    list = [content componentsSeparatedByString:@"\n"];
        
        
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
// one-letter words
- (NSString *) description{
    
    bool hasOneLetter = [self containsOneLetterWords];
    float percentBrand;
    float percentBrit;
    float percentScrabble;
    float avgLength;
    NSArray *

    return [[NSString alloc] initWithFormat:@"{\n name: %@\n numberOfWords: %lu\n}",name,(unsigned long)[list count]];

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
@end
