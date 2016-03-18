//
//  main.m
//  PatternLockApp
//
//  Created by Purnama Santo on 11/4/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PatternLockAppAppDelegate.h"

int counter = 10; //  max time of repetition
int currentIdx = 1; // current pattern used
NSArray  *patternDictionary = nil;
NSDate *unlockStart = nil;
NSDate *unlockFinish = nil;
NSTimeInterval executionTime;

int main(int argc, char *argv[])
{
    patternDictionary = @[@"0102030609",
                @"010203",
                @"0104070809",
                @"01040708",
                @"0105090603",
                @"0204050609",
                @"0102030507",
                @"06050407",
                @"02050807",
                @"020508",
                @"0305070809",
                @"0306050407",
                @"010203050708",
                @"0302010407",
                @"03060501",
                @"0905010407",
                @"0302050407",
                @"08050401",
                @"06050201",
                @"0302010407"];
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([PatternLockAppAppDelegate class]));
    }
}
