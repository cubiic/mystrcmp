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
        NSArray *args = [[NSProcessInfo processInfo] arguments];
        NSLog(@"This program is named %@.", [args objectAtIndex:0]);
        NSLog(@"There are %lu arguments.", [args count] - 1);
        NSString *a = [args objectAtIndex:1];
        NSString *b = [args objectAtIndex:2];
        MyStrCmp *cmp = [[MyStrCmp alloc] init];
                
        [cmp compare:a withStringB:b];
        
    }
    NSLog(@"exiting with an exit code of 0");
    exit(0);
}

