//
//  LoggedWithAddition.m
//  objc-logger
//
//  Created by Juan Cruz Ghigliani on 29/04/11.
//  Copyright 2011 Juan Cruz Ghigliani. All rights reserved.
//

#import "LoggedWithAddition.h"
#import "LoggedWithAddition+OGLogger.h"

@implementation LoggedWithAddition


-(void)methodOne{
	[self.logger error:@"LoggedWithAddition Method One"];
}
-(void)methodTwo{
	[self.logger  error:@"LoggedWithAddition Method Two"];
}

@end
