//
//  MyStrCmp.m
//  MyStrCmp
//
//  Created by Brian Manning on 3/8/12.
//  Copyright (c) 2012 Example Company Inc. All rights reserved.
//

// uses examples from the following webpages:
// http://stackoverflow.com/questions/1354388/unichar-and-nsstring-how-interchangeable-are-these
// http://stackoverflow.com/questions/997079/objective-c-nsstring-problem

#import "MyStrCmp.h"

@implementation MyStrCmp

// compare
-(int) compare:(NSString *) stringA 
   withStringB:(NSString *) stringB
{
    NSLog(@"compare: stringA: %@, stringB: %@", stringA, stringB);
    return 0;
}

// invert the string passed in as invertString; return the inverted
// string to the caller
-(NSString *) invert:(NSString *) invertString
{
    NSLog(@"invert: invertString: %@", invertString);
    // holds the inverted string
    NSMutableString *inverted = [[NSMutableString alloc] init];
    // array to hold the split string
    NSMutableArray *ma = [[NSMutableArray alloc] init]; 
    [ma addObjectsFromArray:[self split:invertString]];
    // read each element of the array, and insert it at the beginning of 'inverted'
    for (NSString *s in ma) {
        [inverted insertString:s atIndex:0];
    }

    // we're returning an NSMutableArray but the method prototype is NSString
    return inverted;
}

// split 'splitString' into an array of individual characters (stored as NSString)
// and return the array to the caller
-(NSMutableArray *) split:(NSString *) splitString
{
    NSLog(@"split: %@", splitString);
    // create an array to hold the individual characters of splitString
    NSMutableArray *ma = [[NSMutableArray alloc] init]; 
    
    int counter = 0;

    // pull characters off of splitScreen in a loop
    while (1) {
        @try {
            NSString *str = [NSString stringWithFormat:@"%C", 
                             [splitString characterAtIndex:counter]];
            // add them to the return array as NSString objects
            [ma addObject:str];
        }
        @catch (NSException *exception) {
            NSLog(@"split: reached end of the string; counter is %i", counter);
            // return the mutable array
            return ma;
        }
        counter++;
    }
    
}

// zipper
-(NSString *) zipper:(NSString *) stringA 
         withStringB:(NSString *) stringB
{
    NSLog(@"zipper: stringA: %@, stringB: %@", stringA, stringB);
    return [NSString stringWithFormat:@"%@%@", stringA, stringB];
}

@end
