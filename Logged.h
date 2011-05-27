//
//  Logged.h
//  objc-logger
//
//  Created by Juan Cruz Ghigliani on 29/04/11.
//  Copyright 2011 Juan Cruz Ghigliani. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OGLogger.h"

@interface Logged : NSObject {

}
@property(readonly)OGLogger * logger;

-(void)methodOne;
-(void)methodTwo;
@end
