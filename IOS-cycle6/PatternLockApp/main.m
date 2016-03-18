//
//  main.m
//  PatternLockApp
//
//  Created by Purnama Santo on 11/4/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PatternLockAppAppDelegate.h"

int const maxAttempts = 10; //max time of repetition
int counter = maxAttempts; //
int currentIdx = 1; // current pattern used
NSArray  *patternDictionary = nil;
NSDate *unlockStart = nil;
NSDate *unlockFinish = nil;
NSTimeInterval executionTime;
NSString *fileName = nil;

int main(int argc, char *argv[])
{
    NSDate * currDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设置格式：zzz表示时区
    [dateFormatter setDateFormat:@"yyyy-MM-dd-HH-mm-ss-zzz"];
    //NSDate转NSString
    fileName = [dateFormatter stringFromDate:currDate];
    
    fileName = [fileName stringByReplacingOccurrencesOfString:@"-" withString:@""];
    
     fileName = [NSString stringWithFormat: @"%@.txt", fileName];
    //输出currentDateString
    NSLog(@"%@",fileName);
    patternDictionary =
                @[@"010205",
                  @"010204",
                  @"01020406",
                  @"010305",
                  @"010506",
                  @"0102",
                  @"030406",
                  @"020506",
                  @"020304",
                  @"010403",
                  @"02060301",
                  @"01020506",
                  @"02030406",
                  @"040103",
                  @"040605",
                  @"020106",
                  @"040205",
                  @"02010304",
                  @"040601",
                  @"02010503"];
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([PatternLockAppAppDelegate class]));
    }
}
