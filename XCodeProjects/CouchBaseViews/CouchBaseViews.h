//
//  CouchBaseViews.h
//  CouchBaseViews
//
//  Created by David Oram on 25/05/13.
//  Copyright (c) 2013 David Oram. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CouchCocoa/CouchCocoa.h>

@interface CouchBaseViews : NSObject

@property(nonatomic, strong)CouchDatabase *database;

-(void)useDatabase:(CouchDatabase*)theDatabase;

@end


