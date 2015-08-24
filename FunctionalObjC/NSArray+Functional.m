//
//  NSArray+Functional.m
//  FunctionalObjC
//
//  Created by jas on 8/23/15.
//  Copyright (c) 2015 iJoshSmith. All rights reserved.
//

#import "NSArray+Functional.h"

id NSArrayReduce(NSArray *elements, id initialValue, NSArrayElementReducer reducer) {
    id accumulator = initialValue;
    for (id element in elements) {
        accumulator = reducer(element, accumulator);
    }
    return accumulator;
}

NSArray *NSArrayMap(NSArray *elements, NSArrayElementMapper mapper) {
    return NSArrayReduce(elements,
                         [NSMutableArray arrayWithCapacity: [elements count]],
                         ^id(id element, NSMutableArray *accumulator) {
                             id mappedElement = mapper(element) ?: [NSNull null];
                             [accumulator addObject: mappedElement];
                             return accumulator;
                         });
}

NSArray *NSArrayFilter(NSArray *elements, NSArrayElementFilterer filterer) {
    return NSArrayReduce(elements,
                         [NSMutableArray array],
                         ^id(id element, NSMutableArray *accumulator) {
                             if ( filterer(element) ) {
                                 [accumulator addObject: element];
                             }
                             return accumulator;
                         });
}

@implementation NSArray (Functional)

- (id) reduceWithInitialValue: (id)initialValue reducer: (NSArrayElementReducer)reducer {
    return NSArrayReduce(self, initialValue, reducer);
}

- (NSArray *) mappedArrayWithMapper: (NSArrayElementMapper)mapper {
    return NSArrayMap(self, mapper);
}

- (NSArray *) filteredArrayWithFilterer: (NSArrayElementFilterer)filterer {
    return NSArrayFilter(self, filterer);
}

@end
