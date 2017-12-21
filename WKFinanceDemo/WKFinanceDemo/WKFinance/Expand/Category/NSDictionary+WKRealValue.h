//
//  NSDictionary+WKRealValue.h
//  WKFinanceDemo
//
//  Created by 王昆 on 2017/11/17.
//  Copyright © 2017年 wangkun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (WKRealValue)
- (NSDictionary *)wk_dictionaryForKey:(NSString *)key;
- (NSNumber *)wk_numberForKey:(NSString *)key;
- (BOOL)wk_boolForKey:(NSString *)key;
- (NSString *)wk_stringForKey:(NSString *)key;
@end
