//
//  OGLoggerManager.m
//  objc-generator
//
//  Created by Juan Cruz Ghigliani on 20/04/11.
//  Copyright 2011 Juan Cruz Ghigliani. All rights reserved.
//

#import "OGLoggerManager.h"
#import "OGLoggerOutputFile.h"
#import "OGLoggerOutputConsole.h"

static OGLoggerManager * _sharedInstance = nil;
static OGLogger * _sharedConsoleLogger = nil;
static OGLogger * _sharedFileLogger = nil;
static NSMutableDictionary * _loggers = nil;
static NSDictionary * _loggersConfig = nil;

@implementation OGLoggerManager


+(OGLoggerManager*)sharedInstance
{
    @synchronized([OGLoggerManager class])
    {
		if (!_sharedInstance)
			//if the instance doesn,t exist create it
			[[[self alloc] init]autorelease];
		
		return _sharedInstance;
    }
	
	return nil;
	
}


+(id)alloc
{
    @synchronized([OGLoggerManager class])
    {
		//check if the instance already exist
		NSAssert(_sharedInstance == nil, @"Attempted to allocate a second instance of a singleton.");
		//create the instance and save the reference in the static attribute
		_sharedInstance = [super alloc];
		return _sharedInstance;
    }
    return nil;
}

-(id)copy {
    //avoid the copy of the instance
    return self;
}

-(id)retain {
    return self;
}

-(NSUInteger)retainCount {
    return UINT_MAX;  //denotes an object that cannot be release
}


+(OGLogger*)console{

	if (!_sharedConsoleLogger)
		//if the instance doesn,t exist create it
		_sharedConsoleLogger = [[OGLogger alloc] init];
	
	return _sharedConsoleLogger;


}


+(OGLogger*)file{
	
	if (!_sharedFileLogger){
		//if the instance doesn,t exist create it
		_sharedFileLogger = [[OGLogger alloc] init];
		[_sharedFileLogger setOutput:[[[OGLoggerOutputFile alloc]init]autorelease]];
	}
	return _sharedFileLogger;
	
	
}

+(OGLogger*)loggerForClassName:(NSString *)_className{

	
	if (!_loggers){
		//if the instance doesn,t exist create it
		_loggers = [[NSMutableDictionary alloc] init];
	}

	NSDictionary * conf =[OGLoggerManager loggersConfig];
	
	NSDictionary * confClass = [conf objectForKey:_className];
	
	if (confClass == nil) {
		confClass = [conf objectForKey:@"default"];
	}

	OGLogger * loggerForClass = nil;
	if (confClass == nil) {
		loggerForClass = [OGLoggerManager console];
	}else {
		//busco en loggers si hay uno de esa clase
		//sino lo creo
		NSString * LoggerClass;
		LoggerClass = [confClass objectForKey:@"OGLoggerClass"];
		
		loggerForClass = [_loggers objectForKey:LoggerClass];
		
		if (loggerForClass == nil) {
			loggerForClass = [[[NSClassFromString(LoggerClass) alloc] init] autorelease];
			[_loggers setObject:loggerForClass forKey:LoggerClass];
			
			OGLoggerOutput * loggerOutputForClass = nil;
			NSString * LoggerOutputClass = nil;
			LoggerOutputClass = [confClass objectForKey:@"OGLoggerOutputClass"];
			loggerOutputForClass = [[[NSClassFromString(LoggerOutputClass) alloc] init] autorelease];
			[loggerForClass setOutput:loggerOutputForClass];
			[loggerForClass setContext:[confClass objectForKey:@"OGLoggerOutputContext"]];

			NSString *loggerLevelForClass = [confClass objectForKey:@"OGLoggerLogLevel"];
			if (loggerLevelForClass != nil)
			{
				NSArray *logLevelOrder = [NSArray arrayWithObjects: @"OGLogLevelError", @"OGLogLevelWarning", @"OGLogLevelInfo", @"OGLogLevelDebug", nil];
				[loggerForClass setLevel:1 + [logLevelOrder indexOfObject:loggerLevelForClass]]; // add one because the array is 0-indexed but the enum is 1-indexed
			}
		}
		
	}
	
	return loggerForClass;
}

+(NSDictionary*) loggersConfig{
	return _loggersConfig;
}
+(void) setLoggersConfig:(NSDictionary*)_dic{

	if (_loggersConfig != nil){
		[_loggersConfig release];
	}
	_loggersConfig = [_dic retain];

}
@end
