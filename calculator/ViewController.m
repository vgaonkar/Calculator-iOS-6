//
//  ViewController.m
//  calculator
//
//  Created by iOS Student on 2/19/13.
//  Copyright (c) 2013 iOS Student. All rights reserved.
//

#import "ViewController.h"
#import "calculations.h"
#import <math.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *display;
@property (nonatomic) double calculatorDisplay;
@property (nonatomic) calculations* operation;
@property (nonatomic) int prevOperation;
@property (nonatomic) BOOL numberFlag;
@property (nonatomic) double tagvalue;
@property (nonatomic) double memory;
@property (nonatomic) BOOL memoryFlag;
@end


@implementation ViewController

-(calculations*) operation
{
    if (!_operation)
    {
        _operation = [[calculations alloc]init];
    }
    
    return _operation;
}

- (IBAction)buttonTapped:(UIButton *)sender {
    
    self.tagvalue = sender.tag;
    if (sender.tag < 10||sender.tag==18)
    {
        if(self.prevOperation!=0)
        {
            self.prevOperation=0;
            self.display.text=@"";
        }
        
        //number button tapped
        if (sender.tag < 10)
        {
            self.display.text = [self.display.text stringByAppendingString:[NSString stringWithFormat:@"%d", [sender tag]]];
        }
        
        //Memory recall
        if (sender.tag == 18)
        {
            //NSLog(@"%f IF",self.memory);
            if (self.memoryFlag==YES)
            {
                //NSLog(@"%f",self.memory);
                self.display.text = [NSString stringWithFormat:@"%g", self.memory];
            }
            
        }

        self.numberFlag = YES;
        
    }
    
        
    else if (sender.tag == 10)
    {
           self.display.text = [self.display.text stringByAppendingString:self.display.text = @"."];

    }
    
    else if (sender.tag > 10)
    {
        //plus - minus key
        if(sender.tag == 11)
        {
            
            self.calculatorDisplay = [self.display.text doubleValue];
            self.calculatorDisplay*=-1;
            self.display.text = [NSString stringWithFormat:@"%g", self.calculatorDisplay];
            
        }
        
      //Memory store
      else if (sender.tag == 17)
      {
          self.calculatorDisplay = [self.display.text doubleValue];
          self.memory = self.calculatorDisplay;
          NSLog(@"%f", self.memory);
          self.memoryFlag = YES;
          self.display.text = [NSString stringWithFormat:@"%g", self.calculatorDisplay];
      }
        
          
      //Memory clear
      else if (sender.tag == 19)
      {
          self.memoryFlag = NO;
          self.memory = 0;
      }
        
      //reciprocal
      else if (sender.tag == 21)
      {
          self.calculatorDisplay = [self.display.text doubleValue];
          self.calculatorDisplay = 1 / self.calculatorDisplay;
          self.display.text = [NSString stringWithFormat:@"%g", self.calculatorDisplay];
          self.numberFlag = YES;
      }
        
      //square root
      else if (sender.tag == 22)
      {
          self.calculatorDisplay = [self.display.text doubleValue];
          self.calculatorDisplay = sqrt(self.calculatorDisplay);
          self.display.text = [NSString stringWithFormat:@"%g", self.calculatorDisplay];
          self.numberFlag = YES;
      }
        
      //sin
      else if (sender.tag == 23)
      {
          self.calculatorDisplay = [self.display.text doubleValue];
          self.calculatorDisplay = sin(self.calculatorDisplay);
          self.display.text = [NSString stringWithFormat:@"%g", self.calculatorDisplay];
          self.numberFlag = YES;
      }
        
      //cos
      else if (sender.tag == 24)
      {
          self.calculatorDisplay = [self.display.text doubleValue];
          self.calculatorDisplay = cos(self.calculatorDisplay);
          self.display.text = [NSString stringWithFormat:@"%g", self.calculatorDisplay];
          self.numberFlag = YES;
      }
        
      //tan
      else if (sender.tag == 25)
      {
          self.calculatorDisplay = [self.display.text doubleValue];
          self.calculatorDisplay = tan(self.calculatorDisplay);
          self.display.text = [NSString stringWithFormat:@"%g", self.calculatorDisplay];
          self.numberFlag = YES;
      }
        
      //pi
      else if (sender.tag == 26)
      {
          self.calculatorDisplay = [self.display.text doubleValue];
          self.calculatorDisplay = 3.14159265358979;
          self.display.text = [NSString stringWithFormat:@"%g", self.calculatorDisplay];
          self.numberFlag = YES;
      }
        
      //exponent (e)
      else if (sender.tag == 27)
      {
          self.calculatorDisplay = [self.display.text doubleValue];
          self.calculatorDisplay = 2.7182818245904;
          self.display.text = [NSString stringWithFormat:@"%g", self.calculatorDisplay];
          self.numberFlag = YES;
      }
        
      else if (self.numberFlag == YES)
      {
            self.calculatorDisplay = [self.display.text doubleValue];
            [self.operation performMathOperations:sender.tag :self.calculatorDisplay];
            self.display.text = [NSString stringWithFormat:@"%g", self.operation.result];
            self.prevOperation=sender.tag;
           
            
            if(sender.tag>=13&&sender.tag<=16)
            self.numberFlag = NO;
            else
            self.numberFlag=YES;
      }
        
      //clear button
      if (sender.tag == 20)
      {
          self.calculatorDisplay = 0;
          self.display.text = @"0";
          self.operation.result = 0;
          self.operation.counter = 0;
      }
        
   }
    
}


@end
