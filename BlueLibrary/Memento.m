//
//  Memento.m
//  BlueLibrary
//
//  Created by chung2014 on 3/7/14.
//  Copyright (c) 2014 Eli Ganem. All rights reserved.
//

#import "Memento.h"

#define kMemento @"Memento"

@interface Memento ()

@property (strong, nonatomic, readwrite) NSDictionary *state;

@end

@implementation Memento

- (id)initWithState:(NSDictionary *)userinfo
{
    self = [super init];
    
    if (self) {
        _state = userinfo;
    }
    
    return self;
}

- (void)saveToDisk
{
    [[NSUserDefaults standardUserDefaults] setObject:self.state forKey:kMemento];
}

+ (Memento *)restoreMemento
{
    NSDictionary *dict = [[NSUserDefaults standardUserDefaults] objectForKey:kMemento];
    if (dict) {
        return [[Memento alloc] initWithState:dict];
    }
    
    return nil;
}

@end
