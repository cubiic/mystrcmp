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

const int ARRAY_FIRST = 0;

@implementation MyStrCmp

// compare
-(int) compare:(NSString *) stringA 
   withStringB:(NSString *) stringB
{
    // assume the string comparison will succeed
    int returnStatus = 0;
    // some strings to use for testing
    NSString *testA = [[NSString alloc] init];
    NSString *testB = [[NSString alloc] init];
    BOOL endLoopFlag = NO;
    
    NSLog(@"compare: stringA: %@, stringB: %@", stringA, stringB);

    NSMutableArray *ma = [[NSMutableArray alloc] 
                          initWithArray:[self split:stringA]];
    NSMutableArray *mb = [[NSMutableArray alloc] 
                          initWithArray:[self split:stringB]];
    
    // while both arrays still have elements, combine the elements;
    // if the arrays are of unequal length, don't use any undefined elements
    // that are shifted from either array
    
    // we will break out of the loop down below
    while ( endLoopFlag == NO ) {
        // try and grab a character from stringA
        @try {
            testA = [ma objectAtIndex:ARRAY_FIRST];
            [ma removeObjectAtIndex:ARRAY_FIRST];
        }
        @catch (NSException *exception) {
            endLoopFlag = YES;
        }
        
        // now try and grab a character from stringB
        @try {
            testB = [mb objectAtIndex:ARRAY_FIRST];
            [mb removeObjectAtIndex:ARRAY_FIRST];
        }
        @catch (NSException *exception) {
            endLoopFlag = YES;
        }
        
        // return status is already 0, so we don't test for equality here
        if ( testA > testB ) {
            returnStatus = 1;
            NSLog(@"string A is greater than string B");
            endLoopFlag = YES;
        } else if ( testA < testB ) {
            returnStatus = -1;
            NSLog(@"string A is less than string B");
            endLoopFlag = YES;
        }
    }
    //return [NSString stringWithFormat:@"%@%@", stringA, stringB];
    if ( returnStatus == 0 ) {
        NSLog(@"string A is equal to string B");        
    }
    NSLog(@"returning status code '%i' to caller", returnStatus);
    return returnStatus;
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
    // create a string that returns the contents of both strings 
    // 'zippered' together
    NSMutableString *returnString = [[NSMutableString alloc] init];
    NSLog(@"zipper: stringA: %@, stringB: %@", stringA, stringB);
    // create two mutable arrays, one each for stringA and stringB
    NSMutableArray *ma = [[NSMutableArray alloc] 
                          initWithArray:[self split:stringA]];
    NSMutableArray *mb = [[NSMutableArray alloc] 
                          initWithArray:[self split:stringB]];
    
// while both arrays still have elements, combine the elements;
// if the arrays are of unequal length, don't use any undefined elements
// that are shifted from either array

    while ( [ma count] != 0 || [mb count] != 0 ) {
        // try and appending a character from stringA
        @try {
            [returnString appendFormat:@"%@",[ma objectAtIndex:ARRAY_FIRST]];
            [ma removeObjectAtIndex:ARRAY_FIRST];
        }
        @catch (NSException *exception) {
            // noop
        }

        // now try and appending a character from stringB
        @try {
             [returnString appendString:[mb objectAtIndex:ARRAY_FIRST]];
             [mb removeObjectAtIndex:ARRAY_FIRST];
        }
        @catch (NSException *exception) {
            // noop
        }
//        NSLog(@"returnString is now %@", returnString);
//        NSLog(@"counts are: a: %@ b: %@", [ma count], [mb count]);
    }
    //return [NSString stringWithFormat:@"%@%@", stringA, stringB];
    return returnString;
}

@end
