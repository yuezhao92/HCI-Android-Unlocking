//
//  PatternLockAppViewController.m
//  PatternLockApp
//
//  Created by Purnama Santo on 11/4/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "PatternLockAppViewController.h"
#import "DrawPatternLockViewController.h"
extern NSString* fileName;
extern int counter;
extern int currentIdx;
extern int const maxAttempts;
extern NSArray *patternDictionary;
extern NSTimeInterval executionTime;
@implementation PatternLockAppViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return NO;
}


- (void)lockEntered:(NSString*)key
{
    NSLog(@"user input: %@", key);
    NSLog(@"key: %@", patternDictionary[currentIdx]);
    
    //真正的手机上该用的地址
    NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:fileName];
    //    NSString *filePath = @"/Users/FredQiu/Desktop/HCI-Android-Unlocking/IOS-cycle6/PatternLockApp/File.txt";
    // hardcoded
    NSFileHandle *fileHandle = [NSFileHandle fileHandleForWritingAtPath:filePath];

    NSLog(@"executionTime = %f", executionTime);
    NSLog(@"file path = %@", filePath);
    
    
    if (![key isEqualToString:patternDictionary[currentIdx]])
    {
 //      [self dismissModalViewControllerAnimated:YES];
//        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error"
//                                                            message:@"Wrong pattern!"
//                                                           delegate:nil
//                                                  cancelButtonTitle:nil
//                                                  otherButtonTitles:@"OK", nil];
//        [alertView show];
        [self dismissModalViewControllerAnimated:YES];
        counter = counter - 1;
        
        //打算save的string，也就是execution time
        NSString *stringToWrite = [NSString stringWithFormat: @"%i attempt executionTime = %f pattern matched = No\n", counter,executionTime];
        
        if (fileHandle)
        {
            [fileHandle seekToEndOfFile];
            [fileHandle writeData:[stringToWrite dataUsingEncoding:NSUTF8StringEncoding]];
            [fileHandle closeFile];
        }
        else
        {
            [stringToWrite writeToFile:filePath
                            atomically:NO
                              encoding:NSStringEncodingConversionAllowLossy
                                 error:nil];
        }
        
        if(counter <= 0)
            exit(0); // exit the program

    }
    else
    {
        [self dismissModalViewControllerAnimated:YES];
        counter = counter - 1;
        
        NSString *stringToWrite = [NSString stringWithFormat: @"%i attempt executionTime = %f pattern matched = True\n", (maxAttempts - counter),executionTime];
        if (fileHandle)
        {
            [fileHandle seekToEndOfFile];
            [fileHandle writeData:[stringToWrite dataUsingEncoding:NSUTF8StringEncoding]];
            [fileHandle closeFile];
        }
        else
        {
            [stringToWrite writeToFile:filePath
                            atomically:NO
                              encoding:NSStringEncodingConversionAllowLossy
                                 error:nil];
        }
        if(counter <= 0)
            exit(0); // exit the program

    }
    
    
}


- (IBAction)lockClicked:(id)sender {
    DrawPatternLockViewController *lockVC = [[DrawPatternLockViewController alloc] init];
    [lockVC setTarget:self withAction:@selector(lockEntered:)];
    [self presentModalViewController:lockVC animated:YES];
}

@end
