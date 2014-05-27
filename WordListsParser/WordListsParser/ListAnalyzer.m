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
        NSArray * comparisonPathStrings = @[@"brandNames",@"britishWords",@"modernWords",@"oneLetterWords",@"scrabbleOnlyWords",@"offensiveWords"];
        
        
        for(NSString * listPath in listPathStrings)
            [wordLists addObject:[self listWithName:listPath]];
        
        for(NSString * comparisonPath in comparisonPathStrings)
            [comparisonLists addObject:[self comparisonArrayWithName:comparisonPath]];
        
        NSMutableDictionary * masterDict = [[NSMutableDictionary alloc] init];
        for(WordList * list in wordLists){
            
            for (NSString * word in list.list){
            
                if([masterDict objectForKey:word] == nil){
                    [masterDict setValue:[NSNumber numberWithInt:1] forKey:word];
                }
                else{
//                    NSLog(@"reached");
                    NSNumber * hits = [masterDict objectForKey:word];
                    int hitsInt =[hits intValue];
                    hitsInt++;
                    [masterDict setValue:[NSNumber numberWithInt:hitsInt] forKey:word];
                }
            }
            NSLog(@"processed list");
        }
        for(WordList * list in wordLists){
            [list setMetaDict:masterDict];
            NSLog(@"%@",[list description]);
        }
        
        NSLog(@"afro: %@",[masterDict objectForKey:@"afro"]);
        NSLog(@"selfie: %@",[masterDict objectForKey:@"selfie"]);
        NSLog(@"fuck: %@",[masterDict objectForKey:@"fuck"]);
        NSLog(@"fuckface: %@",[masterDict objectForKey:@"fuckface"]);
        NSLog(@"dongle: %@",[masterDict objectForKey:@"dongle"]);
        NSLog(@"google: %@",[masterDict objectForKey:@"google"]);
        NSLog(@"fuckshit: %@",[masterDict objectForKey:@"fuckshit"]);
        NSLog(@"recurse: %@",[masterDict objectForKey:@"recurse"]);
        NSLog(@"fovea: %@",[masterDict objectForKey:@"fovea"]);
        NSLog(@"hippie: %@",[masterDict objectForKey:@"hippie"]);
        NSLog(@"motherboard: %@",[masterDict objectForKey:@"motherboard"]);
        NSLog(@"total words: %lu",(unsigned long)[masterDict count]);
        NSLog(@"words in 1 dictionary: %lu",(unsigned long)[[masterDict allKeysForObject:[NSNumber numberWithInt:1]]count]);
        NSLog(@"words in 2 dictionary: %lu",(unsigned long)[[masterDict allKeysForObject:[NSNumber numberWithInt:2]]count]);
        NSLog(@"words in 3 dictionary: %lu",(unsigned long)[[masterDict allKeysForObject:[NSNumber numberWithInt:3]]count]);
        NSLog(@"words in 4 dictionary: %lu",(unsigned long)[[masterDict allKeysForObject:[NSNumber numberWithInt:4]]count]);
        NSLog(@"words in 5 dictionary: %lu",(unsigned long)[[masterDict allKeysForObject:[NSNumber numberWithInt:5]]count]);
        NSLog(@"words in 6 dictionary: %lu",(unsigned long)[[masterDict allKeysForObject:[NSNumber numberWithInt:6]]count]);
        NSLog(@"words in 7 dictionary: %lu",(unsigned long)[[masterDict allKeysForObject:[NSNumber numberWithInt:7]]count]);










        
        
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
