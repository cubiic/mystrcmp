//
//  MyStrCmp.h
//  MyStrCmp
//
//  Created by Brian Manning on 3/8/12.
//  Copyright (c) 2012 Example Company Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyStrCmp : NSObject

-(int) compare:(NSString *) stringA 
   withStringB:(NSString *) stringB;
-(NSString *) invert:(NSString *) invertString;
-(NSMutableArray *) split:(NSString *) splitString;
-(NSString *) zipper:(NSString *) stringA 
         withStringB:(NSString *) stringB;
@end
