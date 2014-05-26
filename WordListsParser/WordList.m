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
// contains brands
// contains british
// contains "Scrabble" words
// average word length
// one-letter words
- (NSString *) description{
    
    return [[NSString alloc] initWithFormat:@"{\n name: %@\n numberOfWords: %lu\n}",name,(unsigned long)[list count]];

}

- (float) percentMatchWithComparisonList: (NSArray *){

}
@end
