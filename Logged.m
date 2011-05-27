//
//  Logged.m
//  objc-logger
//
//  Created by Juan Cruz Ghigliani on 29/04/11.
//  Copyright 2011 Juan Cruz Ghigliani. All rights reserved.
//

#import "Logged.h"
#import "OGLogger.h"
#import "OGLoggerManager.h"

@implementation Logged

-(OGLogger *)logger{
	return [OGLoggerManager console];
}

-(void)methodOne{
	[self.logger  error:@"Logged Method One"];
}
-(void)methodTwo{
	[self.logger  error:@"Logged Method Two"];
}

@end
