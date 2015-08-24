//
//  NSArray+Functional.h
//  FunctionalObjC
//
//  Created by jas on 8/23/15.
//  Copyright (c) 2015 iJoshSmith. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef id (^NSArrayElementReducer)(id element, id accumulator);
typedef id (^NSArrayElementMapper)(id element);
typedef BOOL (^NSArrayElementFilterer)(id element);

extern id NSArrayReduce(NSArray *elements, id initialValue, NSArrayElementReducer reducer);
extern NSArray *NSArrayMap(NSArray *elements, NSArrayElementMapper mapper);
extern NSArray *NSArrayFilter(NSArray *elements, NSArrayElementFilterer predicate);

@interface NSArray (Functional)

- (id) reduceWithInitialValue: (id)initialValue reducer: (NSArrayElementReducer)reducer;
- (NSArray *) mappedArrayWithMapper: (NSArrayElementMapper)mapper;
- (NSArray *) filteredArrayWithFilterer: (NSArrayElementFilterer)filterer;

@end
