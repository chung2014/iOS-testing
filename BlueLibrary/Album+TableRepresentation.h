//
//  Album+TableRepresentation.h
//  BlueLibrary
//
//  Created by chung2014 on 28/6/14.
//  Copyright (c) 2014 Eli Ganem. All rights reserved.
//

#import "Album.h"

@interface Album (TableRepresentation)

- (NSDictionary*)tr_tableRepresentation;

@end
