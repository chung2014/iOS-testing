//
//  LibraryAPI.m
//  BlueLibrary
//
//  Created by chung2014 on 28/6/14.
//  Copyright (c) 2014 Eli Ganem. All rights reserved.
//

#import "LibraryAPI.h"
#import "PersistencyManager.h"
#import "HTTPClient.h"

@interface LibraryAPI () {
    PersistencyManager *persistencyManager;
    HTTPClient *httpClient;
    BOOL isOnline;
}

@end

@implementation LibraryAPI

- (id)init
{
    self = [super init];
    
    if (self) {
        persistencyManager = [[PersistencyManager alloc] init];
        httpClient = [[HTTPClient alloc] init];
        isOnline = NO;
    }
    
    return self;
}

+ (LibraryAPI *)sharedInstance
{
     //1
    static LibraryAPI *_shareInstance = nil;
    
    //2
    static dispatch_once_t oncePredicate;
    
    //3
    dispatch_once(&oncePredicate, ^{
        _shareInstance = [[LibraryAPI alloc] init];
    });
    
    return _shareInstance;
}

- (NSArray *)getAlbums
{
    return [persistencyManager getAlbums];
}

- (void)addAlbum:(Album *)album atIndex:(int)index
{
    [persistencyManager addAlbum:album atIndex:index];
    if (isOnline)
    {
        [httpClient postRequest:@"/api/addAlbum" body:[album description]];
    }
}

- (void)deleteAlbumAtIndex:(int)index
{
    [persistencyManager deleteAlbumAtIndex:index];
    if (isOnline)
    {
        [httpClient postRequest:@"/api/deleteAlbum" body:[@(index) description]];
    }
}

@end
