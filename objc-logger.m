#import <Foundation/Foundation.h>
#import "OGLoggerManager.h"
#import "LoggedInherited.h"
#import "LoggedWithAddition.h"
#import "Logged.h"
#include <asl.h>  

int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];

	[[OGLoggerManager console] setContext:@"TESTING DEBUG LEVEL"];
    [[OGLoggerManager console] setLevel:OGLogLevelDebug];
    [[OGLoggerManager console] error:@"Error Message"];
    [[OGLoggerManager console] errorWithFormat:@"Error Message %i",2];
    [[OGLoggerManager console] warning:@"Warning Message"];
    [[OGLoggerManager console] warningWithFormat:@"Warning Message %i",2];
    [[OGLoggerManager console] info:@"Info Message"];
    [[OGLoggerManager console] infoWithFormat:@"Info Message %i",2];
    [[OGLoggerManager console] debug:@"Debug Message"];
    [[OGLoggerManager console] debugWithFormat:@"Debug Message %i",2];
	

   	[[OGLoggerManager console] setContext:@"TESTING ERROR LEVEL"];
    [[OGLoggerManager console] setLevel:OGLogLevelError];
    [[OGLoggerManager console] error:@"Error Message (Should appear)"];
    [[OGLoggerManager console] errorWithFormat:@"Error Message %i  (Should appear)",2];
    [[OGLoggerManager console] warning:@"Warning Message (Shouldn't appear)"];
    [[OGLoggerManager console] warningWithFormat:@"Warning Message %i (Shouldn't appear)",2];
    [[OGLoggerManager console] info:@"Info Message (Shouldn't appear)"];
    [[OGLoggerManager console] infoWithFormat:@"Info Message %i (Shouldn't appear)",2];
    [[OGLoggerManager console] debug:@"Debug Message (Shouldn't appear)"];
    [[OGLoggerManager console] debugWithFormat:@"Debug Message %i (Shouldn't appear)",2];
	
	
	[[OGLoggerManager file] setContext:@"TESTING FILE DEBUG LEVEL"];
    [[OGLoggerManager file] setLevel:OGLogLevelDebug];
    [[OGLoggerManager file] error:@"Error Message"];
    [[OGLoggerManager file] errorWithFormat:@"Error Message %i",2];
    [[OGLoggerManager file] warning:@"Warning Message"];
    [[OGLoggerManager file] warningWithFormat:@"Warning Message %i",2];
    [[OGLoggerManager file] info:@"Info Message"];
    [[OGLoggerManager file] infoWithFormat:@"Info Message %i",2];
    [[OGLoggerManager file] debug:@"Debug Message"];
    [[OGLoggerManager file] debugWithFormat:@"Debug Message %i",2];
	
	
	[[OGLoggerManager console] error:[OGLogger autoDescribe:[OGLoggerManager console]]];
	
	
	Logged * logged = [[Logged alloc]init];
	[logged methodOne];
	[logged methodTwo];
	[logged release];
	
	LoggedInherited * logged2 = [[LoggedInherited alloc]init];
	[logged2 methodOne];
	[logged2 methodTwo];
	[logged2 release];
	
	LoggedWithAddition * logged3 = [[LoggedWithAddition alloc]init];
	[logged3 methodOne];
	[logged3 methodTwo];
	[logged3 release];
	
	[pool drain];
    return 0;
}
