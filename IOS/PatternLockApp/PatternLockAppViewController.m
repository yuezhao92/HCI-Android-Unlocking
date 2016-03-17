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
  myArray = @[@"0102030609", @"0102030507",@"0102030507"];
  NSLog(@"key: %@", key);

  if (![key isEqualToString:myArray[counter]]) {
//      [self dismissModalViewControllerAnimated:YES];

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


- (IBAction)lockClicked:(id)sender {
  DrawPatternLockViewController *lockVC = [[DrawPatternLockViewController alloc] init];
  [lockVC setTarget:self withAction:@selector(lockEntered:)];
  [self presentModalViewController:lockVC animated:YES];
}

@end
