//
//  ListAnalyzer.m
//  WordListsParser
//
//  Created by origami on 5/25/14.
//  Copyright (c) 2014 Nebulous Games. All rights reserved.
//

#import "ListAnalyzer.h"
#import "WordList.h"

@implementation ListAnalyzer


NSMutableArray * wordLists;
NSMutableArray * comparisonLists;

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        wordLists = [[NSMutableArray alloc] init];
        comparisonLists = [[NSMutableArray alloc] init];

        
        NSArray * listPathStrings = @[@"2of4brif",@"5desk",@"enable2k",@"letterpress",@"sowpods",@"TWL06",@"wordsEn",@"yawl"];
        NSArray * comparisonPathStrings = @[@"brandNames",@"britishWords",@"modernWords",@"oneLetterWords",@"scrabbleOnlyWords"];
        
        
        for(NSString * listPath in listPathStrings)
            [wordLists addObject:[self listWithName:listPath]];
        
        for(NSString * comparisonPath in comparisonPathStrings)
            [comparisonLists addObject:[self comparisonArrayWithName:comparisonPath]];
        
//        NSLog(@"count: %lu",(unsigned long)[comparisonLists count]);

//        for(NSArray * ray in comparisonLists)
//            NSLog(@"count: %lu",(unsigned long)[ray count]);
        for(WordList * list in wordLists)
            NSLog(@"%@",[list description]);
        
    }
    return self;
}


- (WordList *) listWithName: (NSString *) name{
    
#warning path, not string
    NSString* path = [[NSBundle mainBundle] pathForResource:name
                                                    ofType:@"txt"];
    WordList * list = [[WordList alloc] initFromFile:path];
    [list setName:name];
    return list;
    
}

- (NSArray *) comparisonArrayWithName: (NSString *) name{
    
    NSString* path = [[NSBundle mainBundle] pathForResource:name
                                                     ofType:@"txt"];
    

    //    Then loading the content into a NSString is even easier.
//    WordList * list = [[WordList alloc] initFromFile:path];
    
    NSString* content = [NSString stringWithContentsOfFile:path
                                                  encoding:NSASCIIStringEncoding
                                                     error:NULL];
    
    NSLog(@"content: %@",content);

    return [content componentsSeparatedByString:@"\n"];
    
}


- (void) analyze {

}


@end
