//
//  main.m
//  MyStrCmp
//
//  Created by Brian Manning on 3/8/12.
//  Copyright (c) 2012 Example Company Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

int main (int argc, const char * argv[])
{

    @autoreleasepool {
        
        // check to see that all arguments were passed in
        //NSLog(@"Hello, World! Number of arguments: %i", argc);
        if ( argc < 3 ) {
            printf("Error: requires two strings to compare as arguments\n");
            printf("Usage: mystrcmp <string 1> <string 2>\n");
            return 1;
        }
        
    }
    return 0;
}

