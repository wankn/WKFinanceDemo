//
//  NSDictionary+WKRealValue.m
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/11/17.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import "NSDictionary+WKRealValue.h"

@implementation NSDictionary (WKRealValue)

- (id)getObject:(NSDictionary *)dic class:(Class)aClass key:(NSString *)key {
    NSObject *value = [dic objectForKey:key];
    if ([value isKindOfClass:aClass]) {
        return value;
    } else {
        return nil;
    }
}

- (NSDictionary *)wk_dictionaryForKey:(NSString *)key {
    return [self getObject:self class:[NSDictionary class] key:key];
}

- (NSNumber *)wk_numberForKey:(NSString *)key {
    NSObject *result = [self getObject:self class:[NSNumber class] key:key];
    if (result) {
        return (NSNumber *)result;
    }
    result = [self getObject:self class:[NSString class] key:key];
    if (result) {
        return @([(NSString *)result doubleValue]);
    }
    return nil;
}

- (BOOL)wk_boolForKey:(NSString *)key {
    return [[self wk_numberForKey:key] boolValue];
}

- (NSString *)wk_stringForKey:(NSString *)key {
    NSObject *result = (NSString *)[self getObject:self class:[NSString class] key:key];
    if (result) {
        return (NSString *)result;
    }
    result = (NSNumber *)[self getObject:self class:[NSNumber class] key:key];
    if (result) {
        return [NSString stringWithFormat:@"%@", result];
    }
    return nil;
}

@end
