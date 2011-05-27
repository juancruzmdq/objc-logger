//
//  LoggedInherited.m
//  objc-logger
//
//  Created by Juan Cruz Ghigliani on 29/04/11.
//  Copyright 2011 Juan Cruz Ghigliani. All rights reserved.
//

#import "LoggedInherited.h"


@implementation LoggedInherited


-(void)methodOne{
	[self.logger error:@"LoggedInherited Method One"];
}
-(void)methodTwo{
	[self.logger  error:@"LoggedInherited Method Two"];
}

@end
