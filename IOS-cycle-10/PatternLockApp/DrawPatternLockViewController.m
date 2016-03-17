//
//  ViewController.m
//  AndroidLock
//
//  Created by Purnama Santo on 11/2/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "DrawPatternLockViewController.h"
#import "DrawPatternLockView.h"
extern NSDate *methodStart;
extern NSDate *methodFinish;

#define MATRIX_SIZE 3
//#define TICK   NSDate *startTime = [NSDate date]
//#define TOCK NSLog(@"%s Time: %f", __func__, -[startTime timeIntervalSinceNow])

@implementation DrawPatternLockViewController


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)loadView {
  [super loadView];
  
  self.view = [[DrawPatternLockView alloc] init];
}


- (void)viewDidLoad
{
  [super viewDidLoad];
  
  self.view.backgroundColor = [UIColor darkGrayColor];
    
    for(int i=0;i<10;i++){
        UIImage *dotImage = [UIImage imageNamed:@"dot_off.png"];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:dotImage
                                                   highlightedImage:[UIImage imageNamed:@"dot_on.png"]];
        imageView.frame = CGRectMake(0, 0, dotImage.size.width/2, dotImage.size.height/2);
        imageView.userInteractionEnabled = YES;
        imageView.tag = i+1;
        [self.view addSubview:imageView];
    }
    

//  for (int i=0; i<2; i++)
//  {
//    for (int j=0; j<3; j++)
//    {
//      UIImage *dotImage = [UIImage imageNamed:@"dot_off.png"];
//      UIImageView *imageView = [[UIImageView alloc] initWithImage:dotImage
//                                                 highlightedImage:[UIImage imageNamed:@"dot_on.png"]];
//      imageView.frame = CGRectMake(0, 0, dotImage.size.width/2, dotImage.size.height/2);
//      imageView.userInteractionEnabled = YES;
//      imageView.tag = j + i*3 + 1;
//      [self.view addSubview:imageView];
//    }
//  }
}


- (void)viewWillLayoutSubviews {
//  int w = 100/MATRIX_SIZE;
//  int h = 100/MATRIX_SIZE;
    int x=80;//move right
    int y=200;//move down
    int diameter = 150;//considering the size of the screen
    int radius = diameter / 2;
    int longSide36 = 0.81*radius;//cos36
    int shortSide36 = 0.5877*radius;//sin36
    int longSide72 = 0.95*radius;//sin72
    int shortSide72 = 0.31*radius;//cos72

  int i=0;
  for (UIView *view in self.view.subviews)
  {
    if ([view isKindOfClass:[UIImageView class]])
    {
//      int x = w*(i/MATRIX_SIZE) + w/2;
//      int y = h*(i%MATRIX_SIZE) + h/2;
        if(i==0){
            view.center = CGPointMake(radius-shortSide72+x, 0+y);
            i++;
        }
        else if(i==1){
            view.center = CGPointMake(radius+shortSide72+x, 0+y);
            i++;
        }
        else if(i==2){
            view.center = CGPointMake(radius-longSide36+x, radius-shortSide36+y);
            i++;
        }
        else if(i==3){
            view.center = CGPointMake(radius+longSide36+x, radius-shortSide36+y);
            i++;
        }
        else if(i==4){
            view.center = CGPointMake(0+x, radius+y);
            i++;
        }
        else if(i==5){
            view.center = CGPointMake(diameter+x, radius+y);
            i++;
        }
        else if(i==6){
            view.center = CGPointMake(radius-longSide36+x, radius+shortSide36+y);
            i++;
        }
        else if(i==7){
            view.center = CGPointMake(radius+longSide36+x, radius+shortSide36+y);
            i++;
        }
        else if(i==8){
            view.center = CGPointMake(radius-shortSide72+x, radius+longSide72+y);
            i++;
        }
        else if(i==9){
            view.center = CGPointMake(radius+shortSide72+x, radius+longSide72+y);
            i++;
        }
        else
            continue;
    }
  }
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
      return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
  } else {
      return YES;
  }
}


- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    methodStart = [NSDate date];
  _paths = [[NSMutableArray alloc] init];
}



- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
  CGPoint pt = [[touches anyObject] locationInView:self.view];
  UIView *touched = [self.view hitTest:pt withEvent:event];
  
  DrawPatternLockView *v = (DrawPatternLockView*)self.view;
  [v drawLineFromLastDotTo:pt];

  if (touched!=self.view) {
    NSLog(@"touched view tag: %d ", touched.tag);
    
    BOOL found = NO;
    for (NSNumber *tag in _paths) {
      found = tag.integerValue==touched.tag;
      if (found)
        break;
    }
    
    if (found)
      return;

    [_paths addObject:[NSNumber numberWithInt:touched.tag]];
    [v addDotView:touched];

    UIImageView* iv = (UIImageView*)touched;
    iv.highlighted = YES;
  }

}


- (void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
  // clear up hilite
  DrawPatternLockView *v = (DrawPatternLockView*)self.view;
  [v clearDotViews];

  for (UIView *view in self.view.subviews)
    if ([view isKindOfClass:[UIImageView class]])
      [(UIImageView*)view setHighlighted:NO];
  
  [self.view setNeedsDisplay];
  
  // pass the output to target action...
  if (_target && _action)
    [_target performSelector:_action withObject:[self getKey]];

}


// get key from the pattern drawn
// replace this method with your own key-generation algorithm
- (NSString*)getKey {
  NSMutableString *key;
  key = [NSMutableString string];

  // simple way to generate a key
  for (NSNumber *tag in _paths) {
    [key appendFormat:@"%02d", tag.integerValue];
  }
    methodFinish = [NSDate date];
    NSTimeInterval executionTime = [methodFinish timeIntervalSinceDate:methodStart];
    NSLog(@"executionTime = %f", executionTime);
    
  return key;
}


- (void)setTarget:(id)target withAction:(SEL)action {
  _target = target;
  _action = action;
}

@end
