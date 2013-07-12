//
//  CouchBaseViews.m
//  CouchBaseViews
//
//  Created by David Oram on 25/05/13.
//  Copyright (c) 2013 David Oram. All rights reserved.
//

#import "CouchBaseViews.h"

@implementation CouchBaseViews

@synthesize database;


- (void)useDatabase:(CouchDatabase*)theDatabase {
    self.database = theDatabase;
    
    // Alter the global log level. 1 = on, 0 = off
    gCouchLogLevel = 0;

    // Get the design document
    CouchDesignDocument* design = [database designDocumentWithName: @"default"];
    
    // Create a 'view' containing documents ordered by name
    [design defineViewNamed: @"byName" mapBlock: MAPBLOCK({
        id name = [doc objectForKey: @"name"];
        if (name) emit(name, doc);
    }) version: @"1.0"];
}


@end
