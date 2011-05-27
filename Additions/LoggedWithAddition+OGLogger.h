//
//  LoggedWithAddition+OGLogger.h
//  objc-logger
//
//  Created by Juan Cruz Ghigliani on 29/04/11.
//  Copyright 2011 Juan Cruz Ghigliani. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OGLogger.h"
#import "LoggedWithAddition.h"

@interface LoggedWithAddition (OGLoggerAddition)

-(OGLogger *) logger;


@end
