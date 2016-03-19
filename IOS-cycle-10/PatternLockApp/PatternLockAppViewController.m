//
//  PatternLockAppViewController.m
//  PatternLockApp
//
//  Created by Purnama Santo on 11/4/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "PatternLockAppViewController.h"
#import "DrawPatternLockViewController.h"

extern int counter;
extern NSArray *myArray;

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
  myArray = @[@"010203050604", @"010203050406",@"010204060305",@"010205030406",@"06050402010302",@"030405020106", @"010203040506", @"050201030406", @"060504030201", @"030205060104"];
  NSLog(@"key: %@", key);

  if (![key isEqualToString:myArray[counter]]) {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:@"Wrong pattern!"
                                                       delegate:nil
                                              cancelButtonTitle:nil 
                                              otherButtonTitles:@"OK", nil];
    [alertView show];
     counter = counter + 1;
  }
  else
  {
      [self dismissModalViewControllerAnimated:YES];
       counter = counter + 1;
  }
    
    
}


//- (NSArray) generateRandom:(int)n
//{
//    NSArray *ret;
//    for(int i=0;i<n;i++){
//        NSString *str = [[NSString alloc] init];
//        for(int j=0;j<6;j++){
//            str = @"0"+arc4random_uniform(10);
//        }
//        NSArray[i]=*str;
//    }
//    return NSArray;
//}

- (IBAction)lockClicked:(id)sender {
  DrawPatternLockViewController *lockVC = [[DrawPatternLockViewController alloc] init];
     //NSDate *methodStart = [NSDate date];
  [lockVC setTarget:self withAction:@selector(lockEntered:)];
    //NSDate *methodFinish = [NSDate date];
    //NSTimeInterval executionTime = [methodFinish timeIntervalSinceDate:methodStart];
    //NSLog(@"executionTime = %f", executionTime);
  [self presentModalViewController:lockVC animated:YES];
}

@end
