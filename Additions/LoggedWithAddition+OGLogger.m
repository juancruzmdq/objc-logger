//
//  LoggedWithAddition+OGLogger.m
//  objc-logger
//
//  Created by Juan Cruz Ghigliani on 29/04/11.
//  Copyright 2011 Juan Cruz Ghigliani. All rights reserved.
//

#import "LoggedWithAddition+OGLogger.h"
#import "OGLoggerManager.h"
#import "OGLogger.h"

@implementation LoggedWithAddition (OGLoggerAddition)

-(OGLogger *) logger{
	NSLog(@"Class Name: %@",NSStringFromClass ([self class]));
	return [OGLoggerManager console];
}

@end
