//
//  ListAnalyzer.m
//  WordListsParser
//
//  Created by origami on 5/25/14.
//  Copyright (c) 2014 Nebulous Games. All rights reserved.
//

#import "ListAnalyzer.h"

@implementation ListAnalyzer


NSMutableArray * wordLists;
NSMutableArray * comparisonLists;

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        NSArray * listPathStrings = @[@"2of4brif",@"5desk",@"enable2k",@"letterpress",@"sowpods",@"TWL06",@"wordsEn",@"yawl"];
        NSArray * comparisonPathStrings = @[@"brandNames",@"britishWords",@"modernWords",@"oneLetterWords",@"scrabbleOnlyWords"];
        
//        [wordLists addObject:];
//        [comparisonLists addObject:];
        
    }
    return self;
}

- (void) analyze {

}


@end
