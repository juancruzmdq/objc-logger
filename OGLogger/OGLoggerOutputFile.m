//
//  OGLoggerOutputFile.m
//  objc-logger
//
//  Created by Juan Cruz Ghigliani on 20/04/11.
//  Copyright 2011 Juan Cruz Ghigliani. All rights reserved.
//

#import "OGLoggerOutputFile.h"


@implementation OGLoggerOutputFile


-(void)write:(NSString *)_msg{
	printf("(File) %s - %s\n",[[NSString stringWithFormat:@"%@",[NSDate date] ]  UTF8String],[_msg UTF8String]);
}



@end
