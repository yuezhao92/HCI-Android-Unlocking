//
//  main.m
//  PatternLockApp
//
//  Created by Purnama Santo on 11/4/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PatternLockAppAppDelegate.h"

int const maxAttempts = 20; //max time of repetition
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
                @[@"0102050403",
                  @"010204",
                  @"01020406",
                  @"01030502",
                  @"010506",
                  @"010203040506",
                  @"0304060102",
                  @"0205060104",
                  @"020304",
                  @"0104030502",
                  @"02060301",
                  @"01020506",
                  @"02030406",
                  @"0401030502",
                  @"0406050201",
                  @"020106040305",
                  @"040205",
                  @"02010304",
                  @"0406010305",
                  @"02010503"];
    
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([PatternLockAppAppDelegate class]));
    }
}
