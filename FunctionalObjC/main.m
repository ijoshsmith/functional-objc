//
//  main.m
//  FunctionalObjC
//
//  Created by jas on 8/23/15.
//  Copyright (c) 2015 iJoshSmith. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NSArray+Functional.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *words = @[@"whammo", @"twig", @"locus", @"astrophysics"];
        
        //
        // Reducing
        //
        
        NSNumber *maxLength = NSArrayReduce(words, @0, ^id(NSString *element, NSNumber *accumulator) {
            return @( MAX([element length], [accumulator integerValue]) );
        });
        
        NSString *shortestWord = [words reduceWithInitialValue: nil reducer: ^id(NSString *element, NSString *accumulator) {
            if ( accumulator == nil ) {
                return element;
            }
            else {
                return [element length] < [accumulator length] ? element : accumulator;
            }
        }];
        
        NSLog(@"max length is %@", maxLength);
        NSLog(@"shortest word is %@", shortestWord);
        
        //
        // Mapping
        //
        
        NSArray *lengths = NSArrayMap(words, ^id(NSString *element) {
            return @( [element length] );
        });
        
        NSArray *uppercaseWords = [words mappedArrayWithMapper: ^id(NSString *element) {
            return [element uppercaseString];
        }];
        
        NSLog(@"word lengths are %@", lengths);
        NSLog(@"uppercase words are %@", uppercaseWords);
        
        //
        // Filtering
        //
        
        NSArray *shortWords = NSArrayFilter(words, ^BOOL(NSString *element) {
            return [element length] < 6;
        });
        
        NSArray *longWords = [words filteredArrayWithFilterer: ^BOOL(NSString *element) {
            return [element length] >= 6;
        }];
        
        NSLog(@"short words are %@", shortWords);
        NSLog(@"long words are %@", longWords);
    }
    return 0;
}
