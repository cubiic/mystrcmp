//
//  main.m
//  MyStrCmp
//
//  Created by Brian Manning on 3/8/12.
//  Copyright (c) 2012 Example Company Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyStrCmp.h"

int main (int argc, const char * argv[])
{

    @autoreleasepool {
        
        // check to see that all arguments were passed in
        //NSLog(@"Hello, World! Number of arguments: %i", argc);
        if ( argc < 3 ) {
            printf("Error: requires two strings to compare as arguments\n");
            printf("Usage: mystrcmp <string 1> <string 2>\n");
            exit(1);
        }
        NSString *a = @"abcdef";
        NSString *b = @"uvwxyz";
        MyStrCmp *cmp = [[MyStrCmp alloc] init];
        
        // some faux unit tests, which have been jcommented out
//        NSLog(@"inverted string: %@", [cmp invert:a]);
        // create an array to hold the output of the split call
//        NSMutableArray *arrayB = [[NSMutableArray alloc] init];
        // split the string, add it to arrayB
//        [arrayB addObjectsFromArray:[cmp split:b]];
        //        for (NSString *s in arrayB) {
        //            NSLog(@"%@:", s);
        //        }
//        NSLog(@"zippered string: %@", [cmp zipper:a withStringB:b]);
        
        [cmp compare:a withStringB:b];
        
    }
    exit(0);
}

