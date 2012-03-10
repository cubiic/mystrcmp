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
        NSString *a = @"string_a";
        NSString *b = @"string_b";
        MyStrCmp *cmp = [[MyStrCmp alloc] init];
        [cmp compare:a withStringB:b];
        [cmp invert:a];
        [cmp split:b];
        [cmp zipper:a withStringB:b];
        
    }
    exit(0);
}

