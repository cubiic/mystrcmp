//
//  MyStrCmp.m
//  MyStrCmp
//
//  Created by Brian Manning on 3/8/12.
//  Copyright (c) 2012 Example Company Inc. All rights reserved.
//

#import "MyStrCmp.h"

@implementation MyStrCmp

// compare
-(int) compare:(NSString *) stringA 
   withStringB:(NSString *) stringB
{
    NSLog(@"compare: stringA: %@, stringB: %@", stringA, stringB);
    return 0;
}

// invert
-(NSString *) invert:(NSString *) invertString
{
    NSLog(@"invert: invertString: %@", invertString);
    return invertString;
}

// split
-(NSMutableArray *) split:(NSString *) splitString
{
    NSLog(@"split: %@", splitString);
    NSMutableArray *ma = [[NSMutableArray alloc] 
                          initWithObjects:splitString, nil];
    return ma;
}

// zipper
-(NSString *) zipper:(NSString *) stringA 
         withStringB:(NSString *) stringB
{
    NSLog(@"zipper: stringA: %@, stringB: %@", stringA, stringB);
    return [NSString stringWithFormat:@"%@%@", stringA, stringB];
}

@end
