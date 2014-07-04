//
//  Memento.h
//  BlueLibrary
//
//  Created by chung2014 on 3/7/14.
//  Copyright (c) 2014 Eli Ganem. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Memento : NSObject

- (id)initWithState:(NSDictionary *)userinfo;

- (void)saveToDisk;
+ (Memento *)restoreMemento;

@property (strong, nonatomic, readonly) NSDictionary *state;

@end
